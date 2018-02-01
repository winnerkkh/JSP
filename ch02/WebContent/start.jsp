<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%> <!-- directive -->


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1부터 100까지의 합</title>
</head>
<body>
	<% /* 자바코드 부분 시작 */
		int i=1;
		int total=0;
		for(; i<=100; i++){
			total +=i;
		}
	%>
	<!-- 자바코드부분 끝  -->
	1부터 100까지의 합은?<%=total%> <!-- 표현식(expression):식의 결과, 같이 옴 -->


</body>
</html>