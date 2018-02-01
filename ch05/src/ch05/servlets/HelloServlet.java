package ch05.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿의 라이프 사이클
// init() -> 서비스 doGet()/doPost() -> 종료 destory()
@WebServlet(description = "서블릿초기화실행종료", urlPatterns = { "/helloServlet" })
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//서블릿 초기화 메소드
	public void init(ServletConfig config) throws ServletException {
		System.out.println("초기화메소드 init() 호출");
	}

	//서블릿 종료 메소드
	public void destroy() {
		System.out.print("종료메소드 destroy() 호출");
	}

	//서비스 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서비스 doGet() 메소드 호출");
		response.setContentType("text/html;charset-utf8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>Hello</title></head><body>");
		out.print("Hello !!!");
		out.print("</body></html>");
	}

}
