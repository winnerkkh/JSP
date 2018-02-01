<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
		String num = request.getParameter("num");
    	BoardDao dao = BoardDao.getInstance();
    	String pageNum = request.getParameter("pageNum");
    	int result = dao.updateFavor(Integer.parseInt(num));
    	if(result>0){
    		out.print("<script>");
    		out.print("alert('좋아요 1이 증가하였습니다.');");
    		out.print("location.href='content.jsp?num="+num+"&pageNum="+pageNum+"';");
    		out.print("</script>");
    	}else{
    		out.print("<script>");
    		out.print("alert('좋아요 1 증가 실패');");
    		out.print("history.back();");
    		out.print("</script>");
    	}
%>