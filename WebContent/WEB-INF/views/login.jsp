<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A Control Center login</title>
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js">
	
</script>
<link rel="stylesheet" tpye="text/css"
	href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<!-- bootstrap의 css를 가져옴 -->
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<!-- bootstrap을 사용하기 위해서는 css파일과 js 파일 두가지 다 필요하다 -->
<script type="text/javascript">
	function checkForm() {
		var result = true;
		// 모든 span의 error의 내용 지우기
		$(".error").text("");
		// class는 .클래스 명으로 접근
		// 내부에 html이 있는 것이 아닌 String이기에 text("")으로 초기화
		// 입력값 검사
		if ($("#m_id").val() == "") {
			$("#mIdError").text("* Input ID *");
			result = false;
		}
		if ($("#m_pw").val() == "") {
			$("#mPasswordError").text("* Input PW *");
			result = false;
		}
		return result;
	}
</script>
<style type="text/css">
html, body {
	height: 100%;
}

#wrapper {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	background-image: url("resources/image/background_firefighter_test.png");
	background-size: 100%100%;
}

#header {
	border-bottom: 3px ;
	flex-grow: 5;
}

#content {
	flex-grow: 2;
	min-height: 0;
	border-bottom: 3px ;
	display: flex;
	flex-direction: row;
}

#content_left {
	flex-grow: 5;
}

#content_center {
	flex-grow: 0.5;
	display: flex;
	flex-direction: column;
	background-image: url("resources/image/opacity_background.png");
	
	background-size: 100%100%;
}


#top{
	height: 20px;
}
#logo{
	flex-grow: 1;
	display: flex;
	flex-direction: row;
}
#logo_left{
	flex-grow: 1;
}
#logo_center{	
	background-image: url("resources/image/DroneLogo1.png");
	background-size: 100%100%;
	height: 100px;
	width: 200px;
}
#logo_right{
	flex-grow: 1;
}
#betweenlogoForm{
	flex-grow: 1;
}
#loginForm{
	flex-grow: 1;
}

#login_text{
	color: white;
	font-size: 40px;
	text-align: center;
	height: 80px;
	font-weight: bold;
}

#content_right {
	flex-grow: 5;
}
#input{
	display: flex;
	flex-direction: row; 
}
#input_button_left{
	flex-grow: 1;
}


#input_button_right{
	flex-grow: 1;
}

#login_bottom{
	height: 50px;
}

#bottom {
	flex-grow: 4;
	border-bottom: 3px ;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div class="row" id="content">
			<div id="content_left">
			</div>
			<div id="content_center" style="border: 1px ;">
				<div id="login_text">
					Login
				</div>
				<div id="top">
				</div>
				<div id="logo">
					<div id="logo_left">
					</div>
					<div id="logo_center">
					</div>
					<div id="logo_right">
					</div>
				</div>
				<div id="betweenlogoForm">
				</div>
				<div id="loginForm">
					<form method="post" action="login" onsubmit="return checkForm()">
								<div id="input">
								<div id="input_button_left">
								</div>
								<div class="form-group">
									<label for="mid">ID</label>
									<!-- 해당 라벨을 클릭하면 해당 title로 이동 -->
									<input id="m_id" name="m_id" type="text" class="form-control"
										placeholder="Input ID"> <span class="error"
										id="mIdError" style="color: red;"> ${Id_error} </span>
									<!-- model에서 전달받은 속성 값 Id_error를 출력 -->
								</div>
								<div id="input_button_right">
								</div>
								</div>
								
								
								<div id="input">
								<div id="input_button_left">
								</div>
								<div class="form-group">
									<label for="m_password">PW</label> <input id="m_pw"
										name="m_pw" type="password" class="form-control"
										placeholder="Input PW"> <span class="error"
										id="mPasswordError" style="color: red;"> ${Pw_error} </span>
								</div>
								<div id="input_button_right">
								</div>
								</div>
								
								<div id="input">
									<div id="input_button_left">
									</div>
										<div class="form-group" >
											<input type="submit" value="Login" class="btn btn-success"/>
										</div>	
									<div id="input_button_right">
									</div>				
								</div>
				
					</form>
					<div id="login_bottom">
					</div>
				</div>
			</div>
			<div id="content_right">
			</div>
		</div>
		<div id="bottom">
		</div>
	</div>
</body>
</html>