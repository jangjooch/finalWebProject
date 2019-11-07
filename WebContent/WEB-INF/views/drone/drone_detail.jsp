<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../main/top.jsp" flush="false"/>

		<script type="text/javascript">
		</script>
		<style>
		</style>
	<body>
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
							<h2> DroneDetail </h2>
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
							<form>
						<%-- 드론번호 primary key h --%>
						<div class="form-group row">
							<label for="d_num" class="col-sm-5 col-form-label">드론 번호</label>
							<div class="col-sm-7">
								<input type="text" id="d_number" value="${dronedto.d_number}" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="d_model" class="col-sm-5 col-form-label">드론 모델명</label>
							<div class="col-sm-7">
								<input type="text" id="d_model" value="${dronedto.d_model}" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="d_status" class="col-sm-5 col-form-label">드론 상태</label>
							<div class="col-sm-7">
								<input type="text" id="d_status" value="${dronedto.d_status}" 
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="d_weight" class="col-sm-5 col-form-label">적재 가능 중량</label>
							<div class="col-sm-7">
								<input type="text" id="d_weight" value="${dronedto.d_weight}"
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="d_battery" class="col-sm-5 col-form-label">비행 가능 시간</label>
							<div class="col-sm-7">
								<input type="text" id="d_battery" value="${dronedto.d_battery}" 
									class="form-control" readonly>
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
									<a href="drone_updateForm?d_number=${dronedto.d_number}" class="btn btn-warning">수정하기</a>	
						<a href="drone_delete?d_number=${dronedto.d_number}" class="btn btn-warning">삭제하기</a>
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