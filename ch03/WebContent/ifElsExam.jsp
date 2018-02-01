<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 출력</title>
</head>
<%!/* 선언부(Declaration) */
	String msg;//전역변수 선언
	String color;//전역변수 선언%>
<%
	/* jsp에서 조건문 if()else if() else 문의 사용 예 */
	String name = request.getParameter("name");
	color = request.getParameter("color");
	if (color.equals("blue"))
		msg = "파랑";
	else if ("red".equals(color))
		msg = "빨강";
	else if ("orange".equals(color))
		msg = "오렌지";
	else {
		msg = "기타";
		color = "white";
	}
%>
<body bgcolor=<%=color%>>
	<!-- 변수가 전역으로 먼저 선언되어서 문서가만들어진 후값을 받음 -->
	<%=name%>님이 좋아하는 색깔은
	<%=msg%>입니다.
</body>
</html>