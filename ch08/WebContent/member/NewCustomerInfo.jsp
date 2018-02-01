<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<title>회원정보</title>
</head>
<body>
	<jsp:useBean id="pinfo" class="model.Customer" scope="request"/>
	<jsp:setProperty property="name" name="pinfo" param="name"/><!-- request.getParameter();setName() -->
	<jsp:setProperty property="gender" name="pinfo" param="gender"/><!-- request.getParameter();setGender() -->
	<jsp:setProperty property="age" name="pinfo" param="age"/><!-- request.getParameter();setAge() -->
	<jsp:forward page="NewCustomerInfoView.jsp"/>
</body>
</html>