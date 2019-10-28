<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원상세 페이지</title>
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/css/shc/collection.css">
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	</head>
	<style>
		.test{
			border: 1px solid black;
		}
		
		#center_detail{
			height: 70%;
			display: flex;
		}
		#center_left{
			display: flex;
			flex-direction: column;
			flex: 1;	
			text-align: right;
		}
			
		#center_right{
			flex: 2;
			display: flex;
		}
			#c_r_left{
				width: 5%;			
			}
			#c_r_right{
				flex: 1;
				overflow: scroll;
			}
		
	</style>
	<body>
		<div id="body">
			
			<%-- top --%>
			<div id="top">
				<div id="top_top"></div>
				<div id="top_center">
					<h1>? 회원</h1>
				</div>
				<div id="top_bottom"></div>
			</div>
			
			<%-- center_detail --%>
			<div id="center_detail">
				<div id="center_left">
					<form>
						<div class="form-group row">
							<label for="m_id" class="col-sm-4 col-form-label">회원 번호</label>
							<div class="col-sm-8">
								<input type="text" id="m_id" value="" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="m_name" class="col-sm-4 col-form-label">이름</label>
							<div class="col-sm-8">
								<input type="text" id="m_name" value="" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="m_id" class="col-sm-4 col-form-label">ID</label>
							<div class="col-sm-8">
								<input type="text" id="m_id" value="" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="m_pw" class="col-sm-4 col-form-label">PW</label>
							<div class="col-sm-8">
								<input type="password" id="m_pw" value=""
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="m_phone" class="col-sm-4 col-form-label">TEL</label>
							<div class="col-sm-8">
								<input type="text" id="m_phone" value="" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="po_name" class="col-sm-4 col-form-label">직급</label>
							<div class="col-sm-8">
								<input type="text" id="po_name" value="" 
									class="form-control" readonly>
							</div>
						</div>
					</form>
				</div>
				<div id="center_right">
					<div id="c_r_left"></div>
					<div id="c_r_right">
						<table class="table table-hover" style="border: 1px solid 1px">
							<thead class="thead-dark">
								<tr>
									<th scope="col" width="15%;">사건 번호</th>
									<th scope="col" width="15%;">요청 회원</th>
									<th scope="col" width="30%;">요청 위치(x, y)</th>
									<th scope="col" width="20%;">요청 일시</th>
									<th scope="col" width="20%">처리 회원</th>									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="detail">1</a></td>
									<td>서형철</td>
									<td>0.12345, 2.13456</td>
									<td>2019/10/25 21:05</td>
									<td>저형철</td>
								</tr>
							</tbody>
						</table>	
					</div> 
				</div>
			</div>
			
			<%-- bottom --%>
			<div id="bottom">
			
				<%-- bottom left - div --%>
				<div id="bottom_left"></div>
				
				<%-- bottom center - div --%>
				<div id="bottom_center"></div>
				<%-- bottom left - right --%>
				<div id="bottom_right">
					<%--bottom-right top --%>
					<div id="b_r_top"></div>
					<%--bottom-right center 버튼 --%>
					<div id="b_r_center">
						<a href="#" class="btn btn-warning">수정하기</a>	
						<a href="#" class="btn btn-warning">삭제하기</a>
						<a href="#" class="btn btn-warning">목록으로</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
		</div>	
	</body>
</html>