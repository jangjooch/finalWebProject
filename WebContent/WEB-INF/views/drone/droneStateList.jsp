<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../main/top.jsp" flush="false"/>

			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8" id="top">
					<div id="top">
						<div id="top_t">
							<div style="height: 20px;"></div>
						</div>
						<div id="top_c">
							<h2>운행 가능 드론 리스트</h2>
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
								<th scope="col" width="25%;">적재 가능 중량</th>
								<th scope="col" width="25%;">비행 가능 시간</th>
								<th scope="col" width="15%;">드론 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="drone" items="${drone_list}" >
								<tr>
							 	  <td>${drone.d_number}</td>
							      <td>${drone.d_model}</td>
							      <td>${drone.d_weight}</td>
							      <td>${drone.d_battery}</td>
							      <td>
							      	<a href="#" class="btn btn-secondary">드론 선택</a>
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
										<li class="page-item"><a class="page-link" href="droneState_List?=pageNo=1"> 
											<span aria-hidden="true">&laquo;</span></a>
										</li>
										<c:if test="${groupNo > 1}">
										<li class="page-item"><a class="page-link" href="droneState_List?pageNo=${startPageNo-1}"> 
											<span aria-hidden="true"><</span></a>
										</li>
										</c:if>
										
								  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
								  		<c:if test="${pageNo==i}">
								  			<li class="page-item active">
								  				<a href="droneState_List?pageNo=${i}" class="page-link">${i}</a>
								  			</li>
								  		</c:if>
						  				<c:if test="${pageNo!=i}">
						  					<li class="page-item">
						  						<a href="droneState_List?pageNo=${i}" class="page-link">${i}</a>
						  					</li>
						  				</c:if>
						  			</c:forEach>
										<c:if test="${groupNo < totalGroupNum}">
											<li class="page-item">
												<a class="page-link" href="droneState_List?pageNo=${endPageNo+1 }"> 
												<span aria-hidden="true">></span>
												</a>
											</li>
										</c:if>
										<li class="page-item"><a class="page-link" href="droneState_List?pageNo=${totalPageNum }"> 
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