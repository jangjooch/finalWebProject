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
import web.dao.log.LogDao;
import web.dao.mission.MissionDao;
import web.dto.request.RequestDto;

@Service
public class MqttService {
	private static final Logger logger = LoggerFactory.getLogger(MqttService.class);
	
	private MqttClient mqttclient;
	
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
			public void messageArrived(String topic, MqttMessage message) throws Exception {
				byte[] bytes = message.getPayload();
				String json = new String(bytes);
				logger.info("json : " + json);
				JSONObject jsonObject = new JSONObject(json);
				
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
					
					// 미션 내용
					String d_m_preparation = new String();
					
					for(int i=0; i<jsonArray.length(); i++) {
						JSONObject obj = new JSONObject();
						 obj = (JSONObject) jsonArray.get(i);
						 
						 if(i == 0) {
							 d_m_preparation = i + " 번째 경로 : " + 
								 		" / x: " + String.valueOf(obj.get("x")) + 
								 		" / y: " + String.valueOf(obj.get("y")) + "    | |    ";
							
						 }
						 
						 if(i == jsonArray.length()-1) {
							 d_m_preparation = d_m_preparation + i + " 번째 경로 : " + String.valueOf(obj.get("seq")) + 
									 	" / x: " + String.valueOf(obj.get("x")) + 
								 		" / y: " + String.valueOf(obj.get("y"));
							 break;
						 }
						 
						 if(i != 0) {
							 d_m_preparation = d_m_preparation + i + " 번째 경로 : " + String.valueOf(obj.get("seq")) + 
								 		" / x: " + String.valueOf(obj.get("x")) + 
								 		" / y: " + String.valueOf(obj.get("y")) + "    | |    ";
						 }
					}
					
					int d_number = (int) jsonObject.get("droneNumber"); // 드론 번호 가져오기
					int re_num = (int) jsonObject.get("missionNumber");   // 요청 번호 가져오기
					// 드론 상태 업데이트
					int rows = droneDao.updateDrontState(d_number);
					
					int d_m_number = logDao.getDMNumCount(re_num);

					/* 업로드를 여러번 할 경우 */
					// 로그가 인서트가 안됬을 경우
					if(d_m_number == 0) {
						logDao.insertDroneMission(d_number, re_num, d_m_preparation);
						// 요청을 상태 값을 바꿔야함
						missionDao.updateSuccessChainge3Eseo4(re_num); // -> 요청 상태  : 수행중
					// 로그가 인서트 됬을 경우
					}else {
						logDao.updateDroneMission(d_number, re_num, d_m_preparation);
					}
				
				}else if(jsonObject.get("msgid").equals("missionSpots")) {
					
					int re_num = (int) jsonObject.get("missionNumber");   // 요청 번호 가져오기
					int d_number = (int) jsonObject.get("droneNumber"); // 드론 번호 가져오기
					
					missionDao.updateSuccessChainge4Eseo5(re_num);    // 요청 상태 업데이트 : 완료
					droneDao.updateDroneState1(d_number);             // 드론 상태 업데이트
					logDao.getDroneMissionUpdate(re_num);             // 완료 시간 업데이트 
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
			jsonObject.put("status", "requestDeny");
			jsonObject.put("missionNumber", re_num);
		}else {
			jsonObject.put("msgid", "missionStatus");
			jsonObject.put("status", "requestAccept");
			jsonObject.put("missionNumber", re_num);
		}
		
		try {
			mqttclient.publish("/android/page1", jsonObject.toString().getBytes(), 0, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
