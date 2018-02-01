<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> <!-- 디렉티브에서 예외 페이지 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 발생</title>
</head>
<body>
 요청처리 과정에서 예외가 발생하였습니다.<br>
 빠른 시간내에 문제를 해결하도록 하겠습니다.
 <p>
 에러타입:<%=exception.getClass().getName()%><br>
 에러메세지:<b><%=exception.getMessage() %></b>
</body>
</html>