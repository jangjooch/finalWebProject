<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>드론 물품 목록</title>
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/css/shc/collection.css">
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<style>
		</style>
		
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
		
	</head>
	<body>
		<%-- 전체 div --%>
		<div id="body">
			<%-- 제목 div top--%>
			<div id="top">
				<div id="top_top"></div>
				
				<div id="top_center">
					<h1>드론 목록</h1>
				</div>
				
				<%-- top_bottom검색어 //하는중 --%>
				<div id="top_bottom">
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
			
			<%-- 테이블 div top--%>
			<div id="center">
				<table class="table table-hover" style="border: 1px solid 1px">
					<thead class="thead-dark">
						<tr>
							<th scope="col" width="15%;">드론 번호</th>
							<th scope="col" width="30%;">드론 모델명</th>
							<th scope="col" width="15%;">드론 상태</th>
							<th scope="col" width="30%;">적재 가능 중량</th>
							<th scope="col" width="10%;">비행 가능 시간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<!-- 
							<td><a href="item_detail">1</a></td>
							<td>모델명</td>
							<td>1</td>
							<td>3.0 kg</td>
							<td>480 분</td>
							 -->
							<c:forEach var="drone" items="${drone_list}" >
							<tr onclick="location.href='drone_detail?d_number=${drone.d_number}'" style="cursor: pointer;">
						 	<th scope="row"> <a href="drone_detail?d_number=${drone.d_number}">${drone.d_number}</a></th>
						      <td>${drone.d_model}</td>
						      <td>${drone.d_status}</td>
						      <td>${drone.d_weight}</td>
						      <td>${drone.d_battery}</td>
						      </tr>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
			
			<%-- 버튼 div bottom --%>
			<div id="bottom">
			
				<%-- bottom left - div --%>
				<div id="bottom_left"></div>
				
				<%-- bottom center - div --%>
				<div id="bottom_center">
					<%-- top --%>
					<div id ="b_c_top"></div>
					
					
					<%-- center 페이징 --%>
	               <div id ="b_c_center">
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
	                             <a href="drone_list?drone_pageNo=${i}" class="page-link" style="color:orange;">${i}</a>
	                          </c:if>
	                           <%-- 다른 페이지 버튼 --%>
	                          <c:if test="${drone_pageNo!=i}">
	                             <a href="drone_list?drone_pageNo=${i}" class="page-link">${i}</a>
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
					
					<!-- 
					<%-- center 페이징 --%>
					<div id ="b_c_center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="?drone_pageNo=1"> 
									<span aria-hidden="true">&laquo;</span></a>
								</li>
								<%-- 가장 처음페이지 --%>
								<li class="page-item"><a class="page-link" href="#"> 
									<span aria-hidden="true"></span></a>
								</li>
								
								 <%-- 처음 그룹페이지가 아닐 경우 추가 --%>
		                        <c:if test="${drone_groupNo > 1}">
		                           <li class="page-item"><a class="page-link" href="?pageNo=${drone_startPageNo-1}"> 
		                              <span aria-hidden="true"><</span></a>
		                           </li>
		                        </c:if>
		                        
		                        <%-- 페이징 번호 --%>
		                        <c:forEach var="i" begin="${drone_startPageNo}" end="${drone_endPageNo}">
		                           <%-- 현재페이지 버튼 --%>
		                           <c:if test="${drone_pageNo==i}">
		                              <li class="page-item active">
		                                 <a class="page-link" href="?drone_pageNo=${i}">${i}</a>
		                              </li>
		                           </c:if>
		                           <%-- 다른 페이지 버튼 --%>
		                           <c:if test="${drone_pageNo!=i}">
		                              <li class="page-item">
		                                 <a class="page-link" href="?drone_pageNo=${i}">${i}</a>
		                              </li>
		                           </c:if>   
		                        </c:forEach>
		                        
		                        <%-- 다음 페이지 --%>
		                        <c:if test="${drone_groupNo<drone_totalGroupNum}">
		                           <li class="page-item"><a class="page-link" href="?drone_pageNo=${drone_endPageNo+1}"> 
		                              <span aria-hidden="true">></span></a>
		                           </li>
		                        </c:if>
		                        
		                        <%-- 가장 마지막 그룹 번호 --%>
		                        <li class="page-item"><a class="page-link " href="?drone_pageNo=${drone_totalPageNum}"> 
		                           <span aria-hidden="true">&raquo;</span></a>
								
								<!-- 
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item active"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#"> 
									<span aria-hidden="true">></span>
								</a></li>
								<li class="page-item"><a class="page-link " href="#"> 
									<span aria-hidden="true">&raquo;</span></a>
								 -->
								<!-- 
								</li>
							</ul>
						</nav>
					</div>	
					 -->
					<%-- bottom --%>
					<div id ="b_c_bottom"></div>
				
				</div>
				<%-- bottom left - right --%>
				<div id="bottom_right">
					
					<%--bottom-right top --%>
					<div id="b_r_top"></div>
					<%--bottom-right center 버튼 --%>
					<div id="b_r_center">
						<a href="drone_joinForm" class="btn btn-warning">드론 등록</a>
					</div>
					<%--bottom-right bottom --%>
					<div id="b_r_bottom"></div>
				</div>
			</div>
			
		</div>	
	</body>
</html>