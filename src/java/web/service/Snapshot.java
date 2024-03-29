package web.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

import javax.annotation.PreDestroy;
import javax.servlet.ServletContext;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public class Snapshot {
	
	/*
	
	@Autowired
	private ServletContext application;
	
	private CamClient camClient;
	
	private boolean takeSnap;
	
	private int pictureNumber;
	private int forPictureThread;
	private int missionNumber;
	
	
	// 기본 생성자 -> 서비스 객체 생성 시 MqttConnect 설정
	public Snapshot() {
		camClient = new CamClient();
		// camClient.make_sub();
		takeSnap = false;
		pictureNumber = 4;
		forPictureThread = 0;
		missionNumber = 0;
	}
	
	@PreDestroy
	public void predistory() {
		try {
			camClient.forPreDistory();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public class CamClient{
		
		private MqttClient client;
		
		public CamClient() {
			while(true) {
				try {
					client = new MqttClient("tcp://106.253.56.124:1881", MqttClient.generateClientId(), null);
					System.out.println("Camclient created");
					break;
				} catch (MqttException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			make_sub();
		}
		
		public void make_sub() {
			System.out.println("CamClient Subscribe setCallback");
			client.setCallback(new MqttCallback() {
				
				@Override
				public void messageArrived(String topic, MqttMessage message) throws Exception {
					// TODO Auto-generated method stub
					if(topic.equals("/drone/cam0/gcs")) {
						takeSnap = true;
						pictureNumber = 0;
						
						byte[] data = message.getPayload();
						String strData = new String(data);
						JSONObject jsonObject = new JSONObject(strData);
						missionNumber = (int) jsonObject.get("missionNumber");
					}
					else if(topic.equals("/drone/cam0/pub")) {
						if(takeSnap) {
							if(pictureNumber < 4) {
								if(forPictureThread == 0) {
									new Thread() {
										@Override
										public void run() {
											forPictureThread = 1;
											byte[] data = message.getPayload();
											// 이미지 파일을 byte배열로 마꿔서 저장한다.
											String fileName = "picture" + missionNumber + pictureNumber + ".jpg"; // 파일 이름											
											String realPath = application.getRealPath("/upload/")+fileName; // 경로
											FileOutputStream fos;
											try {
												System.out.println("Try JPG File Save");
												fos = new FileOutputStream(realPath);
												BufferedOutputStream bos = new BufferedOutputStream(fos); // 이미지 만들기
												bos.write(data);
												bos.flush();
												bos.close();
												System.out.println("Done JPG File Save");
											} catch (Exception e1) {
												// TODO Auto-generated catch block
												e1.printStackTrace();
											}  // 경로에 이미지 파일을 만듬
											
											
											try {
												Thread.sleep(1000);
											} catch (InterruptedException e) {
												e.printStackTrace();
											}
											pictureNumber++;
											forPictureThread = 0;
										}
									}.start();
								}			
							}
							else {
								takeSnap = false;
							}
						}
					}
				}
				
				@Override
				public void deliveryComplete(IMqttDeliveryToken token) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public void connectionLost(Throwable cause) {
					// TODO Auto-generated method stub
					
				}
			});
			
			try {
				client.subscribe("/drone/cam0/+");
				System.out.println("CamClient Subscribe Done");
			} catch (MqttException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		public void forPreDistory() {
			
			try {
				client.disconnect();
				client.close();
			} catch (MqttException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	*/
}
