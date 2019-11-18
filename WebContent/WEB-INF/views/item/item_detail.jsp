<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../main/top.jsp" flush="false"/>

		<script type="text/javascript">
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
							<h1> ItemDetail </h1>
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
								<%-- 물품 primary key h --%>
								<div class="form-group row">
									<label for="i_code" class="col-sm-4 col-form-label">물품 번호</label>
									<div class="col-sm-8">
										<input type="text" id="i_code" value="${item_selected.i_code}" 
											class="form-control" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label for="i_name" class="col-sm-4 col-form-label">물품 이름</label>
									<div class="col-sm-8">
										<input type="text" id="i_name" value="${item_selected.i_name}" 
											class="form-control" readonly="readonly">
									</div>
								</div>
								<div class="form-group row">
									<label for="i_mount" class="col-sm-4 col-form-label">물품 수량</label>
									<div class="col-sm-8">
										<input type="text" id="i_mount" value="${item_selected.i_mount}" 
											class="form-control" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label for="i_class" class="col-sm-4 col-form-label">분류</label>
									<div class="col-sm-8">
										<input type="text" id="i_class" value="${item_selected.i_class}"
											class="form-control" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label for="i_weight" class="col-sm-4 col-form-label">무게</label>
									<div class="col-sm-8">
										<input type="number" id="i_weight" value="${item_selected.i_weight}" 
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
									<a href="item_update" class="btn btn-warning">수정하기</a>	
									<a href="item_remove" class="btn btn-warning">삭제하기</a>
									<a href="item_list?ipageNumber=${ipageNumber}" class="btn btn-warning">목록으로</a>
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