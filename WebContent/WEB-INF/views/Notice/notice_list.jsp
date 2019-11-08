<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../main/top.jsp" flush="false"/>

		<script type="text/javascript">
			function searchSelect(){
				var result = true;
				if ($("#searchThing").val() == "0") {
					alert("검색할 분류를 선택해 주세요.");
					result = false;
				}
				if($("#things").val() == ""){
					alert("검색어를 입력해 주세요.");
					result = false;
				}
				
				// 번호찾기인데 문자입력시 거부 해야함
				
				
				
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
							<h2> MemberList </h2>
						</div>
						<div id="top_b">
							<form class="form-inline" method="get" action="memberSearch" onsubmit="return searchSelect()">
								<div class="form-group mb-2">
									<select id="searchThing" name="searchThing"class="form-control">
										<option value="0" selected>선택하기</option>
										<option value="m_num">회원번호</option>		
										<option value="m_name">이름</option>
										<option value="m_phone">전화번호</option>
										<option value="po_num">직급</option>
									</select>
								</div>
								<div class="form-group mx-sm-3 mb-2">
									<input id="things" name="things" type="text" class="form-control" placeholder="검색어">
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
							<th scope="col" width="15%;">번호</th>
							<th scope="col" width="15%;">이름</th>
							<th scope="col" width="25%;">아이디</th>
							<th scope="col" width="25%;">전화번호</th>
							<th scope="col" width="20%;">직급</th>
						</tr>
					</thead>
					<tbody>
			 			<c:forEach var="member" items="${memberList}">
						    <tr onclick="location.href='memberDetail?m_num=${member.m_num}'" style="cursor: pointer;">
						      <td>${member.m_num }</td>
						      <td>${member.m_name}</td>
						      <td>${member.m_id}</td>
						      <td>${member.m_phone}</td>
						      <td>${member.po_position}</td>
						    </tr>
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
										<li class="page-item"><a class="page-link" href="memberList?=pageNo=1"> 
											<span aria-hidden="true">&laquo;</span></a>
										</li>
										<c:if test="${groupNo > 1}">
										<li class="page-item"><a class="page-link" href="memberList?pageNo=${startPageNo-1}"> 
											<span aria-hidden="true"><</span></a>
										</li>
										</c:if>
										
								  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
								  		<c:if test="${pageNo==i}">
								  			<li class="page-item active">
								  				<a href="memberList?pageNo=${i}" class="page-link">${i}</a>
								  			</li>
								  		</c:if>
						  				<c:if test="${pageNo!=i}">
						  					<li class="page-item">
						  						<a href="memberList?pageNo=${i}" class="page-link">${i}</a>
						  					</li>
						  				</c:if>
						  			</c:forEach>
										<c:if test="${groupNo < totalGroupNum}">
											<li class="page-item">
												<a class="page-link" href="memberList?pageNo=${endPageNo+1 }"> 
												<span aria-hidden="true">></span>
												</a>
											</li>
										</c:if>
										<li class="page-item"><a class="page-link" href="memberList?pageNo=${totalPageNum }"> 
											<span aria-hidden="true">&raquo;</span></a>
										</li>
									</ul>
								</nav>
							</div>
							<div id="bottom_c_r">
								<div><a href="memberInsertForm" class="btn btn-warning">회원 등록</a></div>
							</div>
						</div>
						<div id="bottom_b" style="height: 20px;"></div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>