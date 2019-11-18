<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../main/top.jsp" flush="false"/>

		<script type="text/javascript">
					function checkForm(){	//하는중
						var result = true;
						//입력값 검사
						if($("#drone_type").val()=="needselect")
							{	
								return false;
							}
						if($("#drone_type").val()=="drone_number")
							{
								result = true;
							}
						if($("#drone_type").val()=="drone_model")
							{
								result = true;
							}
						if($("#drone_type").val()=="drone_status")
							{
								
								return result = true;
							}
						
						// return result;
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
							<h1>DroneList</h1>
						</div>
						<div id="top_b">
							<form class="form-inline" action="drone_list" method="post" onsubmit="return checkForm()">
								<div class="form-group mb-2" id="t_b_right">
									<select class="form-control" id="drone_type" name="drone_type">
										<option value="needselect" selected="selected">선택하기</option>
										<option value="drone_number">드론 번호</option>
										<option value="drone_model">모델명</option>
										<option value="drone_status">드론 상태</option>
									</select>
								</div>
								
								<div class="form-group mx-sm-3 mb-2"> 
									<input id="result" name="drone_value" type="text" class="form-control"	placeholder="검색어">
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
								<th scope="col" width="15%;">드론 번호</th>
								<th scope="col" width="20%;">드론 모델명</th>
								<th scope="col" width="15%;">드론 상태</th>
								<th scope="col" width="25%;">적재 가능 중량(단위: g)</th>
								<th scope="col" width="25%;">비행 가능 시간(단위: 분)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="drone" items="${drone_list}" >
								<c:if test="${drone.d_number > 0}">
								<tr onclick="location.href='drone_detail?d_number=${drone.d_number}'" style="cursor: pointer;">
							 	  <td>${drone.d_number}</td>
							      <td>${drone.d_model}</td>
							      <c:if test="${drone.d_status == 1}">
								      <td>대기중(양호)</td>
							      </c:if>
							      <c:if test="${drone.d_status == 2}">
								      <td style="color:red">미션 수행중</td>
							      </c:if>
							      <c:if test="${drone.d_status > 2}">
								      <td style="color:red">상태이상</td>
							      </c:if>
							      <td>${drone.d_weight}</td>
							      <td>${drone.d_battery}</td>
							     </tr>
							     </c:if>
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
	                     	<%-- 가장 처음페이지 --%>
	                        <li class="page-item"><a class="page-link" href="drone_list?=drone_pageNo=1"> 
	                           <span aria-hidden="true">&laquo;</span></a>
	                        </li>
	                        
	                         <%-- 처음 그룹페이지가 아닐 경우 추가 --%>
	                        <c:if test="${drone_groupNo > 1}">
	                        <li class="page-item"><a class="page-link" href="drone_list?drone_pageNo=${drone_startPageNo-1}"> 
	                           <span aria-hidden="true"><</span></a>
	                        </li>
	                        </c:if>
	                        
	                        <%-- 페이징 번호 --%>
	                       <c:forEach begin="${drone_startPageNo}" end="${drone_endPageNo}" var="i">
	                        <%-- 현재페이지 버튼 --%>
	                          <c:if test="${drone_pageNo==i}">
	                          	 <li class="page-item active">	
	                             	<a href="drone_list?drone_pageNo=${i}" class="page-link">${i}</a>
	                             </li>
	                          </c:if>
	                           <%-- 다른 페이지 버튼 --%>
	                          <c:if test="${drone_pageNo!=i}">
	                          	 <li class="page-item">
	                             	<a href="drone_list?drone_pageNo=${i}" class="page-link">${i}</a>
	                             </li>
	                          </c:if>
	                       </c:forEach>
	                       
	                        <%-- 다음 페이지 --%>
		                    <c:if test="${drone_groupNo < drone_totalGroupNum}">
	                           <li class="page-item">
	                              <a class="page-link" href="drone_list?drone_pageNo=${drone_endPageNo+1 }"> 
	                              <span aria-hidden="true">></span>
	                              </a>
	                           </li>
	                        </c:if>
	                        <li class="page-item"><a class="page-link" href="drone_list?drone_pageNo=${drone_totalPageNum }"> 
	                           <span aria-hidden="true">&raquo;</span></a>
	                        </li>
	                     </ul>
	                  </nav>
							</div>
							<div id="bottom_c_r">
								<div><a href="drone_joinForm" class="btn btn-warning">드론 등록</a></div>
							</div>
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