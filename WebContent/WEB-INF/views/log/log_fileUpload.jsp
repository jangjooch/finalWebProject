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
			function closeWin(){
				 
				window.close();
				 
			}
		</script>
		
		
	</head>
	<body>
		<form method="post" action="fileUpLoad" enctype="multipart/form-data" onsubmit=""> <!-- 본문에 input태그 하나당 파트를 가진다.
																					문자파트/파일파트 를 보내야 할 경우 -->
			<!-- MultipartResolver(인터페이스임) 에게 해석 요청을 함 -->
			<!-- 구현객체 사용 -->
			
			
			<!-- 파일파트 -->
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroupFileAddon01">첨부1</span>
			  </div>
			  <div class="custom-file">
			    <input name="attach1" type="file" class="custom-file-input" id="inputGroupFile01"> 
			    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
			  </div>
			</div>
			
			
			<!-- 파일파트 -->
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroupFileAddon01">첨부2</span>
			  </div>
			  <div class="custom-file">
			    <input name="attach2" type="file" class="custom-file-input" id="inputGroupFile01"> 
			    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
			  </div>
			</div>
			
			<!-- 파일파트 -->
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroupFileAddon01">첨부3</span>
			  </div>
			  <div class="custom-file">
			    <input name="attach3" type="file" class="custom-file-input" id="inputGroupFile01"> 
			    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
			  </div>
			</div>
			
			
			<!-- 파일파트 -->
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroupFileAddon01">첨부4</span>
			  </div>
			  <div class="custom-file">
			    <input name="attach4" type="file" class="custom-file-input" id="inputGroupFile01"> 
			    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
			  </div>
			</div>
			
			<input type="submit" class="btn btn-secondary" value="파일업로드"/>
		</form>
		
		
		
	</body>
</html>