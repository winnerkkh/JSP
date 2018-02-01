<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1부터 10까지 순서대로 출력하기</title>
</head>
<body>
<%
	for(int i=1; i<=10; i++){
		out.println(i + "<br>"); /* out내장객체 사용 */
	}
%>

</body>
</html>