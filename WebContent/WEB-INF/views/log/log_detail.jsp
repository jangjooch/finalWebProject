<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../main/top.jsp" flush="false"/>

		<script type="text/javascript">
			function searchSelect(){
				var result = true;
				if ($("#searchThing").val() == "0") {
					result = false;
				}
				if($("#things").val() == ""){
					result = false;
				}
				return result;
			}
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
							<h2> LogDetail # ${logDto.droneMissionDto.d_m_number} </h2>
						</div>
						<div id="top_b">
							
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
				
				<%-- center --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div class="row">
					<div class="col-sm-6">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>요청 번호</th>
									<td>${logDto.requestDto.re_num}</td>
								</tr>
								<tr>
									<th>요청자/직급</th>
									<td>${logDto.memberDto.m_name}/${logDto.memberDto.po_position}</td>
								</tr>
								<tr>
									<th>요청 시간</th>
									<td><fmt:formatDate value="${logDto.requestDto.re_time}" pattern="yyyy-MM-dd / hh:mm:ss"/></td>
								</tr>
								<tr>
									<th>요청 위치 x/y</th>
									<td>${logDto.requestDto.re_location_x}/${logDto.requestDto.re_location_y}</td>
								</tr>
								<tr>
									<th>요청 물품 및 수량</th>
									<td>
										<c:forEach var="i" items="${logDto.requestDto.missionItems}">
											${i.itemDto.i_name} / ${i.itemDto.i_weight}<br/>
										</c:forEach>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>기록 번호</th>
									<td>${logDto.droneMissionDto.d_m_number}</td>
								</tr>
								<tr>
									<th>처리자/직급</th>
									<td>${logDto.droneMissionDto.memberDto.m_name}/${logDto.droneMissionDto.memberDto.po_position}</td>
								</tr>
								<tr>
									<th>드론 번호</th>
									<td>${logDto.droneDto.d_number}</td>
								</tr>
								<tr>
									<th>드론 모델명</th>
									<td>${logDto.droneDto.d_model}</td>
								</tr>
								<tr>
									<th>비고</th>
									<c:if test="${logDto.requestDto.re_success == 5}">
										<td>미션 완료</td>
									</c:if>
									<c:if test="${logDto.requestDto.re_success == 6}">
										<td>요청 거절</td>
									</c:if>
								</tr>
								
							</tbody>
						</table>
					</div>
					<div class="col-sm-12">
						<div id="center_right">
							<table class="table table-bordered"  style="border: 2px solid black;">
								<tbody>
									<tr>
										<th width="20%">미션 작성일 시간</th>
										<td><fmt:formatDate value="${logDto.droneMissionDto.d_m_preparation}" pattern="yyyy-MM-dd / hh:mm:ss"/></td>
									</tr>
									<tr>
										<th>미션 내용</th>
										<td>
											${logDto.droneMissionDto.d_m_start}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
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
								<div><a href="log_list?pageNo=${pageNo}" class="btn btn-warning">목록으로</a></div>
							</div>
						</div>
						<div id="bottom_b" style="height: 20px;"></div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>