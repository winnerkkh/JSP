<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사하기</title>
</head>
<body>
	<%
	 	/* 서블릿에서 사용된 request객체의 getParameter()메소드 호출; */
		String strName = request.getParameter("yourname");
	%>
	안녕하세요 <%=strName %>님!!!
</body>
</html>