<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //출력 custom tag을 사용하여 테이블 형태로 출력하세요. -->
<c:if test="${empty booklist}">
	조회 내용이 없습니다.
</c:if>
<c:if test="${!empty booklist}">
	<table border=1 bgcolor="yellow">
		<caption>
			<h3>책 조회 결과</h3>
		</caption>
		<tr align="center">
			<td>코드</td>
			<td>제목</td>
			<td>저자</td>
			<td>가격</td>
			<td>등록일자</td>
		</tr>
		<c:forEach var="b" items="${booklist}">
			<tr align="center">
				<td>${b.code}</td>
				<td>${b.title}</td>
				<td>${b.writer}</td>
				<td>${b.price}</td>
				<td>${b.regDate}</td>
			</tr>
		</c:forEach>
	</table>
</c:if>