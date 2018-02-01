<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="2kb" %><!-- 버퍼사이즈를 2kb로 설정 -->    
<html>
<head>
<meta charset="UTF-8">
<title>fromBufferOF의 제목</title>
</head>
<body>
<%
	for(int i=0;i<512;i++){%>
	<%=i %>
<%=i%>	
<%}%>
<jsp:forward page="/to/to.jsp"/>
</body>
</html>