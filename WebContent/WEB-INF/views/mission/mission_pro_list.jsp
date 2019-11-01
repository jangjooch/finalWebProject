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
					<h1>미션 진행</h1>
				</div>
				
				<%-- top_bottom검색어 --%>
				<div id="top_bottom">
					
				</div>
			</div>
			
			<%-- 테이블 div top--%>
			<div id="center">
				<c:forEach items="${currentMissionProList}" var="mission">
					<div style="border: 1px solid 1px">
						<table class="table table-hover">
							<thead class="thead-dark">
							<tr>
								<th scope="col" width="15%;">요청 번호</th>
								<th scope="col" width="15%;">요청 시간</th>
								<th scope="col" width="15%;">요청 위치 Lat</th>
								<th scope="col" width="15%;">요청 위치 Lng</th>							
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${mission.re_num}</td>
								<td>${mission.re_time}</td>
								<td>${mission.re_location_x}</td>
								<td>${mission.re_location_y}</td>
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
							<c:forEach items="${currentMissionProItems}" var="item">
								<c:if test="${mission.re_num == item.re_num }">
									<tr>
										<td>${item.i_name}</td>
										<td>${item.i_amount}</td>
									</tr>
								</c:if>
								
							</c:forEach>							
						</tbody>
						</table>
						<div style="display: flex;flex-direction: row;">							
							<div>
							<%--
							<a href="missionReject" class="btn btn-danger">미션 거부</a>
							 --%>
							<form action="missionProcess">
								<input value="${mission.re_num}" readonly="readonly" type="number" name="re_num">
								<button type="submit" class="btn btn-primary">미션 수행</button>
							</form>
							</div>
						</div>
					</div>
					<br>
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