<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Book"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);
	String sql = "select * from book ";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//첫 번째 조회 변수 설정
	String chB = request.getParameter("chB");
	switch (chB) {
	case "title":
		sql += " where title like ? order by code";
		break;
	case "writer":
		sql += " where writer like ? order by code";
		break;
	default:
		sql += " where title like ? or writer like ? order by code";
		break;
	}
	//두번 조회 변수 설정
	String searchVar = request.getParameter("searchVar");
    if(searchVar==null) searchVar="";
	searchVar = "%" + searchVar + "%";
	System.out.println("chB=" + chB);
	System.out.println("searchVar=" + searchVar);
	System.out.println("sql =" + sql);
	List<Book> list = new ArrayList<Book>();
	try {
		//바인딩변수 1개 있는 경우
		if (chB.equals("title") || chB.equals("writer")) {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchVar);
			
		} else {//바인딩 변수가 2개인 경우
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchVar);
			pstmt.setString(2, searchVar);
		}
		rs = pstmt.executeQuery();
		while (rs.next()) {
			Book book = new Book();
			book.setCode(rs.getInt(1));
			book.setTitle(rs.getString(2));
			book.setWriter(rs.getString(3));
			book.setPrice(rs.getInt(4));
			book.setRegDate(rs.getDate(5));
			list.add(book);
		}
		//request에 속성 저장
		request.setAttribute("booklist", list);
		RequestDispatcher rd = request.getRequestDispatcher("BookInfoInput.jsp");

		
		
		
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