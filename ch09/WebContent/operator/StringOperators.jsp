<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<html>
<head>
<title>문자열 비교</title>
</head>
<body>
  입력문자열:${param.str1},${param.str2}<br><br>
 <!-- EL에서 문자열 비교 는 동등 연산자(==)로 비교 --> 
  두 문자열이 같습니까? ${param.str1 == param.str2}<br>
  <!-- EL에서 비교 연산자 의 문자열 비교는 사전식 비교  -->
  어느 문자열이 먼저입니까?${param.str1 <param.str2?param.str1:param.str2}<br>
</body>
</html>