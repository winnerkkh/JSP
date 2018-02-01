<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>주소 정보</title>
</head>
<body>
	<!-- 
	이전 페이지에서 쿼리스트링(?name=park)로 넘어온 값은 
	param.name으로 접근
	map객체의 값을 추출 => map명[param.파라미터명]
	 -->

${param.name}의 주소는? ${address[param.name]}<p> <!-- map의 파라미터명으로 값을 구함 -->
${address.Jesica}<p>
${address.Susan}<p>

</body>
</html>