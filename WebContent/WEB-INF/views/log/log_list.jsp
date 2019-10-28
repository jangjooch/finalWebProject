<%@ page contentType="text/html; charset=UTF-8"%>

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
							<select class="form-control">
								<option id="" value="" selected="selected">선택하기</option>
								<option id="" value="">요청한 회원</option>
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
							<th scope="col">번호</th>
							<th scope="col">요청자</th>
							<th scope="col">요청 시간</th>
							<th scope="col">요청 위치</th>
							<th scope="col">처리자</th>
							<th scope="col">드론 번호</th>
							<th scope="col">드론 모델명</th>
							<th scope="col">미션 내용</th>
							<th scope="col">미션 작성일/시간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>김요청</td>
							<td>2019/10/29 - 21:09</td>
							<td>위치</td>
							<td>김처리</td>
							<td>2</td>
							<td>모델명</td>
							<td>미션 임파서블!</td>
							<td>2019/10/30 - 01:20</td>
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
								<li class="page-item active"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#"> 
									<span aria-hidden="true">></span>
								</a></li>
								<li class="page-item"><a class="page-link " href="#"> 
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
