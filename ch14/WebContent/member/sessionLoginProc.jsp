<%@page import="dao.MemberDao1"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	//DB에서 id, password확인
	MemberDao1 dao = new MemberDao1();

	int result = dao.userCheck(id, password); //정상1, 패스워드 이상0, 아이디 없을때2

	if (result == 1) {
		out.println("<script>");
		out.println("alert('로그인 되었습니다');");
		out.println("</script>");
		

		//세션에 객체 속성 저장
		session.setAttribute("id", id);
		session.setAttribute("password", password);

		// 새로운 페이지로 이동
		//sendRedirect()를 호출하면 호춣하는 해당페이지의 출력은 버려짐(flush)
		response.sendRedirect("sessionMain.jsp");
		
	} else if (result == 0) {
		out.println("<script>");
		out.println("alert('비밀번호가 일치하지 않습니다.');");
		out.println("history.back();");
		out.print("</script>");
		
	} else {
		out.println("<script>");
		out.println("alert('아이디가 존재하지 않습니다.');");
		out.println("history.back();");
		out.println("</script>");
	}

%>