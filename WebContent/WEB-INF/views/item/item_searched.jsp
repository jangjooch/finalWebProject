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
			if ($("#selectGroup").val() == "0") {
				result = false;
			}
			if($("#findding").val() == ""){
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
					<form class="form-inline" onsubmit="return searchSelect()" action="item_list_search">
						<div class="form-group mb-2" id="t_b_right">
							<select class="form-control" id="selectGroup" name="selectGroup">
								<option value="0" selected="selected">선택하기</option>
								<option value="code">물품 번호</option>
								<option value="name">물품 이름</option>
								<option value="class">분류</option>
							</select>
						</div>
						<div class="form-group mx-sm-3 mb-2">
							<input type="text" class="form-control"	placeholder="검색어" id="findding" name="findding">
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
							<th scope="col" width="15%;">물품 번호</th>
							<th scope="col" width="30%;">물품 이름</th>
							<th scope="col" width="15%;">물품 수량</th>
							<th scope="col" width="30%;">분류</th>
							<th scope="col" width="10%;">무게</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="items" items="${itemList_searched}">
							<tr>
								<td><a href="item_detail?i_code=${items.i_code}">${items.i_code}</a></td>
								<td>${items.i_name}</td>
								<td>${items.i_mount}</td>
								<td>${items.i_class}</td>
								<td>${items.i_weight}</td>
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
								<li class="page-item"><a class="page-link" href="item_list_search?searchedipageNumber=1"> 
									<span aria-hidden="true">&laquo;</span></a>
								</li>
								<c:if test="${igroupNo > 1}">
									<li class="page-item"><a class="page-link" href="item_list_search?searchedipageNumber=${istartPageNo - 1}"> 
										<span aria-hidden="true"><</span></a>
									</li>
								</c:if>
								
								<c:forEach begin="${istartPageNo}" end="${iendPageNo}" var="i">
								<li class="page-item">
									<a class="page-link" href="item_list_search?searchedipageNumber=${i}">${i}</a>
								</li>
								</c:forEach>
								
								<%--
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								--%>
								<c:if test="${igroupNo < itotalGroupNum}">
									<li class="page-item"><a class="page-link" href="item_list_search?searchedipageNumber=${iendPageNo + 1}">
										<span aria-hidden="true">></span>									
									</a></li>
								</c:if>								
								<li class="page-item"><a class="page-link" href="item_list_search?searchedipageNumber=${itotalPageNum}"> 
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
						<a href="item_list" class="btn btn-warning">물품 목록</a>
						<a href="item_add" class="btn btn-warning">물품 등록</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
			
		</div>	
	</body>
</html>