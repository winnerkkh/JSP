<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	Connection conn = null;
	String sql = "select id from member2 order by id";
	try {
		Context init = new InitialContext();
		DataSource ds 
		= (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//실행
		ResultSet rs = pstmt.executeQuery();
		//결과 값 얻기
	    %>
	    <form action="callabletest2.jsp">
	    <select name="id">
	    <%
		while(rs.next()){
	     %><option value=<%=rs.getString(1)%>>
	       <%=rs.getString(1)%></option>	
	    <%	
	    }
	    %>
	    </select>
	     <input type="submit" value="전송"/>
	    </form>
	    <%
		conn.close();
	} catch (Exception e) {
		out.print(e.getMessage());
	}
%>