<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- charset 설정을 위함. 기존에는 이상하게 되어있다. -->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Main</title>
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" tpye="text/css"
			href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<!-- bootstrap의 css를 가져옴 -->
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<!-- bootstrap을 사용하기 위해서는 css파일과 js 파일 두가지 다 필요하다 -->
		<style type="text/css">
			#wrapper{
				height: 100vh;
				display: flex;
				flex-direction: column;
			}
			#header{
				flex: 1;
				border-bottom: 3px solid black;
				text-align: center;
				display: flex;
			}
				#header_left{
					flex: 1;
				}
				#header_center{
					flex: 1;
					text-align: center;
				}
				#header_right{
					flex: 1;
				}
			
			#content{
				height: 80%;
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
				background-image: url("resources/image/DroneLogo1.png");
				background-size: 100% 100%;
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
				flex: 1;
				border-top: 3px solid black;
			}
			
			ul{
				list-style-type: none;
			}
		</style>
		
</head>
<body>
	
	<div id = "wrapper">
		<div id = "header">
			<div id="header_left"></div>
			<div id="header_center">
				<h3>관제소</h3>
			</div>
			<div id="header_right">
				<a href="logOut" class="btn btn-success">Log Out</a>
			</div>
		</div>
		<div id = "content">
			<div id = "sideBar">
				<div id = "sideBar_img">
				</div>
				<div id = "sideBar_menu">
					<ul>
						<li>
							<form action="home">
								<input type = "submit" value = "HOME" class="btn btn-success">
							</form>
							<br>
						</li>
						
						<c:if test="${member_logined.po_num == 1}">
							<li>
								<form action="member/memberList" target="iframe">
									<input type = "submit" value = "MEMBER" class="btn btn-success">
								</form>
							</li>
							<br>
						</c:if>
						
						<c:if test="${member_logined.po_num <= 2}">
							<li>
								<form action="drone/drone_list" target="iframe">
									<input type = "submit" value = "DRONE" class="btn btn-success">
								</form>
							</li>
							<br>
						</c:if>
						
						<c:if test="${member_logined.po_num <= 3}">
							<li>
								<form action="mission/missionList" target="iframe">
									<input type = "submit" value = "MISSION" class="btn btn-success">
								</form>
							</li>
							<br>
						</c:if>
						
						<c:if test="${member_logined.po_num == 3 || member_logined.po_num == 1}">
							<li>
								<form action="item/item_list" target="iframe">
									<input type = "submit" value = "ITEM" class="btn btn-success">
								</form>
							</li>
							<br>
						</c:if>
											
						<li>
							<form action="log/log_list" target="iframe">
								<input type = "submit" value = "HISTORY" class="btn btn-success">
							</form>
							<br>
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