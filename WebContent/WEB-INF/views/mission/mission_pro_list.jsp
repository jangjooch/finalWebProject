<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../main/top.jsp" flush="false"/>

		<script type="text/javascript">
			
		window.setTimeout('window.location.reload()',5000); //5초마다 새로고침
		
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
							<h1>Article Load Up</h1>
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
									<th scope="col" width="15%;">요청 물품/중량</th>
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
								<td>${requestList.memberDto.m_name}</td>
								<td>
									<c:set var="totalWeight" value="0"/>	<!-- 전역변수 -->
									<c:forEach var="i" items="${itemList}">
										<c:if test="${i.re_num==requestList.re_num}">
											<input type="hidden" name="i_code" value="${i.itemDto.i_name}">
											<input type="hidden" name="i_mount" value="${i.i_amount}">
											${i.itemDto.i_name}/${i.i_amount}<br/>
											<input type="hidden" name="i_weight" value="${i.itemDto.i_weight}">
											<c:set var="weight" value="${i.i_amount * i.itemDto.i_weight}"/><!-- 항목당 무게 -->
											<c:set var="sumWeight" value="${weight + sumWeight}"/>
											<c:set var="totalWeight" value="${sumWeight}"/>
										</c:if>
									</c:forEach>
											<h6 style="color:red">총중량: <c:out value="${totalWeight }"/> g</h6>
								</td>
								<td>
									<div>
										<c:if test="${requestList.re_success == 1}">
											<a href="updateSuccessChainge1Eseo2?re_num=${requestList.re_num}" class="btn btn-warning">물품 적재 하기</a>
										</c:if>
										<c:if test="${requestList.re_success == 2}">
											<a href="updateSuccessChainge2Eseo3?re_num=${requestList.re_num}" class="btn btn-primary">물품 적재 완료</a>
										</c:if>
											<c:set var="sumWeight" value="0"/>
											<c:set var="totalWeight" value="0"/> <!-- 초기화 -->
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
								<c:choose>
								<c:when test="${!empty requestList}">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="missionProList?=pageNo=1"> 
											<span aria-hidden="true">&laquo;</span></a>
										</li>
										<c:if test="${groupNo > 1}">
										<li class="page-item"><a class="page-link" href="missionProList?pageNo=${startPageNo-1}"> 
											<span aria-hidden="true"><</span></a>
										</li>
										</c:if>
										
								  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
								  		<c:if test="${pageNo==i}">
								  			<li class="page-item active">
								  				<a href="missionProList?pageNo=${i}" class="page-link">${i}</a>
								  			</li>
								  		</c:if>
						  				<c:if test="${pageNo!=i}">
						  					<li class="page-item">
						  						<a href="missionProList?pageNo=${i}" class="page-link">${i}</a>
						  					</li>
						  				</c:if>
						  			</c:forEach>
										<c:if test="${groupNo < totalGroupNum}">
											<li class="page-item">
												<a class="page-link" href="missionProList?pageNo=${endPageNo+1 }"> 
												<span aria-hidden="true">></span>
												</a>
											</li>
										</c:if>
										<li class="page-item"><a class="page-link" href="missionProList?pageNo=${totalPageNum }"> 
											<span aria-hidden="true">&raquo;</span></a>
										</li>
									</ul>
								</nav>
								</c:when>
								<c:otherwise>
									<h4 Style="text-align: center;">요청 내역이 없습니다.</h4>
								</c:otherwise>
								</c:choose>
							</div>
							<div id="bottom_c_r"></div>
						</div>
						<div id="bottom_b" style="height: 20px;"></div>
					</div>
					
					<div class="col-sm-2"></div>
					<div class="col-sm-8" style="height: 100px;"></div>
					<div class="col-sm-2"></div>
					
				</div>
				
				<div class="col-sm-2"></div>
			</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>