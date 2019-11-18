<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../main/top.jsp" flush="false"/>

		<script type="text/javascript">
			var mid_check = false;
	
	function checkForm() {
		var result = true;
		// 모든 span의 error의 내용 지우기
		$(".error").text("");
		// class는 .클래스 명으로 접근
		// 내부에 html이 있는 것이 아닌 String이기에 text("")으로 초기화
		// 입력값 검사
		if(mid_check == false){
			result = false;
		}
		else{
			result = true;
			if ($("#i_name").val() == "") {
				$("#iNameError").text("* Input NAME *");
				result = false;
			}
			if ($("#i_mount").val() == "") {
				$("#iMountError").text("* Input MOUNT *");
				result = false;
			}
			if ($("#i_class").val() == "0") {
				$("#iClassError").text("* Choose CLASS *");
				result = false;
			}
			if ($("#i_weight").val() == "") {
				$("#iWeightError").text("* Input WEIGHT *");
				result = false;
			}
		}		
		return result;
	}
	
	function checkMid(){
		$(".error").text("");
		if ($("#i_name").val() == "") {
			$("#iNameError").text("* Input NAME *");
			mid_check = false;
		}
		else{
			$.ajax({
				url: "checkIname",
				// Controller checkMid를 통해 결과를 얻는다.
				data: {
					i_name:$("#i_name").val()
					},
				success: function(data){
					if(data.result){
						$("#iNameError").text("Available to Use");
						$("#iNameError").css("color","green");
						mid_check = true;
					}else{
						$("#iNameError").text("It's Occupied");
						$("#iNameError").css("color","red");
						mid_check = false;
					}
				}
			});	
		}
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
							<h1> ItemUpdate </h1>
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
							<form action="item_edit" method="post" onsubmit="return checkForm()">
								<div class="form-group row">
									<label for="i_name" class="col-sm-4 col-form-label">물품</label>
									<div class="input-group col-sm-8">
										<input type="text" id="i_name" name="i_name" value="${item_selected.i_name}"
											class="form-control" readonly="readonly">
										<div class="input-group-append">
												<input class="btn btn-danger" type="button" onclick="checkMid()" value="중복검사">
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-4"></div>
									<div class="col-sm-8">
										<span class="error" id ="iNameError" style="color: red;"></span>
									</div>						
								</div>
								<div class="form-group row">
									<label for="i_mount" class="col-sm-4 col-form-label">물품 수량</label>
									<div class="col-sm-8">
										<input type="number" id="i_mount" name="i_mount" value="${item_selected.i_mount}"
											class="form-control">
										<span class="error" id = "iMountError" style="color: red;"></span>
									</div>							
									<%-- 입력값 검사 효과 추가해야함 --%>
								</div>
								<div class="form-group row">
									<label for="i_weight" class="col-sm-4 col-form-label">물품 무게</label>
									<div class="col-sm-8">
										<input type="number" id="i_weight" name="i_weight" value="${item_selected.i_weight}"
											class="form-control">
										<span class="error" id="iWeightError" style="color: red;"></span>
									</div>
									<%-- 입력값 검사 효과 추가해야함 --%>
								</div>
								<div class="form-group row">
									<label for="i_class" class="col-sm-4 col-form-label">물품 분류</label>
									<div class="col-sm-8">
										<select class="form-control" name="i_class">
											<option value="0" selected="selected">물품 분류</option>
											<option value="식품" 
												<c:if test="${item_selected.i_class eq '식품'}">selected
												</c:if>>식품</option>
											<option value="약품"
												<c:if test="${item_selected.i_class eq '약품'}">selected
												</c:if>
												>약품</option>
											<option value="구호 물품"
												<c:if test="${item_selected.i_class eq '구호 물품'}">selected
												</c:if>
												>구호 물품</option>
											<option value="하품"
												<c:if test="${item_selected.i_class eq '하품'}">selected
												</c:if>
												>하품</option>
										</select>
										<span class="error" id = "iClassError" style="color: red;"></span>				
									</div>
									<%-- 입력값 검사 효과 추가해야함 --%>
								</div>
								<div class="form-group row">
									<div class="col-sm-6"></div>
									<div class="col-sm-6">
										<input type="submit" class="btn btn-primary" 
											value="수정하기">
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
									<a href="item_list?ipageNumber=${ipageNumer}" class="btn btn-warning">목록으로</a>
								</div>
							</div>
						</div>
						<div id="bottom_b">
							<div style="height: 20px;"></div>
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
				
				<div class="col-sm-2"></div>
				<div class="col-sm-8" style="height: 100px;"></div>
				<div class="col-sm-2"></div>
				
			</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>