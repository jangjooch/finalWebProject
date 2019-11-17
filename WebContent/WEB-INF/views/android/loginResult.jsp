<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String result = request.getAttribute("result").toString();
	String m_num = request.getAttribute("m_num").toString();
	String sub = "_distinguish_";
%>
<%=result%><%=sub%><%=m_num%>


