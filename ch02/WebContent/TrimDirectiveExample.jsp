<%@page import="java.util.Date"%><!-- 지시부: import  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 지시부:페이지 설정  -->
    
<%@ page trimDirectiveWhitespaces="false" %><!--페이지의 불필요한 공백 제거  -->
 <!-- html 문서로 변환될 때 불필요한 공백을 제거하기 위해서는 trimDirectiveWhitespaces 속성의 값을 true로 설정하면 됩니다. --> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현재시각</title>
</head>
<body>
 현재 시각: <%= new Date() %>
</body>
</html>