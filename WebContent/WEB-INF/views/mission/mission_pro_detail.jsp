<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission Process Detail</title>
<script type="text/javascript"
src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" tpye="text/css"
href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<!-- bootstrap의 css를 가져옴 -->
<script type="text/javascript"
src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3d69db29f8cf3ce70f95fece8fddde0"></script>
<script type="text/javascript"
src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>

<script type="text/javascript">
	

</script>
</head>
<body>
	<div id="map" style="width: 100%; height: 500px;"></div>
	<p>
		<em>지도를 클릭해주세요!</em>
	</p>
	<div id="clickLatlng"></div>
	
	<script>
	$(function(){
		  //106.253.56.124
	      client = new Paho.MQTT.Client("106.253.56.124", 61614, "clientId");
	      client.onMessageArrived = onMessageArrived;
	      client.connect({
	         onSuccess : onConnect
	      });

	      function onConnect() {
	         // 연결이 완료되었을 때 자동으로 콜백되는 함수
	         
	         client.subscribe("/web/drone");
 
	      }

	      //메세지를 수신했을때 자동으로 실행(콜백)되는 함수
	      function onMessageArrived(message) {
	    	  console.log(message.payloadString + "<br/>");
	         $("#divRecieve").append(message.payloadString + "<br/>");
	         $("#divRecieve").append(location.hostname + "<br/>");
	         
	      }
	   });
	   function sendMessage(){
	      var data = "웹 송신: "+ $("#inputData").val();
	      var message = new Paho.MQTT.Message(data);
	        message.destinationName ="aaa";
	        client.send(message);
	   }
	   
	   /* ****************************************************** */
	
		// 목적지
		var destination_x = "37.504383"; // 전에 model로 받은 destinaion_lat 
		var destination_y = "127.122404"; // 전에 model로 받은 destinaion_lng

		// 드론 실제 위치
		var lat = 37.502000;	// MQTT에서 받아옴 (최초 1회)
		var lng = 127.120000;
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
			//33.450701, 126.570667 -> 제주도
			// 13.22415, 32.21584 -> 아랍사막
			// 37.504383, 127.122404 -> 협회
			level : 4
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			map: map,
		    position: new kakao.maps.LatLng(destination_x, destination_y)
		});
		//marker.setPosition(new kakao.maps.LatLng(destination_x, destination_y))
		// 지도에 마커를 표시합니다		
		marker.setMap(map);
		
		
		var DroneMarker = new kakao.maps.Marker({ 
			map: map,
		    position: new kakao.maps.LatLng(lat, lng)
		}); 
		//37.504000, 127.122000
		//DroneMarker.setPosition(new kakao.maps.LatLng(destination_x, destination_y));
		DroneMarker.setMap(map);
		
		
		// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
		function showMarkers() {
		    setMarkers(map); 
		}

		// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
		function hideMarkers() {
		    setMarkers(null);    
		}
		
		
		// 실제 위치가 맞나?
		setInterval(function(){
			lat = lat + 0.0001; // 1초마다 드론위치 수신
			lng = lng + 0.0001;
			DroneMarker.setMap(null);
			DroneMarker.setPosition(new kakao.maps.LatLng(lat, lng));
			DroneMarker.setMap(map);
			cent_x= (lat + destination_x /2);
			cent_x= (lng + destination_y /2);
			map.setCenter(new kakao.maps.LatLng(cent_x,cent_y));
		},10000);	// 초마다 계속 실행한다.
		
	</script>
	<div id="divRecieve">
		아아
	</div>
</body>
</html>
