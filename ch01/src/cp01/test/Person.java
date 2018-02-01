package cp01.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Person
 */
@WebServlet("/Person")
public class Person extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//파라미터로 넘어온 request객체의 문자셋을 현재서블렛의 환경에 맞게 세팅
		request.setCharacterEncoding("utf-8");
		// 파라미터값들을 모두 String 타입
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass1");

		// radiobox는 하나의값만 선택되어서 전달됨
		String gender = request.getParameter("gender");
		
		System.out.println("name= " + name);
		System.out.println("name= " + id);
		System.out.println("name= " + pass);
		System.out.println("name= " + gender);

		// checkbox
		String inotice = request.getParameter("inotice");
		String cnotice = request.getParameter("cnotice");
		String dnotice = request.getParameter("dnotice");
		String job = request.getParameter("job");

		// 파라미터로 넘어온 String타입의 객체가 null인 경우 빈 문자열로 변환처리
		if (inotice == null) {
			inotice = "";
		}

		if (cnotice == null) {
			cnotice = "";
		}

		if (dnotice == null) {
			dnotice = "";
		}

		response.setContentType("text/html;charset=utf-8");

		// 출력객체 생성
		PrintWriter out = response.getWriter();
		out.print("<html><body><h1>개인정보</h1>");
		out.print("이름:" + name + "<p>아이디:" + id + "<p>");
		out.print("암호:" + pass + "<p>성별:" + gender + "<p>");
		out.print("메일수신여부:" + inotice + " " + cnotice + " " + dnotice + "<p>");
		out.print("직업:" + job + "<p>");
		out.print("</body></html>");
		out.close();// flush()

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
