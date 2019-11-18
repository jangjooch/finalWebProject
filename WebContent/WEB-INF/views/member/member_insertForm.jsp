<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../main/top.jsp" flush="false"/>
		<script type="text/javascript">
	var availability = false;
	
	$(document).ready(function(){
		$("#m_id").blur(function() {
			$.ajax({
				url : "checkMid",
				data:{m_id:$("#m_id").val()},
				success : function(data) {
						if (data.result == false) {
							$("#m_idError").text("사용중인 아이디입니다.");
							$("#m_idError").css("color", "red");
							availability = false;
						}
						if (data.result == false) {
							$("#m_idError").text("사용중인 아이디입니다.");
							$("#m_idError").css("color", "red");
							availability = false;
						}
						if (data.result == true) {
							$("#m_idError").text("사용할 수 있는 아이디 입니다.")
							$("#m_idError").css("color", "green");
							return availability = true;
						}
					}
			});
		});
	});
	
	function checkForm() {
		var result = true;
		//모든 에러 내용 지우기
		$(".error").text("");
		//입력값 검사

		if ($("#m_id").val() == "" || availability == false) {
			$("#m_idError").text("*아이디를 확인하세요.");
			result = false;
		}
		if ($("#m_name").val() == "") {
			$("#m_nameError").text("*이름을 확인하세요.");
			result = false;
		}
		if ($("#m_pw").val() == "") {
			$("#m_pwError").text("*비밀번호를 확인하세요.");
			result = false;
		}
		if ($("#m_phone").val() == "") {
			$("#m_phoneError").text("*연락처를 확인하세요.");
			result = false;
		}
		if ($("#po_num").val() == 0) {
			$("#po_numError").text("*직위를 확인하세요.");
			result = false;
		}
		if (availability != true) {
			result = false;
		}
		
		if (result != true) {
			availability = false;
		}
		
		return result;
	}
		</script>
		<style>
		</style>
		<%-- 전체 div --%>
			<div class="row">
				<%-- top --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8" id="top">
					<div id="top">
						<div id="top_t">
							<div style="height: 20px;"></div>
						</div>
						<div id="top_c">
							<h1> MemberInsert </h1>
						</div>
						<div id="top_b">
							<div style="height: 20px;"></div>
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
				
				<%-- center --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div class="row">
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
							<form action="insertMember" method="post" onsubmit="return checkForm()">
								<div class="form-group row">
									<label for="m_id" class="col-sm-2 col-form-label">ID</label>
									<div class="input-group col-sm-10">
										<input type="text" id="m_id" name="m_id" class="form-control"
											placeholder="아이디를 입력하세요.">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-9">
										<span id="m_idError" class="error" style="color:red"></span>
									</div>						
								</div>
								<div class="form-group row">
									<label for="m_name" class="col-sm-2 col-form-label">이름</label>
									<div class="col-sm-10">
										<input type="text" id="m_name" name="m_name" class="form-control"
											placeholder="이름을 입력하세요.">
										<span id="m_nameError" class="error" style="color:red"></span>
									</div>
									<%-- 입력값 검사 효과 추가해야함 --%>
								</div>
								<div class="form-group row">
									<label for="m_pw" class="col-sm-2 col-form-label">PW</label>
									<div class="col-sm-10">
										<input type="password" id="m_pw" name="m_pw" class="form-control"
											placeholder="비밀번호를 입력하세요.">
										<span id="m_pwError" class="error" style="color:red"></span>
									</div>
									<%-- 입력값 검사 효과 추가해야함 --%>
								</div>
								<div class="form-group row">
									<label for="m_phone" class="col-sm-2 col-form-label">TEL</label>
									<div class="col-sm-10">
										<input type="tel" pattern="(010)\d{3,4}\d{4}" id="m_phone"
											name="m_phone" class="form-control" placeholder=" - 를 빼고 입력하세요.">
										<span id="m_phoneError" class="error" style="color:red"></span>	
									</div>
									<%-- 입력값 검사 효과 추가해야함 --%>
								</div>
								<div class="form-group row">
									<label for="po_num" class="col-sm-2 col-form-label">직급</label>
									<div class="col-sm-10">
										<select class="form-control" id="po_num" name="po_num">
											<option value="0" selected>선택하세요</option>
											<option value="1">관리자</option>
											<option value="2">보급 담당자</option>
											<option value="3">드론 담당자</option>
											<option value="4">요청자</option>
											<option value="5">요청 담당자</option>
										</select>
											<span id="po_numError" class="error" style="color:red"></span>	
									</div>
									<%-- 입력값 검사 효과 추가해야함 --%>
								</div>
								<div class="form-group row">
									<div class="col-sm-6"></div>
									<div class="col-sm-6">
										<input type="submit" class="btn btn-primary" value="등록하기">
										<input type="reset" class="btn btn-primary" value="취소하기">
									</div>
								</div>
							</form>
						</div>
						<div class="col-sm-4"></div>		
					</div>
					
				</div>					
				<div class="col-sm-2"></div>
				
				<%-- bottom --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div id="bottom">
						<div id="bottom_t" style="height: 20px;"></div>
						<div id="bottom_c">
							<div id="bottom_c_l"></div>
							<div id="bottom_c_c">
								
							</div>
							<div id="bottom_c_r">
								<div>
									<a href="memberList?pageNo=${pageNo}" class="btn btn-warning">목록으로</a>
								</div>
							</div>
						</div>
						<div id="bottom_b">
							<div style="height: 20px;"></div>
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>