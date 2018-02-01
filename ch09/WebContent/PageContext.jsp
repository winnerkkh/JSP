<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PageContext</title>
</head>
<body>
	<h1>PageContext 내장 객체 사용하기</h1>
	요청 URI: ${pageContext,request.requestURI} <BR>
	요청 URL: ${pageContext,request.requestURL} <BR> 
</body>
</html>