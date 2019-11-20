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

@Service
public class SnapshotService {
	
	@Autowired
	private ServletContext application;
	
	private MqttClient client;
	
	private int pictureNumber;
	private int forPictureThread = 0;
	private int requestNumber = 0;
	private boolean takeSnap;
	
	
	@PreDestroy
	private void destory() {
		try {
			client.disconnect();
			client.close();
		} catch (MqttException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public SnapshotService() {
		while(true) {
			try {
				client = new MqttClient("tcp://106.253.56.124:1881", MqttClient.generateClientId(), null);
				client.connect();
				System.out.println("Camclient created");				
				break;
			} catch (MqttException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		takeSnap = false;
		System.out.println("CamClient Subscribe setCallback");
		make_sub();
	}
	
	
	public void make_sub() {
			client.setCallback(new MqttCallback() {
			
			@Override
			public void messageArrived(String topic, MqttMessage message) throws Exception {
				//System.out.println("Message Arrived");
				// TODO Auto-generated method stub
				if(topic.equals("/drone/cam1/gcs")) {
					
					System.out.println("Message Recived from GCS");
					System.out.println("Recived : " + new String(message.getPayload()));					
					takeSnap = true;
					pictureNumber = 0;
					
					String strData = new String(message.getPayload());
					JSONObject jsonObject = new JSONObject(strData);
					System.out.println("Recived Json : " + jsonObject.toString());
					requestNumber = (int)jsonObject.get("missionNumber");
					System.out.println("get missionNumber Done");
				}
				else if(topic.equals("/drone/cam1/pub")) {				
					if(takeSnap) {
						System.out.println("message Arrived From Cam");
						System.out.println("Snapshot Activate");
						if(pictureNumber < 4) {
							if(forPictureThread == 0) {
								new Thread() {
									@Override
									public void run() {
										forPictureThread = 1;
										byte[] data = message.getPayload();
										// �씠誘몄� �뙆�씪�쓣 byte諛곗뿴濡� 留덇퓭�꽌 ���옣�븳�떎.
										String fileName = "picture" + requestNumber + pictureNumber + ".jpg"; // �뙆�씪 �씠由�											
										String realPath = application.getRealPath("/resources/upload/")+fileName; // 寃쎈줈
										FileOutputStream fos;
										try {
											System.out.println("Try JPG File Save");
											fos = new FileOutputStream(realPath);
											BufferedOutputStream bos = new BufferedOutputStream(fos); // �씠誘몄� 留뚮뱾湲�
											bos.write(data);
											bos.flush();
											bos.close();
											System.out.println("Done JPG File Save");
										} catch (Exception e1) {
											// TODO Auto-generated catch block
											e1.printStackTrace();
										}  // 寃쎈줈�뿉 �씠誘몄� �뙆�씪�쓣 留뚮벉
										
										
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
				System.out.println("Connection Lost");
			}
		});
		
		try {
			client.subscribe("/drone/cam1/+");
			System.out.println("CamClient Subscribe Done");
		} catch (MqttException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
