<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String list=request.getAttribute("result").toString();
	String res="newRequestNumber";
	String sub="_distinguish_";
%>
<%=res%><%=sub%><%=list%>
