<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그 상세 페이지</title>
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
		
			
	</style>
	<body>
		<div id="body">
			
			<%-- top --%>
			<div id="top">
				<div id="top_top"></div>
				<div id="top_center">
					<h1>로그 상세 페이지 # ${droneMissionDto.d_m_number}</h1>
				</div>
				<div id="top_bottom"></div>
			</div>
			
			<%-- center_detail --%>
			<div id="center_detail row">
				<div class="row">
					<div class="col-sm-4">
						<div id="center_left">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>요청번호:</th>
										<td>${droneMissionDto.re_num}</td>
									</tr>
									<tr>
										<th>요청자:</th>
										<td>?</td>
									</tr>
									<tr>
										<th>요청시간:</th>
										<td>?</td>
									</tr>
									<tr>
										<th>요청 위치</th>
										<td>?</td>
									</tr>
									<tr>
										<th>요청 물품 및 수량</th>
										<td>?</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col-sm-4">
						<div id="center_center">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>처리자:</th>
										<td>${droneMissionDto.d_m_number}</td>
									</tr>
									<tr>
										<th>드론 번호</th>
										<td>${droneMissionDto.d_number}</td>
									</tr>
									<tr>
										<th>드론 모델명</th>
										<td>?</td>
									</tr>
									<tr>
										<th>적재량</th>
										<td>?</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col-sm-4">
						<div id="center_right">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th width="30%">미션 작성일 시간</th>
										<td><fmt:formatDate value="${droneMissionDto.d_m_preparation}" pattern="yyyy-MM-dd / hh:mm:ss"/></td>
									</tr>
									<tr>
										<th>미션 내용</th>
										<td>
											${droneMissionDto.d_m_start}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
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
						<a href="#" class="btn btn-warning">목록으로</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
		</div>	
	</body>
</html>