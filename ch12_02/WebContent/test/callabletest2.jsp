<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	Connection conn = null;
	String sql = "{? = call member_name(?)}";
	try {
		Context init = new InitialContext();
		DataSource ds 
		= (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();
		CallableStatement cstmt = conn.prepareCall(sql);
		//입력값 setting
		String id = request.getParameter("id");
		cstmt.setString(2, id);//입력값
		cstmt.registerOutParameter(1, Types.VARCHAR);//출력값
		//함수 실행
		cstmt.execute();
		//결과 값 얻기
		out.print("result:"+cstmt.getString(1));
		conn.close();
	} catch (Exception e) {
		out.print(e.getMessage());
	}
%>