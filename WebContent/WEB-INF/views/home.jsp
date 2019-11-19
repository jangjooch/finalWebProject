<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:include page="main/top.jsp" flush="false"/>
	
	<div id="body_image_All">
		<div class="body_image">
			<div id="carouselExampleCaptions" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="resources/image/phoster3.png" class="d-block w-100"
							alt="1000px">
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<div class="carousel-item">
						<img src="resources/image/phoster2.png" class="d-block w-100"
							alt="1000px">
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<div class="carousel-item">
						<img src="resources/image/phoster1.png" class="d-block w-100"
							alt="1000px">
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleCaptions"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
</div>
	<jsp:include page="main/bottom.jsp" flush="false"/>
