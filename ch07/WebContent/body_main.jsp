<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  /* 파라미터로 넘어온 객체의 문자셋 세팅 */
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>INFO</title></head>
<body>
include전 name 파라미터 값:<%=request.getParameter("name") %>
<hr>
<jsp:include page="page_sub.jsp">
	<jsp:param value="홍길동" name="name"/>
</jsp:include>

<hr>
include 후 name 파라미터 값:<%=request.getParameter("name") %>
</body>
</html>