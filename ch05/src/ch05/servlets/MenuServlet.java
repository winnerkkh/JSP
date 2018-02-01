package ch05.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/menuServlet")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		ResultSet rs =null;
		PreparedStatement pstmt =null;
		String sql = "select * from menu";
		
		
		
		String dbName = getInitParameter("DB_NAME");
		String url = getInitParameter("url");
		String user = getInitParameter("user");
		String password = getInitParameter("password");
		Connection con = null;

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("url=" + url + "<br>");
		out.print("user=" + user + "<br>");
		out.print("password=" + password + "<br>");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			
			if (con != null) {
				
				   out.print("<html><body>접속 성공<br>"
					   		+ "dbName="+dbName+"<br>"
					   		+ "url="+url+"<br>"
					   		+ "user="+user+"<br>" );
				   
				   //쿼리 객체 생성
				   pstmt = con.prepareStatement(sql);
				   rs = pstmt.executeQuery();
				   
				   //table생성
				   out.print("<table border=1><caption><h3>메뉴</h3></caption>");
				   
				   //데이타 출력
				   while(rs.next()) {
					   out.print("<tr align=center>");
					   out.print("<td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td>");
					   out.print("</tr>");
				   }
				   //html 닫기
				   out.print("</table>");
				   out.print("</body></html>");
				   
				   //자원해제
				   rs.close();
				   pstmt.close();
				   con.close();
				   
				   
			} else
				out.print("<html><body>접속 실패</body></html>");
		} catch (Exception e) {
			out.print("예외발생:" + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
