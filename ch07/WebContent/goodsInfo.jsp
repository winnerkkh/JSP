<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>상품 정보</title>
</head>
<body>

<table width="100%" border="1" cellpadding="0" cellspacing="0">
	<tr>
	<td>제품번호</td> <td>10,000원</td>
	</tr>
</table>

<jsp:include page="infosub.jsp" flush="false">
	<jsp:param name="type" value="A"/>
</jsp:include>

</body>
</html>