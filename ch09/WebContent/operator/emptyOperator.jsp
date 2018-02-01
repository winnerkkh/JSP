<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>empty 연산자</title>
</head>
<body>
	<!--  파라미터로 넘어온 parma.id의 값이 null인지 여부 확인 empty  -->
  안녕하세요, ${empty param.id ? "guest":param.id}님
</body>
</html>