<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	<jsp:forward>액션 태그를 사용하면
	  현재페이지의 내용은 모두 제거 됨.
  --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>from.jsp의 제목</title>
</head>
<body>
 이 페이지는 from.jsp가 생성한 것입니다.
 
 <jsp:forward page="/to/to.jsp"/>
</body>
</html>