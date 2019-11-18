<%@ page contentType="text/html; charset=UTF-8" %>
   
       <script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js">
       </script>
       <link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
       <script type="text/javascript" src="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
      
      <style type="text/css">
      #footer{
            height: 100px;
            text-align: center;
            border-top: 1px solid ;
            background-image: url("${pageContext.request.contextPath}/resources/image/footer.png");
            background-size: 100% 100%;
            position:absolute;
		    bottom:0;
		    width:100%;
      }
      
      
      </style>
      <div id="footer">
      </div>
      </div>
      
      </body>
</html>