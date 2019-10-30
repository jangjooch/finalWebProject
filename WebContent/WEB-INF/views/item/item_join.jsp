<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>물품 등록</title>
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
	<script type="text/javascript">
	function checkForm() {
		var result = true;
		// 모든 span의 error의 내용 지우기
		$(".error").text("");
		// class는 .클래스 명으로 접근
		// 내부에 html이 있는 것이 아닌 String이기에 text("")으로 초기화
		// 입력값 검사
		if ($("#i_name").val() == "") {
			$("#iNameError").text("* Input NAME *");
			result = false;
		}
		if ($("#i_mount").val() == "") {
			$("#iMountError").text("* Input MOUNT *");
			result = false;
		}
		if ($("#i_class").val() == "0") {
			$("#iClassError").text("* Choose CLASS *");
			result = false;
		}
		if ($("#i_weight").val() == "") {
			$("#iWeightError").text("* Input WEIGHT *");
			result = false;
		}
		return result;
	}
	
	function checkMid(){
		$(".error").text("");
		if ($("#i_name").val() == "") {
			$("#iNameError").text("* Input NAME *");
			result = false;
		}
		else{
			$.ajax({
				url: "checkIname",
				// Controller checkMid를 통해 결과를 얻는다.
				data: {
					i_name:$("#i_name").val()
					},
				success: function(data){
					if(data.result){
						$("#iNameError").text("Available to Use");
						$("#iNameError").css("color","green");
					}else{
						$("#iNameError").text("It's Occupied");
						$("#iNameError").css("color","red");
					}
				}
			});	
		}
	}
	
	</script>
	<body>
		<div id="body">
			
			<%-- top --%>
			<div id="top">
				<div id="top_top"></div>
				<div id="top_center">
					<h1>물품 등록</h1>
				</div>
				<div id="top_bottom"></div>
			</div>
			
			<%-- center_detail --%>
			<div id="center_detail">
				<div id="center_left"></div>
				<div id="center_center">
					<form action="item_join" method="post" onsubmit="return checkForm()">
						<div class="form-group row">
							<label for="i_name" class="col-sm-4 col-form-label">물품</label>
							<div class="input-group col-sm-8">
								<input type="text" id="i_name" name="i_name"
									class="form-control" placeholder="물품을 등록하세요.">
								<div class="input-group-append">
									<input class="btn btn-danger" type="button" onclick="checkMid()" value="중복검사">
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-4"></div>
							<div class="col-sm-8">
								<span class="error" id ="iNameError" style="color: red;"></span>
							</div>						
						</div>
						
						<div class="form-group row">
							<label for="i_mount" class="col-sm-4 col-form-label">물품 수량</label>
							<div class="col-sm-8">
								<input type="number" id="i_mount" name="i_mount"
									class="form-control" placeholder="물품 수량을 입력하세요">
								<span class="error" id = "iMountError" style="color: red;"></span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<label for="i_weight" class="col-sm-4 col-form-label">물품 무게</label>
							<div class="col-sm-8">
								<input type="number" id="i_weight" name="i_weight"
									class="form-control" placeholder="물품 무게를 등록하세요.">
								<span class="error" id="iWeightError" style="color: red;"></span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<label for="i_class" class="col-sm-4 col-form-label">물품 분류</label>
							<div class="col-sm-8">
								<select class="form-control" name="i_class" id="i_class">
									<option value="0" selected="selected">물품 분류</option>
									<option value="식품">식품</option>
									<option value="약품">약품</option>
									<option value="구호 물품">구호 물품</option>
									<option value="하품">하품</option>
								</select>
								<span class="error" id = "iClassError" style="color: red;"></span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
								<input type="submit" class="btn btn-primary" 
									value="등록하기">
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
						<a href="item_list?ipageNumber=${ipageNumber}" class="btn btn-warning">목록으로</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
		</div>	
	</body>
</html>