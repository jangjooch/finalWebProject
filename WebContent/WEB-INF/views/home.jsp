<%@ page contentType="text/html; charset=UTF-8" %>

<!-- charset 설정을 위함. 기존에는 이상하게 되어있다. -->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Main</title>
		<style type="text/css">
			html, body{
				height: 100%;
			}
			#wrapper{
				width: 100%;
				height: 100%;
				display: flex;
				flex-direction: column;
			}
			#header{
				border-bottom: 3px solid black;
				margin-bottom: 15px
			}
			#content{
				flex-grow: 1;
				height: 95%;
				display: flex;
				min-height: 0;
			}
			#sideBar{
				width: 300px;
				height : 100%;
				background-color: gray;
				padding-right: 15px;
				border-right: 3px solid black;
								
			}
			#center{				
				flex-grow: 1;
				padding : 20px;				
			}
			#center iframe{
				margin-top: 0px;
				width: 100%;
				height: 100%;
			}
			#footer{
				border-top: 3px solid black;
				margin-top: 15px
			}
		</style>
		
</head>
<body>
	
	<div id = "wrapper">
		<div id = "header">
			<h3>관제소</h3>
		</div>
		<div id = "content">
			<div id = "sideBar">
				<ul>
					<li>
						<form action="home">
							<input type = "submit" value = "HOME">
						</form>
					</li>
					<br>
					<li>
						<form action="member/memberList" target="iframe">
							<input type = "submit" value = "MEMBER">
						</form>
					</li>
					<br>
					<li>
						<form action="home">
							<input type = "submit" value = "HOME">
						</form>
					</li>
					<br>
				</ul>
			</div>
			<div id = "center">
				<iframe src="home/login" name="iframe" frameborder="0"></iframe>
			</div>
		</div>
		<div id = "footer">2019. Iot. JSH</div>
	</div>
	
</body>
</html>