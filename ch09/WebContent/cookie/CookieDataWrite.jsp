<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키 생성
     Cookie cookie = new Cookie("name","홍길동");
	//생성된 쿠키 저장(저장소는 브라우저)
	response.addCookie(cookie);
%>    
<html><head><title>쿠키 데이타 저장 프로그램</title>
</head>
<body>
    쿠키값이 설정되었습니다.
</body>
</html>