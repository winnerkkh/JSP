<%@page import="model.Dept"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	//DB설정값 읽어오기
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");

	//DB1단계
	Class.forName(driver);
	//DB2단계
	Connection conn = DriverManager.getConnection(url, user, password);
	//수정작업 변수
	Statement stmt = null;
	ResultSet rs = null;
	//삭제 쿼리문
	String sql = "delete dept where deptno in (";
	String sql2 = "select * from dept order by deptno";
	//파라미터 변수 
	String[] deptno = request.getParameterValues("deptno");//스트링타입의 배열받기
	//List생성
	List<Dept> list = new ArrayList<Dept>();

	for (int i = 0; i < deptno.length; i++) {
		if (i == (deptno.length - 1))
			sql += deptno[i] + ")";
		else
			sql += deptno[i] + ",";
	}
	System.out.println("sql=" + sql);

	try {
		//DB3단계
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);//삭제작업 처리 후 결과 받기
		if (result > 0) {
			//삭제 이후  데이타  select처리
			stmt = conn.createStatement();//쿼리객체 생성
			rs = stmt.executeQuery(sql2);
			if (rs.next()) {
				int i = 0;
				Dept dept = new Dept(rs.getInt(++i), rs.getString(++i), rs.getString(++i));
				list.add(dept);
			}
		}
		//request에 속성으로 객체 저장
		request.setAttribute("list", list);
		//페이지 이동
		RequestDispatcher rd = request.getRequestDispatcher("oraDeptDeleteResult.jsp");
		rd.forward(request, response);
	} catch (Exception e) {
		out.print(e.getMessage());
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			out.print(e.getMessage());
		}
	}
%>