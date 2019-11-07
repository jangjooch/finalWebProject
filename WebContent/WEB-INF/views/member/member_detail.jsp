<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../main/top.jsp" flush="false"/>

		<script type="text/javascript">
			function memdel() {
				var con = confirm("정말 삭제하시겠습니까?");
				if (con == true) {
					location.href = "memberDelete?m_num=" + ${member.m_num};
				}
			}
		</script>
		
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
							<h2> MemberDetail </h2>
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
						<div class="col-sm-4">
							<form>
								<div class="form-group row">
									<label for="m_num" class="col-sm-4 col-form-label">회원 번호</label>
									<div class="col-sm-8">
										<input type="text" id="m_num" value="${member.m_num}" 
											class="form-control" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label for="m_name" class="col-sm-4 col-form-label">이름</label>
									<div class="col-sm-8">
										<input type="text" id="m_name" value="${member.m_name}" 
											class="form-control" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label for="m_id" class="col-sm-4 col-form-label">ID</label>
									<div class="col-sm-8">
										<input type="text" id="m_id" value="${member.m_id}" 
											class="form-control" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label for="m_pw" class="col-sm-4 col-form-label">PW</label>
									<div class="col-sm-8"> 
										<input type="password" id="m_pw" value="${member.m_pw}"
											class="form-control" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label for="m_phone" class="col-sm-4 col-form-label">TEL</label>
									<div class="col-sm-8">
										<input type="text" id="m_phone" value="${member.m_phone}" 
											class="form-control" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label for="po_num" class="col-sm-4 col-form-label">직급</label>
									<div class="col-sm-8">
										<input type="text" id="po_num" value="${member.po_position}"
											class="form-control" readonly>
									</div>
								</div>
							</form>
						</div>
						<div class="col-sm-8">
							<table class="table table-hover" style="border: 1px solid 1px">
								<thead class="thead-dark">
									<tr>
										<th scope="col" width="15%;">사건 번호</th>
										<th scope="col" width="15%;">요청 회원</th>
										<th scope="col" width="30%;">요청 위치(x, y)</th>
										<th scope="col" width="20%;">요청 일시</th>
										<th scope="col" width="20%">처리 회원</th>									
									</tr>
								</thead>
								<tbody>
									<c:forEach var="report" items="${report}">
										<tr>
											<td><a href="#">${report.d_m_number}</a></td>
											<td>${report.requester_name}</td>
											<td>${report.re_location_x} / ${report.re_location_y}</td>
											<!-- <td>${report.re_time}</td> -->
											<td><fmt:formatDate value="${report.re_time}" 
												pattern="yyyy-MM-dd hh:mm"/></td>
											<td>${report.manager_name}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
								<div>
									<a href="updateMemberForm?m_num=${member.m_num}" class="btn btn-warning">수정하기</a>	
									<a onclick="memdel()" class="btn btn-warning">삭제하기</a>
									<a href="memberList?pageNo=${pageNo}" class="btn btn-warning">목록으로</a>
								</div>
							</div>
						</div>
						<div id="bottom_b" style="height: 20px;"></div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>