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
			
		function fileUpload(m_number) { // 현상사진 업로드
			var d_m_number = m_number;
				jQuery(document).ready(function() {
				    window.open("logFileUpload?d_m_number="+d_m_number, "파일 업로드",
				    		"width=600, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
				});
			}
		function mainShot1() {
			jQuery(document).ready(function() {
				var src = jQuery('#img1').attr("src");
				jQuery("#mainSnapshot").attr("src", src);
			});
		}
		function mainShot2() {
			jQuery(document).ready(function() {
				var src = jQuery('#img2').attr("src");
				jQuery("#mainSnapshot").attr("src", src);
			});
		}
		function mainShot3() {
			jQuery(document).ready(function() {
				var src = jQuery('#img3').attr("src");
				jQuery("#mainSnapshot").attr("src", src);
			});
		}
		function mainShot4() {
			jQuery(document).ready(function() {
				var src = jQuery('#img4').attr("src");
				jQuery("#mainSnapshot").attr("src", src);
			});
		}
		</script>
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
							<h1> LogDetail # ${logDto.droneMissionDto.d_m_number} </h1>
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
										<td id="d_m_start">
										</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
					<div class="col-sm-12">
						
						<h4 style="text-align: center;">요청 위치</h4>
						<div id="map" style="width: 100%; height: 500px;">
						</div>
						<p/>
						<p/>
					
					<c:if test="${logDto.requestDto.re_success == 5}">
					  <h4 style="text-align: center;">현장 사진</h4>
					
					  
					  
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-4">
							<div>
								<img id="img1"
									src="<%=application.getContextPath()%>/resources/upload/picture${logDto.requestDto.re_num}0.jpg"
									class="img-responsive" style="width: 100%" alt="Image"
									onmouseover="mainShot1()">
							</div>
							<div>
								<img id="img2"
									src="<%=application.getContextPath()%>/resources/upload/picture${logDto.requestDto.re_num}1.jpg"
									class="img-responsive" style="width: 100%" alt="Image"
									onmouseover="mainShot2()">
							</div>
							<div>
								<img id="img3"
									src="<%=application.getContextPath()%>/resources/upload/picture${logDto.requestDto.re_num}2.jpg"
									class="img-responsive" style="width: 100%" alt="Image"
									onmouseover="mainShot3()">
							</div>
							<div>
								<img id="img4"
									src="<%=application.getContextPath()%>/resources/upload/picture${logDto.requestDto.re_num}3.jpg"
									class="img-responsive" style="width: 100%" alt="Image"
									onmouseover="mainShot4()">
							</div>
						</div>
						<div class="col-sm-8">
							<div class="jumbotron">
								<div class="container text-center">
									<img id="mainSnapshot"
										src="<%=application.getContextPath()%>/resources/upload/picture${logDto.requestDto.re_num}0.jpg"
										class="img-responsive" style="width: 100%" alt="Image">
								</div>
							</div>
						</div>
					</div>
				</div>
					
					<div class="container-fluid bg-3 text-center">    <!-- 왼 -->
					  <div class="row">
					    
					
					  </div>
					</div><br>	<!-- 왼 -->
					</c:if>
					
					
					
					
					</div>
					
					</div>
					</div>
				
				<%-- bottom --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div id="bottom">
						<div id="bottom_t" style="height: 20px;"></div>
						<div id="bottom_c">
							
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
				
				<div class="col-sm-2"></div>
				<div class="col-sm-8" style="height: 100px;"></div>
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
					level : 2 // 지도의 확대 레벨
				
				};
	
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 선 배열
				var linePath = [];
				
				// array
				$("#d_m_start").empty();
				var array = null;				
				
				if('${logDto.droneMissionDto.d_m_start}' == '["요청이 거절 되었습니다."]'){
					array = '${logDto.droneMissionDto.d_m_start}';
					$("#d_m_start").append(
						'요청이 거절 되었습니다.'		
					);
					
					var marker = new kakao.maps.Marker({
						// 지도 중심좌표에 마커를 생성합니다 
						map: map,
					    position: new kakao.maps.LatLng(destination_x, destination_y),
					});
					
					marker.setMap(map);
					
				}else{
					array = ${logDto.droneMissionDto.d_m_start};
					
					for(var i=0; i<array.length; i++){
						// 미션 로그에 생성
						if(i == 0){
							$("#d_m_start").append('위도 :' + 
									   array[i].x + ' / 경도 : ' + 
									   array[i].y + ' / 출발 위치 <br/>'
									   );	
						}else if(i == array.length-1){
							$("#d_m_start").append('위도 :' + 
									   array[i].x + ' / 경도 : ' + 
									   array[i].y + ' / 요청 위치'
									   );
						}else{
							$("#d_m_start").append('위도 :' + 
									   array[i].x + ' / 경도 : ' + 
									   array[i].y + '<br/>'
									   );
						}
						linePath[i] = new kakao.maps.LatLng(array[i].x, array[i].y);
					}
					
					// 지도에 표시할 선을 생성합니다
					var polyline = new kakao.maps.Polyline({
					    path: linePath, // 선을 구성하는 좌표배열 입니다
					    strokeWeight: 5, // 선의 두께 입니다
					    strokeColor: 'red', // 선의 색깔입니다
					    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'solid' // 선의 스타일입니다
					});
					
					// 지도를 클릭한 위치에 표출할 마커입니다
					var marker = new kakao.maps.Marker({
						// 지도 중심좌표에 마커를 생성합니다 
						map: map,
					    position: new kakao.maps.LatLng(destination_x, destination_y),
					});
					
					var destinationMarker = new kakao.maps.Marker({
						// 지도 중심좌표에 마커를 생성합니다 
						map: map,
					    position: new kakao.maps.LatLng(array[0].x, array[0].y)
					}); 
					//marker.setPosition(new kakao.maps.LatLng(destination_x, destination_y))
					// 지도에 마커를 표시합니다		
					marker.setMap(map);
					destinationMarker.setMap(map);
					
					// 지도에 선을 표시합니다 
					polyline.setMap(map);
					
					// 텍스트 창
					var iwContent = '<div style="padding:5px;">드론 출발 위치</div>';
					var destinationiwContent = '<div style="padding:5px;">구조 요청 위치</div>';
				    iwPosition = new kakao.maps.LatLng(destination_x, destination_y); //인포윈도우 표시 위치입니다
				    destinationiwPosition = new kakao.maps.LatLng(array[0].x, array[0].y); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
				    
					var destinationinfowindow = new kakao.maps.InfoWindow({
					    position : destinationiwPosition, 
					    content : destinationiwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker);
					destinationinfowindow.open(map, destinationMarker);
					
				}
				
				
				
			</script>
<jsp:include page="../main/bottom.jsp" flush="false"/>