<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>인사하기</title>
</head>
<body>

	<!-- custom태그의 choose문  -->
	<c:choose>
		<c:when test="${param.num==0}">
		처음뵙겠습니다.<br>
		</c:when>
		
		<c:when test="${param.num==1}">
	    오랜만입니다.<br>
		</c:when>
		
		<c:otherwise>
	   안녕하세요<br>
		</c:otherwise>
		
	</c:choose>
</body>
</html>