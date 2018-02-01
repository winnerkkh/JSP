package cp01.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "게시글 작성을 서블릿", urlPatterns = { "/Board" })
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//요청객체의 문자셋 설정
		request.setCharacterEncoding("utf-8"); //요청으로 넘오온 객체의 문자셋 설정
		
		// 파라미터를 입력받기
		String name = request.getParameter("title"); // HTML에 name Atttribute에 저장된 이름으로 사용
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//생성한 콘텐츠의 문자셋 세팅
		response.setContentType("text/html;charset=utf-8");
		
		//출력객체 생성
		PrintWriter out = response.getWriter();
		out.print("<html><title><head>게시판 내용</head></title>");
		out.print("<body>");
		out.print("<h1>게시판</h1>");
		out.print("제목:" + title + "<p>");
		out.print("제목:" + name + "<p>");
		out.print("내용<br><pre>" + content + "</pre></body></html>");// 입력상태그대로 출력하는 태그<pre>
		out.close();/// 자원해제 -- flush()
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
