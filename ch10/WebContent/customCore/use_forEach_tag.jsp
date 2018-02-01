<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	HashMap<String, Object> mapData = new HashMap<>();
	mapData.put("name", "홍기동");
	mapData.put("today", new Date());
%>
<c:set var="intArray" value="<%=new int[] { 1, 2, 3, 4, 5 }%>" />
<c:set var="map" value="<%=mapData%>" />

<html>
<body>
	<h4>int형 배열</h4>
	<table border=1 bgcolor="yellow">
		<caption>int형 배열 결과</caption>
		<tr>
			<td>인덱스</td>
			<td>카운트</td>
			<td>배열의 값</td>
		</tr>

		<c:forEach var="i" items="${intArray}" begin="2" end="4"
			varStatus="status">
			<tr align="center">
				<td>${status.index}</td>
				<td>${status.count}</td>
				<td>[${i}]</td>
			</tr>
		</c:forEach>
	</table>


	<hr>
	<c:forEach var="i" items="${map}">
 	${i.key} 
 	</c:forEach>


</body>

</html>

