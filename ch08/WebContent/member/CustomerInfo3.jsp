<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
	
<!-- Customer cinfo = new Customer() -->
<jsp:useBean id="cinfo" class="model.Customer"/>

<jsp:setProperty property="name" name="cinfo" value="홍길동"/> <!-- setName -->
<jsp:setProperty property="gender" name="cinfo" value="남"/> <!-- setGender() -->
<jsp:setProperty property="age" name="cinfo" value="25"/> <!-- setAge() -->

이름:<jsp:getProperty property="name" name="cinfo"/><br> <!-- getName() -->
성별:<jsp:getProperty property="gender" name="cinfo"/><br> <!-- getGender() -->
나이:<jsp:getProperty property="age" name="cinfo"/> <!-- getAge() -->
</body>
</html>