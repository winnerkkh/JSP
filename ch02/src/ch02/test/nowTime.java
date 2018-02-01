package ch02.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/nowTime")
public class nowTime extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/* 콘텐츠 타입의 문자셋 세팅을 PrintWriter객체 생성보다 먼저 해주어야함. */
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		
		out.write("<html>\r\n");
		out.write("<head>\r\n");
	
		out.write("<title>날짜와 시간 정보</title>\r\n");
		out.write("</head>\r\n");
		out.write("<body>\r\n");
		/* 스크립틀릿 */
		/* Ctrl + Shift + O <==자바에서 import 단축키 > */
		/* Ctrl + Space <== JSP에서 import 단축키 > */

		GregorianCalendar now = new GregorianCalendar();
		String date = String.format("%TF", now);
		String time = String.format("%TT", now);

		out.write("\r\n");
		out.write("\r\n");
		out.write("\t오늘의 날짜: ");
		out.print(date);
		out.write(" <br>\r\n");
		out.write("\t현재의 시각: ");
		out.print(time);
		out.write("\r\n");
		out.write("\r\n");
		out.write("\r\n");
		out.write("</body>\r\n");
		out.write("</html>");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
