package ch05.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/serverInfoServlet")
public class ServerInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
						HttpServletResponse response) 
							throws ServletException, IOException {
		//서블릿 정보 객체 생성
		ServletContext context = getServletContext();
		String serverInfo = context.getServerInfo();//서버정보 획득
		int majorVersion = context.getMajorVersion();
		int minorVersion = context.getMinorVersion();
		//콘텐츠 문자셋 설정
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>웹 서버 정보</title></head><body>");
		out.print("웹 서버 정보: "+serverInfo+"<br>");
		out.print(majorVersion+"."+minorVersion);
		out.print("</body></html>");
	}

	protected void doPost(HttpServletRequest request, 
						HttpServletResponse response)
						throws ServletException, IOException {
		doGet(request, response);
	}

}
