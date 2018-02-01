<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<c:if test="true">
	  무조건 수행<br>
	</c:if>
	<hr>
	<c:if test="${param.name=='aa'}">
 name 파라미터의 값이 ${param.name }입니다.<br>
	</c:if><br>
	<hr>
	<c:if test="${18 < param.age }">
 당신의 나이는 18세 이상 입니다.<br>
	</c:if>
	<hr>

</body>
