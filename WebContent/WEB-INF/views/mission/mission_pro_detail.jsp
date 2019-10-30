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

</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<p>
		<em>지도를 클릭해주세요!</em>
	</p>
	<div id="clickLatlng"></div>
	
	<script>	 	
		var destination_x = ${destination_lat};
		var destination_y = ${destination_lat};
		// 37.504000, 127.122000
		var lat = 37.504383;
		var lng = 127.122404;
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
			position : map.getCenter()
		});
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		var DroneMarker = kakao.maps.Marker({ 
			
		}); 
		DroneMarker.setPosition(new kakao.maps.LatLng(lat, lng))
		DroneMarker.setMap(map);
		
		// markers에 저장된 marker를 map에 세팅하기
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }            
		}

		// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
		function showMarkers() {
		    setMarkers(map)    
		}

		// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
		function hideMarkers() {
		    setMarkers(null);    
		}
		setInterval(function(){
			lat = lat + 0.00001;
			lng = lng + 0.00001;
			marker.setMap(null);
			marker.setPosition(new kakao.maps.LatLng(lat, lng));
			marker.setMap(map);
			map.setCenter(new kakao.maps.LatLng(lat, lng));
		},1000);
	</script>
</body>
</html>