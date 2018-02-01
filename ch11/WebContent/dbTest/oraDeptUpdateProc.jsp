<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>


<%	//DB설정값 읽어오기
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password=application.getInitParameter("password");

	//DB1단계
	Class.forName(driver);
	
	//DB2단계
	Connection conn = DriverManager.getConnection(url, user, password);
	
	//수정작업 변수
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "update dept set dname=?, loc=? where deptno=?";
	String sql2 = "select * from dept where deptno=?";
	
	//파라미터 변수
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	
	try{
		//DB3단계
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,dname);
		pstmt.setString(2,loc);
		pstmt.setInt(3, deptno);
		
		int result = pstmt.executeUpdate();//수정작업 처리 후 결과 받기
		if(result>0){
			//수정된 데이타를 select처리
			pstmt = conn.prepareStatement(sql2);//쿼리객체 생성
			pstmt.setInt(1,deptno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				request.setAttribute("deptno", rs.getInt(1));
				request.setAttribute("dname", rs.getString(2));
				request.setAttribute("loc",rs.getString(3));
			}
		}
		
		//페이지 이동
		RequestDispatcher rd
		 = request.getRequestDispatcher("oraDeptUpdateResult.jsp");
		rd.forward(request, response);
		
		
	}catch(Exception e){
		out.print(e.getMessage());
	}finally{
		
		try{
			if(rs!=null) rs.close(); 
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			
		}catch(Exception e){
			out.print(e.getMessage());
		}
		
	}
%>