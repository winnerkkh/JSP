<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>변수와 메소드 선언문</title>
</head>
<body>
	<h2>선언문 예제 - 메소드와 변수</h2>


	<%!
	
		String id = "Hong";
	
		public String getId() {
			return this.id;
	}%>

	id변수의 내용:<%=id %> <br> <!-- 표현식에 변수 대입 -->
	getId()메소드의 결과<%=getId() %> <!-- 표현식에 함수 호출값 대입 -->



</body>
</html>