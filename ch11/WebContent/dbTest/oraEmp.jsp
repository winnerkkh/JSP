<%@page import="model.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password=application.getInitParameter("password");

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	List<Emp> list = new ArrayList<>();
	String sql = "select empno, ename, hiredate, deptno from emp where deptno=?";
	try{
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deptno );
		rs = pstmt.executeQuery();
		while(rs.next()){
			
			//Bean객체 생성
			Emp emp = new Emp();
			
			//속성 저장
			emp.setEmpno(rs.getInt(1));
			emp.setName(rs.getString(2));
			emp.setHireDate(rs.getDate(3));
			emp.setDeptno(rs.getInt(4));
			
			//list에 Bean객체 저장
			list.add(emp);
		}
		//request에 객체 저장
		request.setAttribute("list", list);
		
		//경로 설정
		RequestDispatcher dispatcher = request.getRequestDispatcher("oraEmpView.jsp");
		
		//포워드
		dispatcher.forward(request,response);
		
	}catch(Exception e){}
%>