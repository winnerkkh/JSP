<%@page import="model.Dept"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
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
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "insert into dept values(?,?,?)";//부서정보 입력문
	String sql2 = "select count(*) from dept where deptno=?";//해당코드의 정보 존재여부확인
	String sql3 = "select * from dept order by deptno";//전체 출력
	
	//파라미터 변수 
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	
	//Bean객체들을 저장할 List생성
	List<Dept> list = new ArrayList<Dept>();
	try {
		//DB3단계
		// - 1.파라미터로 입력받은 부서코드 존재 여부확인
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, deptno);
		rs = pstmt.executeQuery();
		// -1.1 부서코드가 존재하면 다시 뒤로 back;
		if (rs.next()) {
			if (rs.getInt(1) > 0) {
				out.print("<script>");
				out.print("alert('존재하는 부서코드입니다.');");
				out.print("history.back();");
				out.print("</script>");
			}
		}
		
		//-2.부서코드가 존재하지 않으면 insert작업 실행
		pstmt = conn.prepareStatement(sql);//입력쿼리 실행
		pstmt.setString(2, dname);
		pstmt.setString(3, loc);
		pstmt.setInt(1, deptno);
		
		int result = pstmt.executeUpdate();//인서트 작업 처리 결과가 0보다 크면
		if (result > 0) {
			//수정된 데이타를 select처리
			pstmt = conn.prepareStatement(sql3);//쿼리객체 생성
			rs = pstmt.executeQuery();
			while (rs.next()) {
				//부서객체(Bean)생성
				Dept dept = new Dept(rs.getInt(1), rs.getString(2), rs.getString(3));
				/* int dno =  rs.getInt(1);
				String dnm=rs.getString(2);
				String location=rs.getString(3);
				//속성 저장
				 dept.setDeptno(dno);
				 dept.setDname(dnm);
				 dept.setLoc(location); */
				//collection에 빈을 저장
				list.add(dept);
			}
			//list객체를 request에 저장
			request.setAttribute("list", list);
		}
		//페이지 이동
		RequestDispatcher rd = request.getRequestDispatcher("oraDeptInsertResult.jsp");
		rd.forward(request, response);

	} catch (Exception e) {
		out.print(e.getMessage());
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			out.print(e.getMessage());
		}
	}
%>