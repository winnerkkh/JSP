<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="pinfo" class="model.Customer" scope="request"/>
이름:<jsp:getProperty property="name" name="pinfo"/><br>
성별:<jsp:getProperty property="gender" name="pinfo"/><br>
나이:<jsp:getProperty property="age" name="pinfo"/>

</body>
</html>