<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% /* jsp내에서의 while문() */
	  int i=0;
	   while(i<10){
		   out.print("출력되는값:"+i+"<br>");
		   i++;
	   }
	%>
</body>
</html>