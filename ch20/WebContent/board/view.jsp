<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>내용 보기</title>
</style>
</head>
<body>
<form action="">
<table width="500" border="1" align="center">
	<caption><h2>글 내용 보기</h2></caption>
	<tr height="30"><th>글번호</th><td>${board.num}</td>
	<th>조회수</th><td>${board.readcount}</td></tr>
   
   <tr height="30"><th>작성자</th><td>${board.writer}</td>
   <th>작성일</th><td>${board.reg_date}</td></tr>
   
   <tr height="30">
   <th>글제목</th><td colspan="3" class="left">${board.subject}</td>
   </tr>
   <tr><th>글내용</th><td colspan="3" class="left">
   <pre>
   ${board.content}
   </pre></td></tr>
   
   <tr height="30"><td colspan="4" align="center">
   
   <input type="button" value="글수정" onclick
   ="location.href='updateForm.do?num=${board.num}&pageNum=${pageNum}'">
   
   <input type="button" value="글삭제" onclick
   ="location.href='deleteForm.do?num=${board.num}&pageNum=${pageNum}'">
   
   <input type="button" value="답글쓰기" onclick
   ="location.href='writeForm.do?num=${board.num}&pageNum=${pageNum}&ref=${board.ref}&re_step=${board.re_step}&re_level=${board.re_level}'">
   
   <input type="button" value="글목록" onclick
   ="location.href='list.do?pageNum=${pageNum}'">
   </td>
   </tr>
</table>
</form>
</body>
</html>