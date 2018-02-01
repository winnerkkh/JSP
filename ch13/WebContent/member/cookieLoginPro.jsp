<%@page import="util.CookieBox"%>
<%@page import="dao.MemberDao"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    MemberDao dao = new MemberDao();
    int chk = dao.userCheck(id,password);
    
    if(chk==1){/* 1:아이디와 패스워드가 모두 정상 */
    		Cookie cookie = CookieBox.createCookie("id", id, 20*60);
    		response.addCookie(cookie);
    		response.sendRedirect("cookieMain.jsp");
    }else if(chk==0){/*0:아이디는 맞지만 패스워드가 틀린 경우  */
    	out.print("<script>");
    	out.print("alert('패스워드가 맞지 않습니다.');");
    	out.print("history.back();");/* BOM(뒤로 가기) */
    	out.print("<script>");
    }else{/*2:아이디가 없는 경우 */
    	out.print("<script>");
    	out.print("alert('해당하는 아이디가 없습니다.');");
    	out.print("history.go(-1);");/* BOM(뒤로 가기) */
    	out.print("<script>");
    }
%>