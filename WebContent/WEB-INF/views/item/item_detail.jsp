<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>물품 상세 페이지</title>
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
			flex: 1;	
			text-align: right;
		}
		#center_center{
			text-align: right;
		}
			
		#center_right{
			flex: 1;
		}
			
	</style>
	<body>
		<div id="body">
			
			<%-- top --%>
			<div id="top">
				<div id="top_top"></div>
				<div id="top_center">
					<h1>물품 상세 페이지</h1>
				</div>
				<div id="top_bottom"></div>
			</div>
			
			<%-- center_detail --%>
			<div id="center_detail">
				<div id="center_left"></div>
				<div id="center_center">
					<form>
						<%-- 물품 primary key h --%>
						<div class="form-group row">
							<label for="i_code" class="col-sm-4 col-form-label">물품 번호</label>
							<div class="col-sm-8">
								<input type="text" id="i_code" value="${item_selected.i_code}" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="i_name" class="col-sm-4 col-form-label">물품 이름</label>
							<div class="col-sm-8">
								<input type="text" id="i_name" value="${item_selected.i_name}" 
									class="form-control" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="i_mount" class="col-sm-4 col-form-label">물품 수량</label>
							<div class="col-sm-8">
								<input type="text" id="i_mount" value="${item_selected.i_mount}" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="i_class" class="col-sm-4 col-form-label">분류</label>
							<div class="col-sm-8">
								<input type="text" id="i_class" value="${item_selected.i_class}"
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="i_weight" class="col-sm-4 col-form-label">무게</label>
							<div class="col-sm-8">
								<input type="number" id="i_weight" value="${item_selected.i_weight}" 
									class="form-control" readonly>
							</div>
						</div>
					</form>
				</div>
				<div id="center_right"></div>
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
						<a href="item_update" class="btn btn-warning">수정하기</a>	
						<a href="item_remove" class="btn btn-warning">삭제하기</a>
						<a href="item_list?ipageNumber=${ipageNumber}" class="btn btn-warning">목록으로</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
		</div>	
	</body>
</html>