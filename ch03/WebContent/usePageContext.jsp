<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContext 기본객체</title>
</head>
<body>
	<%
		HttpServletRequest httpRequest = (HttpServletRequest) pageContext.getRequest();/* 현재페이지로 요청하여온 request객체의 정보획득 */
	%>
	
	request 기본객체와 pageContext.getRequest()의 동일성여부;
	<%=request == httpRequest %>
	
	<br>
	pageContext.getOut() 메소드를 사용한 데이타 출력
	<%
	/* out.print()<= pageContext객체로 부터 얻어낸 out객체 */
	pageContext.getOut().print("안녕하세요!");
	%>
</body>
</html>