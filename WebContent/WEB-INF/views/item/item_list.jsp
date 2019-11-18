<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<h1> ItemList </h1>
						</div>
						<div id="top_b">
							<form class="form-inline" onsubmit="return searchSelect()" action="item_list_search">
								<div class="form-group mb-2" id="t_b_right">
									<select class="form-control" id="selectGroup" name="selectGroup">
										<option value="0" selected="selected">선택하기</option>
										<option value="code">물품 번호</option>
										<option value="name">물품 이름</option>
										<option value="class">분류</option>
									</select>
								</div>
								<div class="form-group mx-sm-3 mb-2">
									<input type="text" class="form-control"	placeholder="검색어" id="findding" name="findding">
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
								<th scope="col" width="20%;">물품 번호</th>
								<th scope="col" width="25%;">물품 이름</th>
								<th scope="col" width="15%;">물품 수량</th>
								<th scope="col" width="25%;">분류</th>
								<th scope="col" width="15%;">무게 (단위: g)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="items" items="${itemList}">
								<tr onclick="location.href='item_detail?i_code=${items.i_code}'" style="cursor: pointer;">
									<td>${items.i_code}</td>
									<td>${items.i_name}</td>
									<td>${items.i_mount}</td>
									<td>${items.i_class}</td>
									<td>${items.i_weight}</td>
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
										<li class="page-item"><a class="page-link" href="item_list?ipageNumber=1"> 
											<span aria-hidden="true">&laquo;</span></a>
										</li>
										<c:if test="${igroupNo > 1}">
											<li class="page-item"><a class="page-link" href="item_list?ipageNumber=${istartPageNo - 1}"> 
												<span aria-hidden="true"><</span></a>
											</li>
										</c:if>
										<c:forEach begin="${istartPageNo}" end="${iendPageNo}" var="i">
											<c:if test="${ipageNumber == i}">
												<li class="page-item active"><a class="page-link" href="?ipageNumber=${i}">${i}</a></li>		
											</c:if>
											<c:if test="${ipageNumber != i}">
												<li class="page-item"><a class="page-link" href="?ipageNumber=${i}">${i}</a></li>
											</c:if>
										</c:forEach>
										<c:if test="${igroupNo < itotalGroupNum}">
											<li class="page-item"><a class="page-link" href="item_list?ipageNumber=${iendPageNo + 1}">
												<span aria-hidden="true">></span>									
											</a></li>
										</c:if>								
										<li class="page-item"><a class="page-link" href="item_list?ipageNumber=${itotalPageNum}"> 
											<span aria-hidden="true">&raquo;</span></a>
										</li>							
									</ul>
								</nav>
							</div>
							<div id="bottom_c_r">
								<div><a href="item_add" class="btn btn-warning">물품 등록</a>
						<a href="item_list" class="btn btn-warning">물품 목록</a></div>
							</div>
						</div>
						<div id="bottom_b" style="height: 20px;"></div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>