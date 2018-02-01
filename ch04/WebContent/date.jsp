<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errPage = "error.jsp" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E)");
    String strdate = sdf.format(date);
%>
보통의 jsp페이지의 형태입니다.<br>
오늘의 날짜는 <%=strdate %>
</body>
</html>