<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-DD");
	%>
	<%=sdf.format(date)%>
	
	<p>
		<% /* jsp내에서의 for문 */
			for(int i=0;i<10;i++)
		{%>
			안녕하세요<br>
			<% 
			
			}%>
	</p>
</body>
</html>