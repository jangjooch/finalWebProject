<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../main/top.jsp" flush="false"/>
	<!-- 실행중 페이지 -->
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
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8" id="top">
					<div id="top">
						<div id="top_t">
							<div style="height: 20px;"></div>
						</div>
						<div id="top_c">
							<h1>Stand By Mission</h1>
						</div>
						<div id="top_b">
							<form class="form-inline" action="requestSearch" onsubmit="return searchSelect()">
								<div class="form-group mb-2" id="t_b_right">
									<select id="searchThing" name="searchThing"class="form-control">
										<option value="0" selected>선택하기</option>
										<option value="re_num">요청번호</option>
										<option value="re_time">요청시간</option>
										<option value="m_name">요청자 이름</option>
										<option value="re_success">상태</option>
									</select>
								</div>
								<div class="form-group mx-sm-3 mb-2">
									<input id="things" name="things" type="text" class="form-control"	placeholder="검색어">
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
					<table class="table table-hover">
							<thead class="thead-dark">
								<tr align="center">
									<th scope="col" width="10%;">요청 번호</th>
									<th scope="col" width="15%;">요청 시간</th>
									<th scope="col" width="10%;">요청 위치 Lat</th>
									<th scope="col" width="10%;">요청 위치 Lng</th>							
									<th scope="col" width="15%;">요청자</th>							
									<th scope="col" width="15%;">요청 물품</th>
									<th scope="col" width="15%;">상태</th>
								</tr>
							</thead>
						<tbody>
						<c:forEach items="${requestList}" var="requestList">
							<tr align="center">
								<td>${requestList.re_num}</td>
								<td><fmt:formatDate value="${requestList.re_time}" pattern="yyyy-MM-dd hh:mm"/></td>
								<td>${requestList.re_location_x}</td>
								<td>${requestList.re_location_y}</td>
								<td>${requestList.memberDto.m_name }</td>
								<td>
									<c:forEach var="i" items="${itemList}">
										<c:if test="${i.re_num==requestList.re_num}">
											<input type="hidden" name="i_code" value="${i.itemDto.i_name}">
											<input type="hidden" name="i_mount" value="${i.i_amount}">
											${i.itemDto.i_name}/${i.i_amount}<br/>
										</c:if>
									</c:forEach>
								</td>
								<td>
									<div>
										<button disabled="disabled" class="btn btn-primary" style="float: left;">실행중</button>
										<a href="#" class="btn btn-info" style="float: left;">상세보기</a>
									</div>
								</td>
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
								<li class="page-item"><a class="page-link" href="missionStart?=pageNo=1"> 
									<span aria-hidden="true">&laquo;</span></a>
								</li>
								<c:if test="${groupNo > 1}">
								<li class="page-item"><a class="page-link" href="missionStart?pageNo=${startPageNo-1}"> 
									<span aria-hidden="true"><</span></a>
								</li>
								</c:if>
								
						  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
						  		<c:if test="${pageNo==i}">
						  			<li class="page-item active">
						  				<a href="missionStart?pageNo=${i}" class="page-link">${i}</a>
						  			</li>
						  		</c:if>
				  				<c:if test="${pageNo!=i}">
				  					<li class="page-item">
				  						<a href="missionStart?pageNo=${i}" class="page-link">${i}</a>
				  					</li>
				  				</c:if>
				  			</c:forEach>
								<c:if test="${groupNo < totalGroupNum}">
									<li class="page-item">
										<a class="page-link" href="missionStart?pageNo=${endPageNo+1 }"> 
										<span aria-hidden="true">></span>
										</a>
									</li>
								</c:if>
								<li class="page-item"><a class="page-link" href="missionStart?pageNo=${totalPageNum }"> 
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
				
				<div class="col-sm-2"></div>
				<div class="col-sm-8" style="height: 100px;"></div>
				<div class="col-sm-2"></div>
				
			</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>