<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	/* 스크립틀릿*/
		// GregorianCalendar는 Calendar를 상속받은 객체
		// 윤년을 표시할수 있음.
		GregorianCalendar now = new GregorianCalendar();
	%>
	
	
	<%=String.format("%TY년 %Tm월 %Td일", now, now, now) %>
</body>
</html>