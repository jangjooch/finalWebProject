<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
   <head>
      <title>Main</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet"
         href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
      <script
         src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script
         src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
      <script
         src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
      <script type="text/javascript"
         src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
         
      <link rel="stylesheet" type="text/css"
         href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
      <!-- bootstrap의 css를 가져옴 -->
      <script type="text/javascript"
         src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
      <link rel="stylesheet" type="text/css"
         href="<%=application.getContextPath()%>/resources/css/shc/resources.css">
         
      <script type="text/javascript">
//          if(${member_logined==null}){
//             location.href="${pageContext.request.contextPath}";
//          }
         <c:if test="${member_logined==null}">
            location.href="${pageContext.request.contextPath}";            
         </c:if>
      </script>
      <style type="text/css">
      
      #header{
         height: 150px;
         text-align: center;
         display: flex;
         background-image: url("${pageContext.request.contextPath}/resources/image/header.png");
         background-size: 100% 100%;
      }
      
      #header_left{
         width: 250px;
      }
      #header_center{
         flex: 2;
         text-align: center;
         font-weight: bold;
         font-size: 3em;
         flex-direction: row;
      }
         
      #header_right{
         width: 250px;
      }
      
      </style>
   </head>
<body>
      <!-- .fakeimg { css 부분 왜 넣어둔지 모르겠음 삭제는 안함
         height: 200px;
         background: #aaa;
      } -->
   <div id = "wrapper">
      <div id = "header">
         <div id="header_left">
            <div>
            <a href="https://www.seoul.go.kr/" title="서울특별시 홈페이지로 이동">
            <img src="${pageContext.request.contextPath}/resources/image/seoul_logo.png" >
            </a>
            </div>
            <div>
            <a href="https://fire.seoul.go.kr/" title="소방재난본부 홈페이지로 이동">
            <img src="${pageContext.request.contextPath}/resources/image/seoulFirefighter_logo.png">
            </a>
            </div>
         </div>
         
         <div id="header_center" >
            <div id="header_center_hr">
         </div>
            <div id="header_center_hr">
            <p><img src="${pageContext.request.contextPath}/resources/image/moniter.png" height="60px" width="60px"> 차세대 재난 구조 시스템</p>
            </div>
            <div id="header_center_hr">
         </div>
         </div>
         
         <div id="header_right">
         <div>
         </div>   
         </div>
      </div>

   <nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Home</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#collapsibleNavbar">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
         <ul class="navbar-nav">
            <c:if test="${member_logined.po_num == 1}">
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/memberList">Member</a></li>
            </c:if>
            <c:if test="${member_logined.po_num <= 2}">
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/drone/drone_list">Drone</a></li>
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mission/requestList">요청 대기</a></li>
            </c:if>
            <c:if test="${member_logined.po_num <= 3}">
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mission/missionProList">드론 대기</a></li>
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mission/missionStart">실행중</a></li>
            </c:if>
            <c:if test="${member_logined.po_num == 3 || member_logined.po_num == 1}">
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/item/item_list">Item</a></li>
            </c:if>
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/log/log_list">Log</a></li>
            <c:if test="${member_logined!=null}">
               <li class="nav-item" style="float:right">
                  <a class="nav-link" href="${pageContext.request.contextPath}/logOut">logOut</a>
               </li>
            </c:if>
         </ul>
      </div>
   </nav>
   
</body>
   