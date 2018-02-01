<%@page contentType="text/html; charset=UTF-8"%>
<%
	Cookie cookie = new Cookie("name","홍");
	cookie.setMaxAge(60*60);//1시간 쿠키 유효
	response.addCookie(cookie);
%>
<html>
	<head><title>쿠키 유효시간 설정</title></head>
  <body>
   유효시간 1시간 인 name 쿠키 생성<br>
   <a href="deleteCookie.jsp?name=<%=cookie.getName()%>">쿠키삭제</a>
</html>