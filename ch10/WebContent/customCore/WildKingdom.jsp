<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<head>
<TITLE>동물의 왕국</TITLE>
</head>
<BODY>
	사자의 생일잔치에 누가 왔을 까요?<BR><BR>
	<c:set var="guests" value="토끼^^거북이~사슴" />
	<c:forTokens var="animal" items="${guests }" delims="^^~">
			${animal }<br>
	</c:forTokens>
</BODY>
</HTML>
