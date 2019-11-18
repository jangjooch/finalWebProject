<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
			<script type="text/javascript"
				src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js">
				
			</script>
				<link rel="stylesheet" type="text/css"
					href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
				<!-- bootstrap의 css를 가져옴 -->
				<script type="text/javascript"
					src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
				<!-- bootstrap을 사용하기 위해서는 css파일과 js 파일 두가지 다 필요하다 -->
				
			<style type="text/css">
				#wrapper {
					width: 100%;
					height: 100%;
					display: flex;
					flex-direction: column;
					
				}
				
			</style>
			
	</head>
	
	<body>

			<jsp:include page="main/top.jsp" flush="false"/>
					
					<div id="wrapper">
					
					<div id="body_image_All">
						
						
						<div class="body_image">
								  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
								    <ol class="carousel-indicators">
								      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
								      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
								      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
								    </ol>
								    <div class="carousel-inner">
								      <div class="carousel-item active">
								        <img src="resources/image/phoster3.png" class="d-block w-100" alt="1000px">
								        <div class="carousel-caption d-none d-md-block">
								          
								        </div>
								      </div>
								      <div class="carousel-item">
								        <img src="resources/image/phoster2.png" class="d-block w-100" alt="1000px">
								        <div class="carousel-caption d-none d-md-block">
								          
								        </div>
								      </div>
								      <div class="carousel-item">
								        <img src="resources/image/phoster1.png" class="d-block w-100" alt="1000px">
								        <div class="carousel-caption d-none d-md-block">
								          
								        </div>
								      </div>
								    </div>
								    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
								  </div>
							</div>
					</div>
				</div>
			<jsp:include page="main/bottom.jsp" flush="false"/>

	</body>
	
</html>