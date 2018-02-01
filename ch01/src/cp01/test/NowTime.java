package cp01.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ThisTime")
public class NowTime extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 문자셋 정의
		resp.setContentType("text/html;charset=utf-8");

		// 출력
		PrintWriter out = resp.getWriter();

		// Java에서는 println()이 적용되지만
		// HTML에서는 Println()이 적용되지 않는다
		out.print("<html>");
		out.print("<head><title>현재시간</title></head>");
		out.print("<body>");
		out.print("현재시간은 ");
		out.print(new Date());
		out.println("입니다");
		out.print("</body></html>");

	}

}
