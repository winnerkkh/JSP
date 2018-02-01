<%@ page contentType="text/html; charset=UTF-8"  %>
<%
		//세션 정보 삭제
		session.invalidate();
		out.print("<script>");
		out.print("alert('로그아웃 되었습니다.');");
		out.print("location.href='loginform.html';");
		out.print("</script>");
%>
<h2>로그아웃</h2>
