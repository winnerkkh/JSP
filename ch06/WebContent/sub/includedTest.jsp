<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
%>
포함되는 페이지 includeTest.jsp입니다.<p>
<b><%=name%></b>님 방가여....
<hr>