package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns="*.do",
initParams= {@WebInitParam(name="config",
                                          value="/WEB-INF/command.properties")
})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//명령어map생성
	private Map<String, Object> commandMap = new HashMap<>();

	public void init(ServletConfig config) throws ServletException {
		String conf = config.getInitParameter("config");
		Properties props = new Properties();
		FileInputStream fi =null;
		try {
			     String filePath = config.getServletContext().getRealPath(conf);
			     fi = new FileInputStream(filePath);
			     props.load(fi);//command.properties파일로부터 Properties객체에 저장
		}catch(IOException e) {
			throw new ServletException();
		}finally {
			try {
			if(fi!=null)fi.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally 끝.
		
		Iterator keys = props.keySet().iterator();//키를 iterator에 저장
		while(keys.hasNext()) {
			String command = (String)keys.next();
			String className = props.getProperty(command);
			try {
					Class commandClass = Class.forName(className);
					CommandProcess commandInstance 
					                         = (CommandProcess) commandClass.newInstance();
					commandMap.put(command, commandInstance);//명령어 와 객체 저장
			}catch(Exception e) {
				throw new ServletException(e);
			}
		}
	}//초기화 init()메소드 --properties파일로부터 명령어와 클래스명을 읽어서 commandMap에 저장.
	
	//사용자의 요청(request) 을 분석하여 해당 서비스로 분기 처리
		public void requestPro(HttpServletRequest request, 
	            HttpServletResponse response)
	            		throws ServletException, IOException {
			String view =null;//이동할 뷰
			CommandProcess com=null;//명령어에 해당하는 객체 인터페이스
			try {
					 String command = request.getRequestURI();
					 command = command.substring(request.getContextPath().length()+1);
					 com = (CommandProcess) commandMap.get(command);
				     
					 view = com.requestPro(request, response);//명령어에 해당하는 객체의 메소드 호출 후,이동할 경로 얻음
			}catch(Throwable e) {
				throw new ServletException(e);
			}
			//view에 해당하는 경로로 이동
			RequestDispatcher dispatcher =
					 request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}//requestPro()메소드 끝.


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
