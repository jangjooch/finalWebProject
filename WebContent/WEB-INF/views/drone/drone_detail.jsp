<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>드론 상세 페이지</title>
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
					<h1>드론 상세 페이지</h1>
				</div>
				<div id="top_bottom"></div>
			</div>
			
			<%-- center_detail --%>
			<div id="center_detail">
				<div id="center_left"></div>
				<div id="center_center">
					<form>
						<%-- 드론번호 primary key h --%>
						<div class="form-group row">
							<label for="d_num" class="col-sm-5 col-form-label">드론 번호</label>
							<div class="col-sm-7">
								<input type="text" id="d_number" value="${dronedto.d_number}" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="d_model" class="col-sm-5 col-form-label">드론 모델명</label>
							<div class="col-sm-7">
								<input type="text" id="d_model" value="${dronedto.d_model}" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="d_status" class="col-sm-5 col-form-label">드론 상태</label>
							<div class="col-sm-7">
								<input type="text" id="d_status" value="${dronedto.d_status}" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="d_weight" class="col-sm-5 col-form-label">적재 가능 중량</label>
							<div class="col-sm-7">
								<input type="text" id="d_weight" value="${dronedto.d_weight}"
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="d_battery" class="col-sm-5 col-form-label">비행 가능 시간</label>
							<div class="col-sm-7">
								<input type="text" id="d_battery" value="${dronedto.d_battery}" 
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
						<a href="drone_updateForm?d_number=${dronedto.d_number}" class="btn btn-warning">수정하기</a>	
						<a href="drone_delete?d_number=${dronedto.d_number}" class="btn btn-warning">삭제하기</a>
						<a href="drone_list" class="btn btn-warning">목록으로</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
		</div>	
	</body>
</html>