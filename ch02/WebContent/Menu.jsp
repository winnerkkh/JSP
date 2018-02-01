<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘의 메뉴</title>
</head>
<body>
	<h3>오늘의 메뉴</h3>
	<ol>
		<li>삼계탕</li>
		<li>돈까스</li>
		<li>튀김 국수</li>
	</ol>
	<br>
	<%@include file="Today.jsp" %> <!-- 파일을 현제페이지의 일부로 사용 -->
	<!-- http://localhost:8080/ch02/Menu.jsp 
		
		uri는 URL의 일부이며, 상대경로 ch02/Menu.jsp
	
	
	-->
</body>
</html>