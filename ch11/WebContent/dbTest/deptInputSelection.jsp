<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page contentType="text/html; charset=UTF-8"%>




<%
    String driver = application.getInitParameter("driver");
    String url = application.getInitParameter("url");
    String user = application.getInitParameter("user");
    String password=application.getInitParameter("password");
    
	Class.forName(driver);
    Connection conn = DriverManager.getConnection(url, user, password);
    String sql = "select deptno, dname from dept";
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try{
    	pstmt = conn.prepareStatement(sql);
    	rs = pstmt.executeQuery();
    	%><form action="oraEmp.jsp">
    	  <select name="deptno"><%
    	while(rs.next()){%>
    	   <option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%><%=rs.getString(2)%>
    	<%	
    	}
    	%>
    	</select>
    	<input type="submit" value="확인">
    	</form>
    	<%
    	
    }catch(Exception e){
    	out.print(e.getMessage());
    }
    
    //연결 해제
    conn.close();
%>	