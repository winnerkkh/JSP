<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>오늘의 저녁 메뉴</title>
</head>
<body>

	<h3>저녁 메뉴 입니다.</h3>
		<c:if test="${empty menu }">
			오늘은 쉽니다.
		</c:if>

	<ul>
		<c:forEach var="item" items="${menu}">
			<li>${item}</li>
		</c:forEach>
	</ul>
</body>
</html>