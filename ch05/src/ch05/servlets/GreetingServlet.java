package ch05.servlets;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/greetingServlet")
public class GreetingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter logFile;

	// 초기화 메소드
	public void init(ServletConfig config) throws ServletException {
		try {
			logFile = new PrintWriter(new FileWriter("c:\\data\\log.txt"));
		} catch (IOException e) {
			throw new ServletException(e);
		}
	}
	
	// 종료메소드
	// - 어플리케이션 제거 혹은 tomcat종료시 기록됨
	public void destroy() {
		if (logFile != null)
			logFile.close();// 자원해제
	}

	// 서비스
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//파라미터로 넘어온 객체의 문자셋을 현재 페이지의 문자셋으로 설정
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String greeting="";
		if(name!=null && !"".equals(name)) {
			greeting = name +"님 방가여!!";
		}
		if(logFile!=null) {
			GregorianCalendar now = new GregorianCalendar();
			//로그파일에 기록.
			logFile.printf("%TF %TT - %s %n", now,now,name);
		}
		//출력되는 페이지의 문자셋에 맞춰 문자셋 설정
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>인사하기</title></head><body>");
		out.print(greeting);
		out.print("</body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
