<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 지시자(Directive) -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘의 메뉴</title>
</head>
<body>
	<h3>오늘의 메뉴</h3>
	<ul>
		<li>짜장면</li>
		<li>볶음밥</li>
		<li>짬뽕</li>
	</ul>

	<%
		/* 스크립틀릿(자바코드부분) */
		
		out.flush(); //버퍼 비우기
		
		//이동할(포함할) 페이지 설정
		RequestDispatcher dispatcher = request.getRequestDispatcher("Now.jsp");
		
		//include(request, response) 메소드로 파일 포함
		dispatcher.include(request,response);
		
	%>


</body>
</html>