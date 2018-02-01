package cp01.test;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "두개이상의 값을 파라미터로 받아서 처리하는 서블릿", urlPatterns = { "/TodayMenu" })
public class TodayMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 넘어오는 파라미터 객체의 문자셋 설정
		request.setCharacterEncoding("utf-8");
		// 배열형태로 넘어온 파라미터들은 배열로 받음
		// 저장과 동시에 배열생성
		String lunches[] = request.getParameterValues("lunch");
		// 콘텐트 설정
		response.setContentType("text/html;charset=utf-8");
		// 출력
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>select & post</title></head>");
		out.print("<body>");
		out.print("<center><h3>오늘 점심메뉴는</h3></center>");
		for (int i = 0; i < lunches.length; i++) {
			out.print("<br>");// html에서는 println()문이 적용안됨 ->"<br>"
			out.print(lunches[i]);
		}
		out.print("을 먹어야 겠다.");
		out.print("</body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
