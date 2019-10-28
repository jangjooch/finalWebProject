<%@ page contentType="text/html; charset=UTF-8"%>

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
					<form class="form-inline">
						<div class="form-group mb-2" id="t_b_right">
							<select class="form-control">
								<option id="" value="" selected="selected">선택하기</option>
								<option id="" value="">물품 번호</option>
								<option id="" value="">물품 이름</option>
								<option id="" value="">분류</option>
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
							<th scope="col" width="15%;">물품 번호</th>
							<th scope="col" width="30%;">물품 이름</th>
							<th scope="col" width="15%;">물품 수량</th>
							<th scope="col" width="30%;">분류</th>
							<th scope="col" width="10%;">무게</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="item_detail">1</a></td>
							<td>물</td>
							<td>25</td>
							<td>식품</td>
							<td>25kg</td>
						</tr>
						
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
								<li class="page-item"><a class="page-link" href="#"> 
									<span aria-hidden="true">&laquo;</span></a>
								</li>
								<li class="page-item"><a class="page-link" href="#"> 
									<span aria-hidden="true"><</span></a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#"> 
									<span aria-hidden="true">></span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#"> 
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
						<a href="#" class="btn btn-warning">물품 등록</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
			
		</div>	
	</body>
</html>