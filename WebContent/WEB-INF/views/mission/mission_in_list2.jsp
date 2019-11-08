<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보유 물품 목록</title>
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/css/shc/collection.css">
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		
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
			
			
			function mission_accept() {
				var result = false;
				if (confirm("요청을 수락하시겠습니까?") == true) {
					
					if (true) {
						alert("요청을 수락했습니다.");
					}
				}
			}
		</script>
	</head>
	<script type="text/javascript">

	</script>
	<body>
		<%-- 전체 div --%>
		<div id="body">
			<%-- 제목 div top--%>
			<div id="top">
				<div id="top_top"></div>
				
				<div id="top_center">
					<h1>미션 현황</h1>
				</div>
				
				<%-- top_bottom검색어 --%>
				<div id="top_bottom">
					<form class="form-inline" action="requestSearch" onsubmit="return searchSelect()">
						<div class="form-group mb-2" id="t_b_right">
							<select id="searchThing" name="searchThing"class="form-control">
								<option value="0" selected>선택하기</option>
								<option value="re_num">요청번호</option>
								<option value="re_time">요청시간</option>
								<option value="m_name">요청자 이름</option>
								<option value="re_success">상태</option>
							</select>
						</div>
						<div class="form-group mx-sm-3 mb-2">
							<input id="things" name="things" type="text" class="form-control"	placeholder="검색어">
						</div>
						<button type="submit" class="btn btn-primary mb-2">검색</button>
					</form>
				</div>
			</div>
			
			<%-- 테이블 div top--%>
			<div id="center">
					<div style="border: 1px solid 1px">
						<table class="table table-hover">
							<thead class="thead-dark">
								<tr>
									<th scope="col" width="15%;">요청 번호</th>
									<th scope="col" width="15%;">요청 시간</th>
									<th scope="col" width="15%;">요청 위치 Lat</th>
									<th scope="col" width="15%;">요청 위치 Lng</th>							
									<th scope="col" width="15%;">요청자</th>							
									<th scope="col" width="15%;">상태</th>							
								</tr>
							</thead>
						<tbody>
						<c:forEach items="${requestList}" var="requestList">
							<tr>
								<td><a href="missionDetail?re_num=${requestList.re_num}">${requestList.re_num}</a></td>
								<td><fmt:formatDate value="${requestList.re_time}" pattern="yyyy-MM-dd hh:mm"/></td>
								<td>${requestList.re_location_x}</td>
								<td>${requestList.re_location_y}</td>
								<td>${requestList.memberDto.m_name }</td>
								<td>
									<div>
										<c:if test="${requestList.re_success == 0}">
										<button type="submit" class="btn btn-danger" 
										onclick="return mission_accept()">수락 대기</button>
										</c:if>
										<c:if test="${requestList.re_success == 1}">
										<button type="submit" class="btn btn-warning" 
										onclick="return mission_accept()">수행중</button>
										</c:if>
										<c:if test="${requestList.re_success == 2}">
										<button type="submit" class="btn btn-light" 
										onclick="return mission_accept()">사건 종료</button>
										</c:if>
										
										
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>						
						</table>
					</div>	
						<br>
			</div>
			
			<%-- 버튼 div bottom --%>
			<div id="bottom">
			
				<%-- bottom left - div --%>
				<div id="bottom_left"></div>
				
				<%-- bottom center - div --%>
				<div id="bottom_center">
					<%-- top --%>
					<div id ="b_c_top"></div>
					
					<%-- center 페이징 --%>
					<div id ="b_c_center">
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
						  			<a href="requestList?pageNo=${i}" class="page-link" style="color:orange;">${i}</a>
						  		</c:if>
				  				<c:if test="${pageNo!=i}">
				  					<a href="requestList?pageNo=${i}" class="page-link">${i}</a>
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
					</div>			
				
					<%-- bottom --%>
					<div id ="b_c_bottom"></div>
				
				</div>
				<%-- bottom left - right --%>
				<div id="bottom_right">
					
					<%--bottom-right top --%>
					<div id="b_r_top"></div>
					<%--bottom-right center 버튼 --%>
					<div id="b_r_center">						
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
		</div>	
	</body>
</html>