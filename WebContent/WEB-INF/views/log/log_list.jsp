<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fnc" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그 기록</title>
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/css/shc/collection.css">
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			
		</script>
		<style>
		</style>
	</head>
	<body>
		<%-- 전체 div --%>
		<div id="body">
			<%-- 제목 div top--%>
			<div id="top">
				<div id="top_top"></div>
				
				<div id="top_center">
					<h1>로그 기록</h1>
				</div>
				
				<%-- top_bottom검색어 --%>
				<div id="top_bottom">
					<form class="form-inline">
						<div class="form-group mb-2" id="t_b_right">
							<select class="form-control" style="cursor: pointer;">
								<option id="" value="" selected="selected" style="cursor: pointer;">선택하기</option>
								<option id="" value="">요청자</option>
								<option id="" value="">처리자</option>
								<option id="" value="">드론 번호</option>
								<option id="" value="">처리 회원</option>
								<option id="" value="">요청 날짜</option>
							</select>
						</div>
						<div class="form-group mx-sm-3 mb-2">
							<input type="text" class="form-control"	placeholder="검색어">
						</div>
						<button type="submit" class="btn btn-primary mb-2">검색</button>
					</form>
				</div>
			</div>
			
			<%-- 테이블 div top--%>
			<div id="center">
				<table class="table table-hover" style="border: 1px solid 1px">
					<thead class="thead-dark">
						<tr>
							<th scope="col">사건 번호</th>
							<th scope="col">요청자/직급</th>
							<th scope="col">요청 시간</th>
							<th scope="col">요청 위치x/y</th>
							<th scope="col">처리자/직급</th>
							<th scope="col">드론</th>
							<th scope="col">드론 모델</th>
							<th scope="col">미션 내용</th>
							<th scope="col">미션 내용 작성일 시간</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${logDtoList}">
							<tr onclick="location.href='log_detail?d_m_number=${i.droneMissionDto.d_m_number}'" style="cursor: pointer;">
								<td>${i.droneMissionDto.d_m_number}</td>
								<td>${i.memberDto.m_name}/${i.memberDto.po_position}</td>
								<td><fmt:formatDate value="${i.missionDto.re_time}" pattern="yyyy-MM-dd / hh:mm:ss"/></td>
								<td>${i.missionDto.re_location_x}/${i.missionDto.re_location_y}</td>
								<td>${i.droneMissionDto.memberDto.m_name}/${i.droneMissionDto.memberDto.po_position}</td>
								<td>${i.droneMissionDto.d_number}</td>
								<td>${i.droneDto.d_model}</td>
								<td>${fnc:substring(i.droneMissionDto.d_m_start,0,3)}...</td>
								<td><fmt:formatDate value="${i.droneMissionDto.d_m_preparation}" pattern="yyyy-MM-dd / hh:mm:ss"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
								<li class="page-item"><a class="page-link" href="?pageNo=1"> 
									<span aria-hidden="true">&laquo;</span></a>
								</li>
								<c:if test="${groupNo>1}">
									<li class="page-item"><a class="page-link" href="#"> 
										<span aria-hidden="true"><</span></a>
									</li>
								</c:if>
								<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
									<c:if test="${pageNo == i}">
										<li class="page-item active"><a class="page-link" href="?pageNo=${i}">${i}</a></li>		
									</c:if>
									<c:if test="${pageNo != i}">
										<li class="page-item"><a class="page-link" href="?pageNo=${i}">${i}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${group<totalGroupNum}">
									<li class="page-item"><a class="page-link" href="?pageNo=${endPageNo+1}"> 
										<span aria-hidden="true">></span></a>
									</li>	
								</c:if>								
								<li class="page-item"><a class="page-link " href="?pageNo=${totalPageNum}"> 
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
					<div id="b_r_center"></div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
			
		</div>	
	</body>
</html>
