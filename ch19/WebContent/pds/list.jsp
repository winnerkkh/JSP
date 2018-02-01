<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>자료 리스트</title>
</head>
<body>
	<h2>자료리스트</h2>

	<table border="1">
		<caption>
			<b>자료 리스트 현황</b>
		</caption>

		<tr>
			<th><b>순번</b></th>
			<th><b>아이디</b></th>
			<th><b>파일명</b></th>
			<th><b>파일사이즈</b></th>
			<th><b>설명</b></th>
			<th><b>보기</b></th>
		</tr>
	
	
	<c:if test="${empty list}">
	<tr align="center"><td colspan=6><b>자료가 없습니다.</b></td></tr>
	</c:if>
		<c:if test="${!empty list}">
			<c:forEach var="pd" items="${list}" varStatus="no">
				<tr align="center">
					<td><b>${no.count}</b></td>
					<td><b>${pd.id}</b></td>
					<td><b>${pd.filename}</b></td>
					<td><b><fmt:formatNumber value="${pd.filesize}" pattern="###,##0"/></b></td>
					<td><b>${pd.description}</b></td>
					<td><b><a href="${path}/upload/${pd.filename}">파일보기</a></b></td>
				</tr>
			</c:forEach>
		</c:if>
	</table> <br>
	<b><a href="uploadForm.jsp">업로드</a></b></br>

</body>
</html>