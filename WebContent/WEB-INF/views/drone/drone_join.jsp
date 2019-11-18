<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../main/top.jsp" flush="false"/>

		<script type="text/javascript">
			function checkForm(){
						var result = true;
						//모든 에러 내용 지우기
						$(".error").text("");
						$(".error").css("color", "red");
						//입력값 검사
						if($("#d_model").val()=="")
							{
								$("#d_modelError").text("*모델을 입력하세요.");
								
								result = false;
							}
						if($("#d_status").val()=="")
						{
							$("#d_statusError").text("*상태를 입력하세요.");
							result = false;
						}
						if($("#d_weight").val()=="")
						{
							$("#d_weightError").text("*중량을 입력하세요.");
							result = false;
						}
						if($("#d_battery").val()=="")
						{
							$("#d_batteryError").text("*비행 가능 시간을 입력하세요.");
							result = false;
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
							<h1> DroneInsert </h1>
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
							<form action="drone_join" method="post" onsubmit="return checkForm()">
						
						<div class="form-group row">
							<label for="d_model" class="col-sm-5 col-form-label">드론 모델명</label>
							<div class="col-sm-7">
								<input type="text" id="d_model" name="d_model"
									class="form-control" placeholder="모델을 입력하세요.">
									<span id = "d_modelError"class="error" style="color:red">${d_modelError}</span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<label for="d_status" class="col-sm-5 col-form-label">드론 상태</label>
							<div class="col-sm-7">
								<input type="text" id="d_status" name="d_status"
									class="form-control" placeholder="상태를 입력하세요.">
									<span id = "d_statusError"class="error" style="color:red">${d_statusError}</span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<label for="d_weight" class="col-sm-5 col-form-label">적재 가능 중량</label>
							<div class="col-sm-7">
								<input type="text" id="d_weight" name="d_weight"
									class="form-control" placeholder="적재 가능 중량을 입력하세요.">
								<span id = "d_weightError"class="error" style="color:red">${d_weightError}</span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<label for="d_battery" class="col-sm-5 col-form-label">최대 비행 가능 시간</label>
							<div class="col-sm-7">
								<input type="text" id="d_battery" name="d_battery"
									class="form-control" placeholder="비행 가능 시간을 등록하세요.">
									<span id = "d_batteryError" class="error" style="color:red">${d_battery}</span>
							</div>
							<%-- 입력값 검사 효과 추가해야함 --%>
						</div>
						<div class="form-group row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									
								<input type="submit" class="btn btn-primary" 
									value="등록하기">
								<input type="reset" class="btn btn-primary" 
									value="취소하기">
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
									<a href="drone_list?drone_pageNo=${drone_pageNo}" class="btn btn-warning">목록으로</a>
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