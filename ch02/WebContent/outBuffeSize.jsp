<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 지시자 -->
<%-- <%@ page buffer="none" %>  버퍼사이즈를 none으로 하면 버퍼를 통하지 않고 바로 출력--%>  
<%@ page buffer="4kb" %> <!-- 페이지의 버퍼사이즈 조정 --> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출력버퍼의 크기 지정</title>
</head>
<body>
	출력버퍼의 크기는 :<%=out.getBufferSize() %>바이트 <!-- 페이지의 버퍼사이즈 출력 -->
</body>
</html>


