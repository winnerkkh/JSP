<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head>
<title>구구단 </title>
</head>
<body>
<table border=1>
<c:forEach var="j" begin="1" end="9">
 <tr>
 <c:forEach var="i" begin="${num1}" end="${num2}">
     <td>${i }*${j }=${i*j }</td>
 </c:forEach>
 </tr>
</c:forEach>
</table>
 <!--     // 3~7 
     3*1 =3 4*1 =4 5*1 =5 6*1=6 7*1=7
     3*2=6  4*2=8  5*2=10 6*2=12 7*2=14
     
     ...
     3*9=27  4*9=36 ........             7*9=63 -->
</body>
</html>