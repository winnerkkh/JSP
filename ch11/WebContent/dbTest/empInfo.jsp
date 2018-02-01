<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>


<%
	// 최기화 파일 (web.xml)의 db 설정값을 읽어옴.
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");

	//DB작업 1단계 드라이버 로딩
	Class.forName(driver);
	
	//DB작업 2단계 connection 맺기
	Connection conn = DriverManager.getConnection(url, user, password);
	
	//DB작업 3단계 쿼리 작업
	String sql = "select * from dept where deptno=?";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	try{
		pstmt = conn.prepareStatement(sql);//쿼리 객체 생성
		pstmt.setInt(1, deptno);//반인딩 변수 적용
		rs = pstmt.executeQuery();//쿼리 실행 결과 받기
		if(rs.next()){
			//request객체에 속성으로 객체 저장
			request.setAttribute("deptno", rs.getInt(1));
			request.setAttribute("dname", rs.getString(2));
			request.setAttribute("loc", rs.getString(3));
		}
		//뷰 페이지로 이동
		RequestDispatcher rd
		  = request.getRequestDispatcher("empInfoView.jsp");
		rd.forward(request, response);
		
	}catch(Exception e){
		out.print(e.getMessage());
	}finally{
		try{//DB작업 4단계 자원 해제
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e){
			out.print(e.getMessage());
	  }
	}
%>
