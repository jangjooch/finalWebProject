<%@ page contentType="text/html; charset=UTF-8"%>

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
					<h1>로그 상세 페이지</h1>
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
										<th>요청자:</th>
										<td>김요청</td>
									</tr>
									<tr>
										<th>요청시간:</th>
										<td>2019/10/29 - 21:09</td>
									</tr>
									<tr>
										<th>요청 위치</th>
										<td>위치!</td>
									</tr>
									<tr>
										<th>요청 물품 및 수량</th>
										<td>물 / 2</td>
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
										<td>김처리</td>
									</tr>
									<tr>
										<th>드론 번호</th>
										<td>2</td>
									</tr>
									<tr>
										<th>드론 모델명</th>
										<td>앙 드론띠</td>
									</tr>
									<tr>
										<th>적재량</th>
										<td>3.5kg</td>
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
										<th width="30%">미션 작성일 / 시간</th>
										<td>2019/10/30 - 01:20</td>
									</tr>
									<tr>
										<th>미션 내용</th>
										<td>
<pre>
1. 동해물과 백두산이 마르고 닳도록
하느님이 보우하사 우리나라 만세
무궁화 삼천리 화려 강산
대한 사람 대한으로 길이 보전하세

2. 남산 위에 저 소나무 철갑을 두른 듯
바람 서리 불변함은 우리 기상일세
무궁화 삼천리 화려 강산
대한 사람 대한으로 길이 보전하세

3. 가을 하늘 공활한데 높고 구름 없이
밝은 달은 우리 가슴 일편단심일세
무궁화 삼천리 화려 강산
대한 사람 대한으로 길이 보전하세

4. 이 기상과 이 맘으로 충성을 다하여
괴로우나 즐거우나 나라 사랑하세
무궁화 삼천리 화려 강산
대한 사람 대한으로 길이 보전하세
</pre>
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