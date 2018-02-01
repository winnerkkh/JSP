<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="true"%>

<!-- autoFlush가 false인 경우 buffer용량을 초과하는 데이타가 생성되는 경우 에러 발생, -->
<!-- autoFlush가 true이면 buffer용량을 초과하는 경우 버퍼를 비우고(클라이언트-브라우저로 데이타를 보내고), 다시 채움.. -->)
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>autoFlush 속성값 false</title>
</head>
<body>
	<%
		for (int i = 0; i < 1000; i++) {
	%>
	1234
	<%
		}
	%>

</body>
</html>