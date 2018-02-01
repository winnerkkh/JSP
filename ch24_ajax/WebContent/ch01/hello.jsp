<%@ page contentType="text/html; charset=UTF-8" %>
<html><head>
<title>hello.html의 ajax데이타 응답</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
%>
<body>
 와우 !   방가여 <%=name %>님 환영합니다.
</body>
</html>