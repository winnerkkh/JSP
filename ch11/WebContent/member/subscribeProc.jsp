<%@page import="java.util.Date"%>
<%@page import="model.Member"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");

	//1단계
	Class.forName(driver);
	//2단계
	Connection conn = DriverManager.getConnection(url, user, password);
	//
	PreparedStatement pstmt = null;
	String sql1 = "insert into member2(id,password,name,birth) " + " values(?,?,?,?)";
	String sql2 = "insert into member2Info(id,address,tel,email) " + " values(?,?,?,?)";
	//파라미터 받기
	Member member = new Member();
	member.setId(request.getParameter("id"));
	member.setPassword(request.getParameter("password"));
	member.setName(request.getParameter("name"));
	member.setBirth(request.getParameter("birth"));
	member.setAddress(request.getParameter("address"));
	member.setEmail(request.getParameter("email"));
	member.setTel(request.getParameter("tel"));

	try {
		//3단계 - 1.쿼리 객체 설정
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getPassword());
		pstmt.setString(3, member.getName());
		pstmt.setString(4, member.getBirth());//

		int result = pstmt.executeUpdate();
		if (result > 0) {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getAddress());
			pstmt.setString(3, member.getTel());
			pstmt.setString(4, member.getEmail());

			result = pstmt.executeUpdate();
			out.print("<script>");
			out.print("alert('회원가입을 축하드립니다.');");
			out.print("window.location.href='loginform.html';");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('입력실패!');");
			out.print("</script>");
		}
	} catch (Exception e) {
		out.print(e.getMessage());
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			out.print(e.getMessage());
		}
	}
%>