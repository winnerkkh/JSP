<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String value = request.getParameter("value");

		/* 파라미터값은 String객체로 넘어옴 */
		if (name != null && value != null) {
			application.setAttribute(name, value);
		}
	%>
	
	<%
	  if((name !=null && value !=null)&&!("".equals(name) && "".equals(value))){
	%>
	
	application 기본객체의 속성 설정:
	
	<%=name%> = <%= value%>
	
	<%
		} else {
	%>
	
	name 과 value가 null <br>
	application 기본 객체 속성 설정 안함.
	
	<%
		}
	%>
	
</body>
</html>