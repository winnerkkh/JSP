<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<title>최대값</title>
</head>
<body>

<!-- jstl은 if문은 있으나 if~else문은 없음 -->
	
	  최대값:
	 <c:if test="${param.num1 - param.num2 >=0}">
	 ${param.num1}
	 </c:if>

	 <c:if test="${param.num1 - param.num2 <0}">
	 ${param.num2}
	 </c:if>	 
</body>
</html>