<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../main/top.jsp" flush="false"/>

		<script type="text/javascript">
		
		window.setTimeout('window.location.reload()',5000); //5초마다 새로고침
		
			// 요청수락 확인기능
			function mission_accept(re_num, check) {
				var value = re_num;
				var rejection = check;
				var result = false;
				if(rejection == 0){
					if (confirm("요청을 수락하시겠습니까?") == true) {
						location.href = "missionAcceptList?re_num=" + value;
					}	
				}else{
					if(confirm("요청을 거절하시겠습니까?") == true){
						location.href = "missionAcceptList?re_num=" + value +"&rejection=" + rejection;
					}
				}
				
			}
			
			// 요청 상세보기
			function missionDetail(a) {
				alert(a);
				window.open("missionProcess");
			}
			
			//요청위치 자식창
			function onChildWindow(re_location_x, re_location_y){
				var popupX = (window.screen.width / 2) - (500 / 2);
				var popupY = (window.screen.height / 2) - (500 / 2);
				
				var setting= "toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=500,width=500,left=" + popupX + ",top=" + popupY;
				var url ="${pageContext.request.contextPath}/mission/api?re_location_x=" + re_location_x + "&re_location_y=" + re_location_y
				window.open(url, "자식창", setting);
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
							<h1>Mission</h1>
						</div>
						<div id="top_b">
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
				
				<%-- center --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<table class="table table-hover">
							<thead class="thead-dark">
								<tr align="center">
									<th scope="col" width="10%;">요청 번호</th>
									<th scope="col" width="15%;">요청 시간</th>
									<th scope="col" width="10%;">요청 위치 Lat</th>
									<th scope="col" width="10%;">요청 위치 Lng</th>							
									<th scope="col" width="10%;">요청자</th>							
									<th scope="col" width="15%;">요청 물품</th>
									<th scope="col" width="20%;">상태</th>
								</tr>
							</thead>
						<tbody>
						<c:forEach items="${requestList}" var="requestList">
							<tr align="center">
								<td>${requestList.re_num}</td>
								<td><fmt:formatDate value="${requestList.re_time}" pattern="yyyy-MM-dd hh:mm"/></td>
								<td>${requestList.re_location_x}</td>
								<td>${requestList.re_location_y}</td>
								<td>${requestList.memberDto.m_name }</td>
								<td>
									<c:forEach var="i" items="${itemList}">
										<c:if test="${i.re_num==requestList.re_num}">
											<input type="hidden" name="i_code" value="${i.itemDto.i_name}">
											<input type="hidden" name="i_mount" value="${i.i_amount}">
											${i.itemDto.i_name}/${i.i_amount}<br/>
										</c:if>
									</c:forEach>
								</td>
								<td>
									<div>
										<c:if test="${requestList.re_success == 0}">
											<a onclick="mission_accept('${requestList.re_num}',0)" style="color:white; cursor: pointer;" class="btn btn-primary">수락</a>
											<a onclick="mission_accept('${requestList.re_num}',1)" style="color:white; cursor: pointer;" class="btn btn-danger">거절</a>
											<a onclick="onChildWindow('${requestList.re_location_x}', ${requestList.re_location_y})" style="color:white; cursor: pointer;" class="btn btn-success">위치확인</a>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>						
						</table>
				</div>
				<div class="col-sm-2"></div>
				
				<%-- bottom --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div id="bottom">
						<div id="bottom_t" style="height: 20px;"></div>
						<div id="bottom_c">
							<div id="bottom_c_l"></div>
							<div id="bottom_c_c">
								<c:choose>
								<c:when test="${!empty requestList}">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="requestList?=pageNo=1"> 
											<span aria-hidden="true">&laquo;</span></a>
										</li>
										<c:if test="${groupNo > 1}">
										<li class="page-item"><a class="page-link" href="requestList?pageNo=${startPageNo-1}"> 
											<span aria-hidden="true"><</span></a>
										</li>
										</c:if>
										
								  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
								  		<c:if test="${pageNo==i}">
								  			<li class="page-item active">
								  				<a href="requestList?pageNo=${i}" class="page-link">${i}</a>
								  			</li>
								  		</c:if>
						  				<c:if test="${pageNo!=i}">
						  					<li class="page-item">
						  						<a href="requestList?pageNo=${i}" class="page-link">${i}</a>
						  					</li>
						  				</c:if>
						  			</c:forEach>
										<c:if test="${groupNo < totalGroupNum}">
											<li class="page-item">
												<a class="page-link" href="requestList?pageNo=${endPageNo+1 }"> 
												<span aria-hidden="true">></span>
												</a>
											</li>
										</c:if>
										<li class="page-item"><a class="page-link" href="requestList?pageNo=${totalPageNum }"> 
											<span aria-hidden="true">&raquo;</span></a>
										</li>
									</ul>
								</nav>
								</c:when>
								<c:otherwise>
									<h4 Style="text-align: center;">요청 내역이 없습니다.</h4>
								</c:otherwise>
								</c:choose>
							</div>
							<div id="bottom_c_r"></div>
						</div>
						<div id="bottom_b" style="height: 20px;"></div>
					</div>
				</div>
				<div class="col-sm-2"></div>
				
				<div class="col-sm-2"></div>
				<div class="col-sm-8" style="height: 100px;"></div>
				<div class="col-sm-2"></div>
			</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>