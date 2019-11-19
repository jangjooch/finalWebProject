package web.service;

import java.util.List;

import javax.annotation.PreDestroy;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.drone.DroneDao;
import web.dao.drone.DroneMissionDao;
import web.dao.log.LogDao;
import web.dao.mission.MissionDao;
import web.dto.drone.DroneDto;
import web.dto.request.RequestDto;

@Service
public class MqttService {
	private static final Logger logger = LoggerFactory.getLogger(MqttService.class);
	
	private MqttClient mqttclient;
	
	@Autowired
	private DroneMissionDao droneMissionDao;
	@Autowired
	private MissionDao missionDao;
	@Autowired
	private DroneDao droneDao;
	@Autowired
	private LogDao logDao;
	
	// 기본 생성자 -> 서비스 객체 생성 시 MqttConnect 설정
	public MqttService() {
		mqttConnect();
		
	}
	
	// 연결 설정
	private void mqttConnect() {
		try {
			mqttclient = new MqttClient("tcp://106.253.56.124:1881", MqttClient.generateClientId(), null);
			mqttclient.connect();
			logger.info("MQTT 연결 성공");
			receiveMessage();
			logger.info("subScribe 성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 연결 끊기
	private void mqttDisconnect() {
		try {
			mqttclient.disconnectForcibly(1);
			mqttclient.close(true);
			logger.info("MQTT 연결 끊김");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 디플로이, 서버 죽일 때 단 한번만 실행
	@PreDestroy
	private void destory() {
		mqttDisconnect();
	}
	
	// 메세지 받기
	private void receiveMessage(){
		mqttclient.setCallback(new MqttCallback() {
			@Override
			public void messageArrived(String topic, MqttMessage message){
				byte[] bytes = message.getPayload();
				String json = new String(bytes);
				logger.info("json : " + json);
				JSONObject jsonObject = new JSONObject(json);
				
				// 드론 리스트 요청
				if(jsonObject.get("msgid").equals("DroneRequest")) {
					new Thread() {
						@Override
						public void run() {
							sendDroneMessage("/drone/select/sub");
						}
					}.start();
				}else if(jsonObject.get("msgid").equals("DroneSelect")) {
					// 드론 상태 업데이트
					int rows = droneDao.updateDrontState(Integer.parseInt(String.valueOf(jsonObject.get("DroneNum"))));
				}
				
				// 메세지 받거나, 새로고침 일 경우에만 요청 리스트 보내기
				if(jsonObject.get("msgid").equals("dataRequest") ) {
					new Thread() {
						@Override
						public void run() {
							sendMessage("/gcs/missionIn");
						}
					}.start();
				// 업로드 시 - insert drone_mission	
				}else if(jsonObject.get("msgid").equals("missionSpots")) {
					JSONArray jsonArray = new JSONArray(jsonObject.get("missionSpots").toString());
					
					int d_number = (int) jsonObject.get("droneNumber");   // 드론 번호 가져오기
					int re_num = (int) jsonObject.get("missionNumber");   // 요청 번호 가져오기
					int d_m_number = logDao.getDMNumCount(re_num);
					
					JSONArray history = new JSONArray();
					for(int i=0; i<jsonArray.length(); i++) {
						JSONObject get = (JSONObject) jsonArray.get(i);
						JSONObject array = new JSONObject();
						array.put("seq", get.get("seq"));
						array.put("x", get.get("x"));
						array.put("y", get.get("y"));
						history.put(array);
					}
					
					// 미션 내용
					String d_m_start = history.toString();
					
					/* 업로드를 여러번 할 경우 */
					// 로그가 인서트가 안됬을 경우
					if(d_m_number == 0) {
						System.out.println("실행");
						logDao.insertDroneMission(d_number, re_num, d_m_start);
						// 요청을 상태 값을 바꿔야함
						missionDao.updateSuccessChainge3Eseo4(re_num); // -> 요청 상태  : 수행중
					// 로그가 인서트 됬을 경우
					}else {
						logDao.updateDroneMission(d_number, re_num, d_m_start);
					}
				
				// 요청완료
				}else if(jsonObject.get("msgid").equals("missionStatus")) {
					
					int re_num = (int) jsonObject.get("missionNumber");   // 요청 번호 가져오기
					int d_number = (int) jsonObject.get("droneNumber"); // 드론 번호 가져오기
					
					missionDao.updateSuccessChainge4Eseo5(re_num);    // 요청 상태 업데이트 : 완료
					logDao.getDroneMissionUpdate(re_num);             // 완료 시간 업데이트
					droneDao.updateDroneState1(Integer.parseInt(String.valueOf(jsonObject.get("droneNumber"))));
				}
				
				// 이상종료
				if(jsonObject.get("msgid").equals("droneReset")) {
					// 드론 상태 원상복귀
					droneDao.updateDroneState1(Integer.parseInt(String.valueOf(jsonObject.get("droneNumber"))));
					
					int re_num = Integer.parseInt(String.valueOf(jsonObject.get("missionNumber")));
					int d_number = Integer.parseInt(String.valueOf(jsonObject.get("droneNumber")));
					
					if(re_num != -1) {
						missionDao.updateRequestSuccessChangeRefusal(re_num);
						droneMissionDao.updateMissionDroneFail(re_num);
					}
				}
				
			}
			
			@Override
			public void connectionLost(Throwable cause) {
			}

			@Override
			public void deliveryComplete(IMqttDeliveryToken token) {
			}
			
		});
		try {
			mqttclient.subscribe("/web/missionStatus");
		} catch (MqttException e) {
			e.printStackTrace();
		}
	}
	
	// 드론 list 보내기 -> gcs
	public void sendDroneMessage(String topic) {
		logger.info("실행");
		JSONArray jsonArray = new JSONArray();
		List<DroneDto> list = droneDao.gcsDroneList();
		
		for(DroneDto request: list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("DroneNum", request.getD_number());
			jsonObject.put("DroneModel", request.getD_model());
			jsonObject.put("DroneState", request.getD_status());
			jsonArray.put(jsonObject);
		}
		
		try {
			mqttclient.publish(topic, jsonArray.toString().getBytes(), 0, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 요청 테이블 gcs에 보내기 - gcs에서 요청
	public void sendMessage(String topic) {
		JSONArray jsonArray = new JSONArray();
		List<RequestDto> list = missionDao.mqttAllTable();
		
		for(RequestDto request : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("missionNumber", request.getRe_num());
			jsonObject.put("lat", request.getRe_location_x());
			jsonObject.put("lng", request.getRe_location_y());
			jsonArray.put(jsonObject);
		}
		
		try {
			mqttclient.publish(topic, jsonArray.toString().getBytes(), 0, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 미션 수락 -> 안드로이드에 전송
	public void missionAcceptance(int re_num, int check) {
		JSONObject jsonObject = new JSONObject();
		
		if(check == 1) {
			jsonObject.put("msgid", "missionStatus");
			jsonObject.put("status", "Mission Deny");
			jsonObject.put("missionNumber", re_num);
		}else {
			jsonObject.put("msgid", "missionStatus");
			jsonObject.put("status", "Mission Accept");
			jsonObject.put("missionNumber", re_num);
		}
		
		try {
			mqttclient.publish("/android/page1", jsonObject.toString().getBytes(), 0, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 적재 상태 보내기
	public void missionLoad(int re_num, int load) {
		
		JSONObject jsonObject = new JSONObject();
		
		// load = 2 -> 물품 적재중
		if(load == 2) {
			jsonObject.put("msgid", "missionStatus");
			jsonObject.put("status", "Package Loading...");
			jsonObject.put("missionNumber", re_num);
		}else {
			jsonObject.put("msgid", "missionStatus");
			jsonObject.put("status", "Package Complete");
			jsonObject.put("missionNumber", re_num);
		}
		
		try {
			mqttclient.publish("/android/page1", jsonObject.toString().getBytes(), 0, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
