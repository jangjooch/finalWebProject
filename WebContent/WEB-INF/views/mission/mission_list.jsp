<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<style>
		</style>
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
					
				</div>
			</div>
			
			<%-- 테이블 div top--%>
			<div id="center">
				<c:forEach items="${MisstionLocation}" var="mission">
					<div style="border: 1px solid 1px">
						<table class="table table-hover">
							<thead class="thead-dark">
							<tr>
								<th scope="col" width="20%;">요청 번호</th>
								<th scope="col" width="20%;">요청 시간</th>
								<th scope="col" width="20%;">요청 위치 Lat</th>
								<th scope="col" width="20%;">요청 위치 Lng</th>							
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${mission.number}</td>
								<td>${mission.time}</td>
								<td>${mission.location_x}</td>
								<td>${mission.location_y}</td>
							</tr>
						</tbody>						
						</table>
						<table class="table table-hover">
							<thead class="thead-dark">
							<tr>
								<th scope="col" width="30%;">물품 이름</th>
								<th scope="col" width="30%;">요청 수량</th>							
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${mission.itemList}" var="item">
								<tr>
								<td>${item.name}</td>
								<td>${item.amount}</td>
							</tr>
							</c:forEach>							
						</tbody>
						</table>
						<form action="missionAccept">
							<input value="${mission.number}" readonly="readonly" type="number">
							<button type="submit" class="btn btn-primary mb-2">미션 수락</button>
						</form>
						<a href="missionReject">미션 거부</a>
						<a href="missionMapping">미션 진행</a>
					</div>					
				</c:forEach>
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
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
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
						<a href="#" class="btn btn-warning">물품 목록</a>
						<a href="#" class="btn btn-warning">물품 등록</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
			
		</div>	
	</body>
</html>