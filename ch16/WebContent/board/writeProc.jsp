<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="model.Board"/>
<jsp:setProperty property="*" name="board"/>
<%
	String pageNum = request.getParameter("pageNum");
	board.setIp(request.getRemoteAddr());//게시글 등록자의 ip주소(win7 ipv6)
	BoardDao dao = BoardDao.getInstance();
	int result = dao.insert(board);
	if(result>0){
			response.sendRedirect("list.jsp?pageNum="+pageNum);	
	}else{
		out.print("<script>");
		out.print("alert('입력 실패!');");
		out.print("history.back();");
		out.print("</script>");
	}
%>