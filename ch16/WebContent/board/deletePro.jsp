<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	   String num = request.getParameter("num");
       String pageNum = request.getParameter("pageNum");
       String password = request.getParameter("password");
       
       BoardDao dao = BoardDao.getInstance();
       int result = dao.useCheck(Integer.parseInt(num), password);
       if(result==-1){/* 패스워드가 맞지않으면 */
    	   out.print("<script>");
           out.print("alert('패스워드가 맞지않습니다.');");
           out.print("history.back();");
       	   out.print("</script>");
       }else if(result==1){/* 패스워드가 맞으면 */
    	   /* 댓글 존재 여부 확인 */
    	   boolean isTrue = false;
           
       		isTrue = dao.isReply(Integer.parseInt(num));
           
    	   if(isTrue==false)
    	       {//댓글이 존재하지 않으면 삭제 처리 가능
		    	   result = dao.deleteBoard(Integer.parseInt(num));
			          if(result>0){
			        	   out.print("<script>");
			        	   out.print("alert('게시글 삭제 성공');");
			        	   out.print("location.href='list.jsp?pageNum="+pageNum+"';");
			        	   out.print("</script>");
			          }else{
			        	  out.print("<script>");
			        	  out.print("alert('삭제 실패!!!');");
			        	  out.print("history.back();");
			        	  out.print("</script>");
			          }//else끝
		       }else{//댓글이 존재하면 삭제 할수 없음.
		    	   out.print("<script>");
		    	   out.print("alert('댓글이 존재합니다.!!');");
		    	   out.print("location.href='list.jsp?pageNum="+pageNum+"';");
		    	   out.print("</script>");
		       }//else끝
       }//else if()끝
          
          
%>
