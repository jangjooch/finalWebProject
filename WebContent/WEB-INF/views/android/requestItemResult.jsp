<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String result=request.getAttribute("result").toString();
	String res="requestItemsResponse";
	String sub="_distinguish_";
%>
<%=res%><%=sub%><%=result%>
