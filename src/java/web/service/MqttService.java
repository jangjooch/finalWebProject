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

import web.dao.mission.MissionDao;
import web.dto.request.RequestDto;

@Service
public class MqttService {
	private static final Logger logger = LoggerFactory.getLogger(MqttService.class);
	
	private MqttClient mqttclient;
	
	@Autowired
	private MissionDao missionDao;
	
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
							logger.info("앙 나 가버렸띠~");
						}
					}.start();
					
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

	
	// 보내기
	public void sendMessage(String topic, String message) {
		try {
			mqttclient.publish(topic, message.getBytes(), 0, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 요청 테이블 gcs에 보내기
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
	
	
}
