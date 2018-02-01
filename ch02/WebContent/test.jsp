<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 지시자(Directive) -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP 테스트</title>
</head>
<body>


	<% /* 스크립틀릿 - 웹콘테이너에서 처리되는 부분*/
		String strName = "홍길동"; //변수는 사용전에 미리 선언해야함.
	%>
	
	<!-- expression(표현식) -->	
	내 이름은 <%=strName %> 입니다.

</body>
</html>