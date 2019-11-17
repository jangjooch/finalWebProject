<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String list=request.getAttribute("list").toString();
	String res="checkRequestItemList";
	String sub="_distinguish_";
%>
<%=res%><%=sub%><%=list%>