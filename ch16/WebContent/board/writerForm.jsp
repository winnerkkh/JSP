<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="color.jsp" %>
<html>
<head>
<title>게시판 글쓰기 폼</title>
<link href="/ch16/css/style.css" rel="stylesheet" type="text/css">
<style type="text/css" >
	body{text-align: center;}
	td{background-color: "<%=value_c%>"}
</style>
<script type="text/javascript" src="/ch16/js/script.js"></script>
</head>
<body bgcolor="<%=bodyback_c%>">
<%
	 int num=0, ref=0, re_level=0,re_step=0;/* 글쓰기 글번호 초기화 */
	 String pageNum = request.getParameter("pageNum");
	  if(pageNum==null) pageNum ="1";
	 if(request.getParameter("num")!=null){
		 num = Integer.parseInt(request.getParameter("num"));
		 ref = Integer.parseInt(request.getParameter("ref"));
		 re_level = Integer.parseInt(request.getParameter("re_level"));
		 re_step=Integer.parseInt(request.getParameter("re_step"));
	 }
%>
<form action="writeProc.jsp" method="post" name="writeForm" onsubmit="return writeSave()">
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="ref" value="<%=ref %>">
	<input type="hidden" name="re_level" value="<%=re_level%>">
	<input type="hidden" name="re_step" value="<%=re_step %>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
<table>
    <caption><h3>게시판</h3></caption>
	<tr><th>제목</th>
	<td>
	  <%
	  	if(num==0){%>
	  	<input type="text" name="subject"  maxlength = "50" size= "40" required="required">
	    <%}else{ %>
	    <input type="text" name="subject" maxlength = "50" size= "40" required="required" value="[답변]">
	    <%} %>
	   </td> 
	</tr>
	<tr><th>작성자</th><td class="left"><input type="text" name="writer" size="10" maxlength="10"></td></tr>
	<tr><th>이메일</th><td><input type="text" name="email"  size="40" maxlength="30" required></td></tr>
	<tr><th>내용</th>
	<td class="left">
		<textarea name="content" rows="10" cols="30"></textarea>				
	</td></tr>
	<tr><th>암호</th><td class="left"><input type="password" name="password"  size="10" maxlength="10"></td></tr>
	<tr><th>암호확인</th><td class="left"><input type="password" name="password1"  size="10" maxlength="10"></td></tr>
	<tr><td colspan="2"><input type="submit" value="확인">
	<input type="reset" value="취소"></td>
	</tr> 
	<tr>
		<td colspan=2>
		<input type="button" value="목록보기" onclick="window.location='list.jsp'">
	    </td>
	</tr>
</table>
</form>

</body>
</html>