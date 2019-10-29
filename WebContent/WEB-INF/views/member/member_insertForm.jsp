<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function checkForm() {
				var result = true;
				//모든 에러 내용 지우기
				$(".error").text("");
				//입력값 검사
				if($("#m_num").val() == "") {
					$("#m_numError").text("*회원 번호를 확인하세요.");
					result = false;
				}

				if($("#m_name").val() == "") {
					$("#m_nameError").text("*이름을 확인하세요.");
					result = false;
				}
				if($("#m_id").val() == "") {
					$("#m_idError").text("*아이디를 확인하세요.");
					result = false;
				}
				if($("#m_pw").val() == "") {
					$("#m_pwError").text("*비밀번호를 확인하세요.");
					result = false;
				}
				if($("#m_phone").val() == "") {
					$("#m_phoneError").text("*연락처를 확인하세요.");
					result = false;
				}
				if($("#po_num").val() == "") {
					$("#po_numError").text("*직위를 확인하세요.");
					result = false;
				}
				
				return result;
			}
			
			function checkMid() {
				$.ajax({
					url:"checkMid",
					data:{m_id:$("#m_id").val()},
					success: function(data) {
						if (data.result) {
							$("#m_idError").text("사용할 수 있는 아이디 입니다.")
							$("#m_idError").css("color", "green");			
						} else {
							$("#m_idError").text("사용할 수 없는 아이디 입니다.")
							$("#m_idError").css("color", "red");			
						}
					}
					
				})
			}
			
		</script>
	</head>
		
		<style>
		.test{
			border: 1px solid black;
		}
		
		#center_detail{
			height: 70%;
			display: flex;
		}
		#center_left{
			flex:1;
		}
		
		#center_center{
			display: flex;
			flex-direction: column;
			width: 30%;
			text-align: right;
		}
			
		#center_right{
			flex: 1;
		}
		
	</style>
	<body>
		<h5>회원 가입</h5>
		<form method="post" action="insertMember" onsubmit="return checkForm()">
		  <div class="form-group">
		    <label for="m_num">회원번호</label>
		    <input id="m_num" name="m_num" type="text" class="form-control" placeholder="회원번호를 입력하세요">
		  	<span id="m_numError" class="error" style="color:red"></span>
		  </div>
		  
		  <div class="form-group" >
		    <label for="m_id">아이디</label>
		    <input id="m_id" name="m_id" type="text" class="form-control" placeholder="아이디를 입력하세요">
		  	<span id="m_idError" class="error" style="color:red"></span>
		  		<div class="input-group-append">
					<input type="button" class="btn btn-danger"	value="중복체크"
						onclick="checkMid()">
				</div>
		  </div>
		  <div class="form-group">
		    <label for="m_name">이름</label>
		    <input id="m_name" name="m_name" type="text" class="form-control" placeholder="이름을 입력하세요">
		  	<span id="m_nameError" class="error" style="color:red"></span>
		  </div>
								
		  <div class="form-group">
		    <label for="m_pw">비밀번호</label>
		    <input id="m_pw" name="m_pw" type="text" class="form-control" placeholder="비밀번호를 입력하세요">
		  	<span id="m_pwError" class="error" style="color:red"></span>
		  </div>
		  <div class="form-group">
		    <label for="m_phone">전화번호</label>
		    <input id="m_phone" name="m_phone" type="tel" pattern="(010)\d{3,4}\d{4}" class="form-control" placeholder=" - 를 빼고 입력하세요.">
		  	<span id="m_phoneError" class="error" style="color:red"></span>
		  </div>
		  <div class="form-group">
		    <label for="po_num">직위</label>
		    <select class="form-control" name="po_num">
		    	<option selected>선택</option>
		    	<option value="1">관리자</option>
		    	<option value="2">드론 담당자</option>
		    	<option value="3">배송 담당자</option>
		    	<option value="4">요청자</option>
			  	<span id="po_numError" class="error" style="color:red"></span>
		    </select>
		  </div>
		  
		  
		  
		  <div class="form-group">
		  	<input type="submit" class="btn btn-danger" value="회원등록"/>
		  </div>
		</form>
	</body>
</html>