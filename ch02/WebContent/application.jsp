<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 지시자 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>application 내장 변수의 사용 예</title>
</head>
<body>
		<% /* 스크립틀릿 */
			String appPath = application.getContextPath();
			String filePath = application.getRealPath("/sub/Intro.html");
		%>
		웹 어플리케이션의 URL 경로명: <%= appPath %> <br>
		/sub1/Intro.html의 파일 경로명: <%= filePath %> <!-- URI로 표시된 경로명을 절대경로명으로 변환하는 메소드 -->
		
		
</body>
</html>