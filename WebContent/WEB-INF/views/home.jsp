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
		<link rel="stylesheet" type="text/css"
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
				height: 150px;
				text-align: center;
				display: flex;
				background-image: url("resources/image/header.png");
				background-size: 100% 100%;
			}
				#header_left{
					width: 250px;
				}
				#header_center{
					flex: 2;
					text-align: center;
					font-weight: bold;
					font-size: 3em;
					flex-direction: row;
				}
				#header_center_hr{
					flex: 1 ;
				}
				
								
				#header_right{
					width: 250px;
				}
			
			#content{
				height: 80%;
				display: flex;
				min-height: 0;
			}
			#sideBar{
				width: 250px;
				height : 100%;
				background-image: url("resources/image/sidebar_eagle.png");
				background-size: 100% 100%;
				padding-right: 15px;
				display: flex;
				flex-direction: column;						
			}
			#sideBar_img{
				width: 100%;
				height : 200px;
				
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
				text-align: center;
				flex: 0.3;
				border-top: 1px solid ;
			}
			
			ul{
				list-style-type: none;
			}
		</style>
		
</head>
<body>
	
	<div id = "wrapper">
		<div id = "header">
			<div id="header_left">
				<div>
				<a href="https://www.seoul.go.kr/" title="서울특별시 홈페이지로 이동">
				<img src="resources/image/seoul_logo.png" >
				</a>
				</div>
				<div>
				<a href="https://fire.seoul.go.kr/" title="소방재난본부 홈페이지로 이동">
				<img src="resources/image/seoulFirefighter_logo.png">
				</a>
				</div>
			</div>
			
			<div id="header_center" >
				<div id="header_center_hr">
			</div>
				<div id="header_center_hr">
				<p><img src="resources/image/moniter.png" height="60px" width="60px">차세대 재난 구조 시스템</p>
				</div>
				<div id="header_center_hr">
			</div>
			</div>
			
			<div id="header_right">
			<div>
			</div>	
			</div>
		</div>
		<div id = "content">
			<div id = "sideBar">
				
				<div id = "sideBar_img">
				<a href="home">
				<img src="resources/image/DroneLogo1.png" width="100%" height="200px">
				</a>
				</div>
				
				<div id = "sideBar_menu">
					<ul>
						<!-- 
						<li>
							<form action="home">
								<input type = "submit" value = "HOME" class="btn btn-success">
							</form>
							<br>
						</li>
						 -->
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
								<form action="mission/missionInList" target="iframe">
									<input type = "submit" value = "MISSION IN" class="btn btn-success">
								</form>
							</li>
							<br>
						</c:if>
						<c:if test="${member_logined.po_num <= 2}">
							<li>
								<form action="mission/missionProList" target="iframe">
									<input type = "submit" value = "MISSION PROGRESS" class="btn btn-success">
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
							<a href="logOut" class="btn btn-success">Log Out</a>
						</li>
					</ul>
				</div>
				
			</div>
			<div id = "center">
				<iframe name="iframe" frameborder="0"></iframe>
			</div>
		</div>
		<div id="footer">2019. Iot. JSH</div>
	</div>
	
</body>
</html>