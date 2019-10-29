<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 수정</title>
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
	<body>
		<div id="body">
			
			<%-- top --%>
			<div id="top">
				<div id="top_top"></div>
				<div id="top_center">
					<h1>회원 수정</h1>
				</div>
				<div id="top_bottom"></div>
			</div>
			
			<%-- center_detail --%>
			<div id="center_detail">
				<div id="center_left"></div>
				<div id="center_center">
					<form action="#" method="post" onsubmit="">
						<input type="hidden" id="m_num" name="m_num" class="form-control">
					
						<div class="form-group row">
							<label for="m_id" class="col-sm-2 col-form-label">ID</label>
							<div class="input-group col-sm-10">
								<input type="text" id="m_id" name="m_id" class="form-control"  value="${member.m_id }">
								<div class="input-group-append">
									<input type="button" class="btn btn-danger"	value="중복체크"
										 onclick="checkMid()">
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="m_name" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input type="text" id="m_name" name="m_name" value="${member.m_name }"
									class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="m_pw" class="col-sm-2 col-form-label">PW</label>
							<div class="col-sm-10">
								<input type="password" id="m_pw" name="m_pw" value="${member.m_pw }"
									class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="m_phone" class="col-sm-2 col-form-label">TEL</label>
							<div class="col-sm-10">
								<input type="tel" pattern="(010)\d{3,4}\d{4}" id="m_phone" name="m_phone" value="${member.m_phone }"
									class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="po_num" class="col-sm-2 col-form-label">직급</label>
							<div class="col-sm-10">
								<select class="form-control" name="po_num">
									<option selected="selected">선택하세요</option>
									<option value="1">관리자</option>
									<option value="2">보급 담당자</option>
									<option value="3">드론 담당자</option>
									<option value="4">요청자</option>
								</select>								
							</div>
							</div>
						<div class="form-group row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
								<input type="submit" class="btn btn-primary" 
									value="수정 완료">
								<input type="reset" class="btn btn-primary" 
									value="취소 하기">
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
						<a href="memberDetail?m_num=${member.m_num}" class="btn btn-warning">돌아가기</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
		</div>	
	</body>
</html>