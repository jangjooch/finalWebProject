<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



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
				display: flex;
				flex-direction: column;								
			}
			#sideBar_img{
				
				width: 100%;
				height : 200px;
				background-image: url("resources/image/DroneLogo.png");
				background-size: 100%100%;
			}
			#sideBar_menu{
				
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
				<div id = "sideBar_img">
				</div>
				<div id = "sideBar_menu">
					<ul>
						<li>
							<form action="home">
								<input type = "submit" value = "HOME">
							</form>
							<br>
						</li>
						
						<c:if test="${m_rate == 1}">
							<li>
								<form action="member/memberList" target="iframe">
									<input type = "submit" value = "MEMBER">
								</form>
							</li>
							<br>
						</c:if>
						
						<c:if test="${m_rate <= 2}">
							<li>
								<form action="member/memberList" target="iframe">
									<input type = "submit" value = "DRONE">
								</form>
							</li>
							<br>
						</c:if>
						
						<c:if test="${m_rate <= 3}">
							<li>
								<form action="member/memberList" target="iframe">
									<input type = "submit" value = "MISSION">
								</form>
							</li>
							<br>
						</c:if>
						
						<c:if test="${m_rate == 3 || m_rate == 1}">
							<li>
								<form action="member/memberList" target="iframe">
									<input type = "submit" value = "ITEM">
								</form>
							</li>
							<br>
						</c:if>
											
						<li>
							<form action="member/memberList" target="iframe">
								<input type = "submit" value = "HISTORY">
							</form>
							<br>
						</li>
						
						<li>
							<a href="logOut" class = "btn btn-success">Logoff</a>
						</li>
					</ul>
				</div>
				
			</div>
			<div id = "center">
				<iframe name="iframe" frameborder="0"></iframe>
			</div>
		</div>
		<div id = "footer">2019. Iot. JSH</div>
	</div>
	
</body>
</html>