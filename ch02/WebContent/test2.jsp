<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>선언부(Declaration)</title>
</head>
<body>
	<h1>Declaration Example</h1>
	<!-- 블랙단위 요소 -->

	<%
		String name = team + " Fighting"; /* 변수를 사용하기 위해서는 미리 선언! */
	%>

	<%!/* 선언부 - 선언하면 전역으로 사용됨. */
		 String team = "Korea";
	%>
	
	출력결과는 <%= name %> <!-- 표현식 -->

</body>
</html>