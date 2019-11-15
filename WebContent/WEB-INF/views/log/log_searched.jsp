<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../main/top.jsp" flush="false"/>
		<script type="text/javascript">
			function searchSelect(){
				var result = true;
				if ($("#choose").val() == "0") {
					alert("검색할 분류를 선택해 주세요.");
					result = false;
				}
				if($("#SearchThing").val() == ""){
					alert("검색어를 입력해 주세요.");
					result = false;
				}
				
				// 번호찾기인데 문자입력시 거부 해야함
				if ($("#choose").val() == "m_num") {
					if (isNaN($("#requestNumber").val())) {
						alert("숫자를 입력하세요.");
						result = false;
					}
				}
				return result;
			}
			
			
			function goDetail(value) {
				var re_num = value;
				location.href="log_detail?d_m_number=" + re_num;			
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
							<h2>LogList</h2>
						</div>
						<div id="top_b">
							<form class="form-inline" action="logSearchedList" onsubmit="return searchSelect()">
						<div class="form-group mb-2" id="t_b_right">
							<select class="form-control" style="cursor: pointer;" id="choose" name="choose">
								<option value="0" selected="selected" style="cursor: pointer;">선택하기</option>
								<option value="requestNumber">요청 번호</option>
								<option value="requestMember">요청 회원</option>
							</select>
						</div>
						<div class="form-group mx-sm-3 mb-2">
							<input id="searchThing" name="searchThing" type="text" class="form-control"	placeholder="검색어">
						</div>
						<button type="submit" class="btn btn-primary mb-2">검색</button>
					</form>
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
				<%-- center --%>
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					
					<table class="table table-hover" style="border: 1px solid 1px">
					<thead class="thead-dark">
						<tr>
							<th scope="col">요청 번호</th>
							<th scope="col">요청자/직급</th>
							<th scope="col">요청 시간</th>
							<th scope="col">요청 위치x/y</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="searchList" items="${searchList}">
						<c:choose>
							<c:when test="${whereFrom == 1 }"> <!-- 미션num -->
							</c:when>
							<c:when test="${whereFrom == 2 }"> <!-- 요청num -->
							<tr onclick="goDetail('${searchList.re_num}')" style="cursor: pointer;">
								<td>${searchList.re_num}</td>
								<td>${searchList.memberDto.m_name}/${searchList.memberDto.po_position}</td>
								<td><fmt:formatDate value="${searchList.re_time}" pattern="yyyy-MM-dd / hh:mm:ss"/></td>
								<td>${searchList.re_location_x}/${searchList.re_location_y}</td>
							</tr>
							</c:when>
						</c:choose>
						</c:forEach>
					</tbody>
				</table>
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
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="logSearchedList?=searchPageNo=1"> 
											<span aria-hidden="true">&laquo;</span></a>
										</li>
										<c:if test="${groupNo > 1}">
										<li class="page-item"><a class="page-link" href="logSearchedList?searchPageNo=${searchstartPageNo-1}"> 
											<span aria-hidden="true"><</span></a>
										</li>
										</c:if>
										
								  	<c:forEach begin="${searchstartPageNo}" end="${searchendPageNo}" var="i">
								  		<c:if test="${searchPageNo==i}">
								  			<li class="page-item active">
								  				<a href="logSearchedList?searchPageNo=${i}" class="page-link">${i}</a>
								  			</li>
								  		</c:if>
						  				<c:if test="${searchPageNo!=i}">
						  					<li class="page-item">
						  						<a href="logSearchedList?searchPageNo=${i}" class="page-link">${i}</a>
						  					</li>
						  				</c:if>
						  			</c:forEach>
										<c:if test="${groupNo < totalGroupNum}">
											<li class="page-item">
												<a class="page-link" href="logSearchedList?searchPageNo=${searchendPageNo+1 }"> 
												<span aria-hidden="true">></span>
												</a>
											</li>
										</c:if>
										<li class="page-item"><a class="page-link" href="logSearchedList?searchPageNo=${searchtotalPageNum }"> 
											<span aria-hidden="true">&raquo;</span></a>
										</li>
									</ul>
								</nav>
							</div>
							<div id="bottom_c_r"></div>
						</div>
						<div id="bottom_b" style="height: 20px;"></div>
					</div>
				</div>	
				<div class="col-sm-2"></div>
			</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>