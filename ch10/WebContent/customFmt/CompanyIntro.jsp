<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="message_ko" />
<html>
<head>
<title><fmt:message key="TITLE"></fmt:message></title>
</head>

<body>

	<h3><fmt:message key="TITLE" /></h3>
	<fmt:message key="GREETING"/><br><br>
	<fmt:message key="BODY"/><br><br>
	<font size=2><fmt:message key="COMPANY_NAME"/></font>
	


</body>

</html>