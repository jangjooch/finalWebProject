<%@ page contentType="text/html; charset=UTF-8"%>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript"	src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
/* 		function fileUpLoad() {
			$.ajax({
				url: "fileUpLoad",
				type: "post",
				data: FormData,
				success: function(data) {
					if (data == 1) {
						alert("성공");
						window.close();
					} else {
						alert("실패");
						window.close();
					}
				}
			});
		} */
		</script>
		
		
	</head>
		<form action="fileUpLoad" id="postUpdate" method="post"  enctype="multipart/form-data" > <!-- 본문에 input태그 하나당 파트를 가진다.
																					문자파트/파일파트 를 보내야 할 경우 -->
			<!-- MultipartResolver(인터페이스임) 에게 해석 요청을 함 -->
			<!-- 구현객체 사용 -->
			사건번호:  ${d_m_number} 번
			
			
			<!-- 파일파트 -->
			<input value="${d_m_number}" type="hidden" name="d_m_number">
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroupFileAddon01">첨부1</span>
			  </div>
			  <div class="custom-file">
			    <input id="attach1" name="attach1" type="file" class="custom-file-input" id="inputGroupFile01"> 
			    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
			  </div>
			</div>
			
			
			<!-- 파일파트 -->
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroupFileAddon01">첨부2</span>
			  </div>
			  <div class="custom-file">
			    <input id="attach2" name="attach2" type="file" class="custom-file-input" id="inputGroupFile01"> 
			    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
			  </div>
			</div>
			
			<!-- 파일파트 -->
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroupFileAddon01">첨부3</span>
			  </div>
			  <div class="custom-file">
			    <input id="attach3" name="attach3" type="file" class="custom-file-input" id="inputGroupFile01"> 
			    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
			  </div>
			</div>
			
			
			<!-- 파일파트 -->
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroupFileAddon01">첨부4</span>
			  </div>
			  <div class="custom-file">
			    <input id="attach4" name="attach4" type="file" class="custom-file-input" id="inputGroupFile01"> 
			    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
			  </div>
			</div>
			
			<input type="submit" class="btn btn-secondary" id="files_send" value="파일업로드" />
		</form>
</html>