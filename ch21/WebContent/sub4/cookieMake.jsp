<%@ page contentType="text/html; charset=UTF-8" %>
<%
		//request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = "HONGGILDONG";
		Cookie cookie = new Cookie("id",id);
		response.addCookie(cookie);//응답 객체에 cookie정보 저장
%>
<html><head>
<title>Insert title here</title>
</head>
<body>
   <h3>쿠키 저장 성공</h3>
   <a href="cookView.jsp">쿠키보기</a>
</body>
</html>