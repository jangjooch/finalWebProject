<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../main/top.jsp" flush="false"/>
	
		<script type="text/javascript">
			function searchSelect(){
				var result = true;
				if ($("#searchThing").val() == "0") {
					result = false;
				}
				if($("#things").val() == ""){
					result = false;
				}
				return result;
			}
			
			
			
			function fileUpload() {
			    window.open("logFileUpload", "네이버새창", "width=600, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
			}
		</script>
		
		<style>
		</style>
	<body>
		<%-- 전체 div --%>
			<div class="row">
				<%-- top --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8" id="top">
					<div id="top">
						<div id="top_t">
							<div style="height: 20px;"></div>
						</div>
						<div id="top_c">
							<h2> LogDetail # ${logDto.droneMissionDto.d_m_number} </h2>
						</div>
						<div id="top_b">
							
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
				
				<%-- center --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div class="row">
					<div class="col-sm-6">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>요청 번호</th>
									<td>${logDto.requestDto.re_num}</td>
								</tr>
								<tr>
									<th>요청자/직급</th>
									<td>${logDto.memberDto.m_name}/${logDto.memberDto.po_position}</td>
								</tr>
								<tr>
									<th>요청 시간</th>
									<td><fmt:formatDate value="${logDto.requestDto.re_time}" pattern="yyyy-MM-dd / hh:mm:ss"/></td>
								</tr>
								<tr>
									<th>요청 위치 x/y</th>
									<td>${logDto.requestDto.re_location_x}/${logDto.requestDto.re_location_y}</td>
								</tr>
								<tr>
									<th>요청 물품 및 수량</th>
									<td>
										<c:forEach var="i" items="${logDto.requestDto.missionItems}">
											${i.itemDto.i_name} / ${i.i_amount}<br/>
										</c:forEach>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>기록 번호</th>
									<td>${logDto.droneMissionDto.d_m_number}</td>
								</tr>
								<tr>
									<th>처리자/직급</th>
									<td>${logDto.droneMissionDto.memberDto.m_name}/${logDto.droneMissionDto.memberDto.po_position}</td>
								</tr>
								<tr>
									<th>드론 번호</th>
									<td>${logDto.droneDto.d_number}</td>
								</tr>
								<tr>
									<th>드론 모델명</th>
									<td>${logDto.droneDto.d_model}</td>
								</tr>
								<tr>
									<th>비고</th>
									<c:if test="${logDto.requestDto.re_success == 5}">
										<td>미션 완료</td>
									</c:if>
									<c:if test="${logDto.requestDto.re_success == 6}">
										<td>요청 거절</td>
									</c:if>
								</tr>
								
							</tbody>
						</table>
					</div>
					<div class="col-sm-12">
						<div id="center_right">
							<table class="table table-bordered"  style="border: 2px solid black;">
								<tbody>
									<tr>
										<th width="20%">미션 작성일 시간</th>
										<td><fmt:formatDate value="${logDto.droneMissionDto.d_m_preparation}" pattern="yyyy-MM-dd / hh:mm:ss"/></td>
									</tr>
									<tr>
										<th>미션 내용</th>
										<td>
											${logDto.droneMissionDto.d_m_start}
										</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
					<div class="col-sm-12">
						
						<h5>요청 위치</h5>
						<div id="map" style="width: 100%; height: 500px;">
						</div>
						<p/>
						<p/>
<!--                                                             -->
<div class="jumbotron">
  <div class="container text-center">
    <h3>My Portfolio</h3>      
    <p>첫번째 사진</p>
  </div>
</div>
  
<div class="container-fluid bg-3 text-center">    
  <h6 align="left">드론사진</h6><br>
  <div class="row">
    <div class="col-sm-3">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br>

<div class="container-fluid bg-3 text-center">    
  <h6 align="left">현장사진</h6><br>
  <div class="row">
    <div class="col-sm-3">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br><br>			
			
			
			<!--                                                             -->
						
						
					</div>
					
					</div>
					</div>
				
				<%-- bottom --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div id="bottom">
						<div id="bottom_t" style="height: 20px;"></div>
						<div id="bottom_c">
							<div id="bottom_c_l">
								<div align="right"><a onclick="fileUpload()" class="btn btn-primary">사진업로드</a></div>							
							</div>
							<div id="bottom_c_c">
								
							</div>
							<div id="bottom_c_r">
								<div align="right"><a href="log_list?pageNo=${pageNo}" class="btn btn-warning">목록으로</a></div>
							</div>
						</div>
						<div id="bottom_b" style="height: 20px;"></div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
			
			<script>
				// 목적지
				var destination_x = ${logDto.requestDto.re_location_x}; // 전에 model로 받은 destinaion_lat 
				var destination_y = ${logDto.requestDto.re_location_y}; // 전에 model로 받은 destinaion_lng
	
				// 드론 실제 위치
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(destination_x, destination_y), // 지도의 중심좌표
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
				
			</script>
<jsp:include page="../main/bottom.jsp" flush="false"/>