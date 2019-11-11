<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>

<%
	String list=request.getAttribute("result").toString();
	String res="requestItemsResponse";
	String sub="_distinguish_";
	String resultList=request.getAttribute("resultList").toString();
%>
<%=res%><%=sub%><%=list%><%=sub%><%=resultList%>
