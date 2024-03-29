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
	<script>
		var destination_x = ${map.get('re_location_x')}; // 전에 model로 받은 destinaion_lat 
		var destination_y = ${map.get('re_location_y')}; // 전에 model로 받은 destinaion_lng
		
		// 드론 실제 위치
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(destination_x, destination_y), // 지도의 중심좌표
			level : 4,
			marker: marker
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			map: map,
		    position: new kakao.maps.LatLng(destination_x, destination_y),
		    text: '요청 위치'
				
		});
		//marker.setPosition(new kakao.maps.LatLng(destination_x, destination_y))
		// 지도에 마커를 표시합니다		
		marker.setMap(map);
	</script>
</body>
</html>
