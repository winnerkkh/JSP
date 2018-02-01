<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체 속성 읽기</title>
</head>
<body>
	<%
		Enumeration<String> attrEnum = application.getAttributeNames();
		while (attrEnum.hasMoreElements()) {
			String name = attrEnum.nextElement(); //요소명 열기
			Object value = application.getAttribute(name); //요소명에 해당하는 객체
	%>
		application 속성: <b> <%=name %> </b>=<%=value %> <br>
	<%
	}
	%>
</body>
</html>