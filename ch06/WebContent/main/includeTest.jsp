<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%
	request.setCharacterEncoding("utf-8");
%>
<%
    String prefix = "../sub/";
	String pageName = request.getParameter("pageName");
    pageName +=".jsp";
    pageName = prefix+pageName;
%>
 포함하는 페이지는 includeTest.jsp입니다.<br>
<hr>
<jsp:include page="<%=pageName%>" flush="false"/>
includeTest.jsp의 나머지 내용 입니다.