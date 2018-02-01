<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
	
    //3단계
    String deptno = request.getParameter("deptno");
    int deptIno = Integer.parseInt(deptno);
    	
    //
    PreparedStatement pstmt=null;
    String sql = "select * from dept where deptno=?";
    ResultSet rs = null;
    
    try{
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1, deptIno);
    	rs = pstmt.executeQuery();
    	if(rs.next()){
    		/* out.print("부서정보는 : "+rs.getInt(1)+" "+rs.getString(2)+rs.getString(3)); */
    		
    		request.setAttribute("deptno", rs.getInt(1));
    		request.setAttribute("dname", rs.getString(2));
    		request.setAttribute("location", rs.getString(3));
    		
    	} else{
    		
    		out.print("해당부서는 없는 부서 입니다.");
    	}
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("oraTestView.jsp");
		dispatcher.forward(request,response);    	
    	
    }catch(Exception e){
    	
    }
    
	
	//4단계 연결 해제
	conn.close();
%>
