<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("name");
		char gender = request.getParameter("gender").charAt(0);
		int age = Integer.parseInt(request.getParameter("age"));
		//자바 빈클래스 생성
		Customer customer = new Customer();
		//자바 빈 클래스의 set메소드로 값 저장 
		customer.setName(name);
		customer.setGender(gender);
		customer.setAge(age);
		
		
		//request객체에 속성으로 자바빈을 저장
		request.setAttribute("name", name);
		request.setAttribute("gender", gender);
		request.setAttribute("age", age);
		request.setAttribute("customerInfo", customer);
	%>
	<h2>회원정보</h2>
	<%
		Customer custInfo = (Customer) request.getAttribute("customerInfo");
		String name1 = (String) request.getAttribute("name");
		char gender1 = (char) request.getAttribute("gender");
		int age1 = (int) request.getAttribute("age");/* auto-unboxing */
	%>
	이름:<%=custInfo.getName()%><br> 
	성별:<%=custInfo.getGender()%><br>
	나이:<%=custInfo.getAge()%><br>
	
	<hr>
	이름:<%=name1%><br> 
	성별:<%=gender1%><br> 
	나이:<%=age1%><br>
</body>
</html>