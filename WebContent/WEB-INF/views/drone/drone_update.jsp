<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>드론 수정 페이지</title>
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/css/shc/collection.css">
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
					function checkForm(){
						var result = true;
						//모든 에러 내용 지우기
						$(".error").text("");
						$(".error").css("color", "red");
						//입력값 검사
						if($("#d_model").val()=="")
							{
								$("#d_modelError").text("*모델을 입력하세요.");
								
								result = false;
							}
						if($("#d_status").val()=="")
						{
							$("#d_statusError").text("*상태를 입력하세요.");
							result = false;
						}
						if($("#d_weight").val()=="")
						{
							$("#d_weightError").text("*중량을 입력하세요.");
							result = false;
						}
						if($("#d_battery").val()=="")
						{
							$("#d_batteryError").text("*비행 가능 시간을 입력하세요.");
							result = false;
						}
						
						return result;
					}	
					
				</script>
	
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
			flex:1;
		}
		
		#center_center{
			display: flex;
			flex-direction: column;
			width: 30%;
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
					<h1>드론 수정 페이지</h1>
				</div>
				<div id="top_bottom"></div>
			</div>
			
			<div id="center_detail">
				<div id="center_left"></div>
				<div id="center_center">
					<form action="drone_update" method="post" onsubmit="return checkForm()">
						
						<div class="form-group row">
							<label for="d_number" class="col-sm-5 col-form-label">드론 번호</label>
							<div class="col-sm-7">
								<input type="text" id="d_number" name="d_number" value="${dronedto.d_number}" 
									class="form-control" readonly>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="d_model" class="col-sm-5 col-form-label">드론 모델명</label>
							<div class="col-sm-7">
								<input type="text" id="d_model" name="d_model"
									class="form-control" placeholder="모델을 입력하세요.">
									<span id = "d_modelError"class="error" style="color:red">${d_modelError}</span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<label for="d_status" class="col-sm-5 col-form-label">드론 상태</label>
							<div class="col-sm-7">
								<input type="text" id="d_status" name="d_status"
									class="form-control" placeholder="상태를 입력하세요.">
									<span id = "d_statusError"class="error" style="color:red">${d_statusError}</span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<label for="d_weight" class="col-sm-5 col-form-label">적재 가능 중량</label>
							<div class="col-sm-7">
								<input type="text" id="d_weight" name="d_weight"
									class="form-control" placeholder="적재 가능 중량을 입력하세요.">
								<span id = "d_weightError"class="error" style="color:red">${d_weightError}</span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<label for="d_battery" class="col-sm-5 col-form-label">최대 비행 가능 시간</label>
							<div class="col-sm-7">
								<input type="text" id="d_battery" name="d_battery"
									class="form-control" placeholder="비행 가능 시간을 등록하세요.">
									<span id = "d_batteryError" class="error" style="color:red">${d_battery}</span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									
								<input type="submit" class="btn btn-primary" 
									value="수정하기">
								<input type="reset" class="btn btn-primary" 
									value="취소하기">
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
						<a href="drone_list" class="btn btn-warning">목록으로</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
		</div>	
	</body>
</html>