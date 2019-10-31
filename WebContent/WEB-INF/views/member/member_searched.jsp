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
	</script>
	<body>
		<%-- 전체 div --%>
		<div id="body">
			<%-- 제목 div top--%>
			<div id="top">
				<div id="top_top"></div>
				
				<div id="top_center">
					<h1>보유 물품 목록</h1>
				</div>
				
				<%-- top_bottom검색어 --%>
				<div id="top_bottom">
					<form class="form-inline" method="get" action="memberSearch" onsubmit="return searchSelect()">
						<div class="form-group mb-2" id="t_b_right">
							<select id="searchThing" name="searchThing"class="form-control">
								<option value="0" selected>선택하기</option>
								<option value="m_num">회원번호</option>
								<option value="m_name">이름</option>
								<option value="m_phone">전화번호</option>
								<option value="po_num">직급</option>
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
				<table class="table table-hover" style="border: 1px solid 1px">
					<thead class="thead-dark">
						<tr>
							<th scope="col" width="15%;">번호</th>
							<th scope="col" width="15%;">이름</th>
							<th scope="col" width="40%;">아이디</th>
							<th scope="col" width="20%;">전화번호</th>
							<th scope="col" width="10%;">직급</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${searchList}">
						    <tr>
						      <td><a href="memberDetail?m_num=${member.m_num}">${member.m_num }</a></td>
						      <td>${member.m_name}</td>
						      <td>${member.m_id}</td>
						      <td>${member.m_phone}</td>
						      <td>${member.po_position}</td>
						    </tr>
						</c:forEach>
						<%--
						<tr>
							<td><a href="item_detail">1</a></td>
							<td>물</td>
							<td>25</td>
							<td>식품</td>
							<td>25kg</td>
						</tr>
						 --%>
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
								<li class="page-item"><a class="page-link" href="memberList?=pageNo=1"> 
									<span aria-hidden="true">&laquo;</span></a>
								</li>
								<c:if test="${groupNo > 1}">
								<li class="page-item"><a class="page-link" href="memberList?pageNo=${startPageNo-1}"> 
									<span aria-hidden="true"><</span></a>
								</li>
								</c:if>
								
						  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
						  		<c:if test="${pageNo==i}">
						  			<a href="memberSearch?pageNo=${i}" class="page-link" style="color:orange;">${i}</a>
						  		</c:if>
				  				<c:if test="${pageNo!=i}">
				  					<a href="memberSearch?pageNo=${i}" class="page-link">${i}</a>
				  				</c:if>
				  			</c:forEach>
								<c:if test="${groupNo < totalGroupNum}">
									<li class="page-item">
										<a class="page-link" href="memberSearch?pageNo=${endPageNo+1 }"> 
										<span aria-hidden="true">></span>
										</a>
									</li>
								</c:if>
								<li class="page-item"><a class="page-link" href="memberSearch?pageNo=${totalPageNum }"> 
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
						<a href="memberInsertForm" class="btn btn-warning">회원 등록</a>
						<a href="memberList" class="btn btn-warning">전체 리스트</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
			
		</div>	
	</body>
</html>