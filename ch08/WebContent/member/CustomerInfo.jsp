<%@ page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<%
	//자바 빈 클래스 생성
	Customer customer = new Customer();
	//자바 빈 클래스의 set메소드로 값 저장
	customer.setName("홍길동");
	customer.setGender("남".charAt(0));
	customer.setAge(new Integer(25));
	
	//request객체에 속성으로 자바빈을 저장
	request.setAttribute("customerInfo", customer);
%>

<h2>회원정보</h2>

<% Customer custInfo = (Customer)request.getAttribute("customerInfo"); 
%>
이름: <%=custInfo.getName()%> <br>
성별: <%=custInfo.getGender()%> <br>
나이: <%=custInfo.getAge()%> <br>

</body>
</html>