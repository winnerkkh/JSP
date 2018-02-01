package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//@WebFilter("/LogFilter")
public class LogFilter implements Filter {
	PrintWriter writer=null;
	
    public LogFilter() {   }

	public void destroy() {
		writer.close();
		System.out.println("LogFilter종료");	
		}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
			writer.println("웹 컴포넌트가 시작되었습니다.");
			writer.flush();
			GregorianCalendar now = new GregorianCalendar();
			writer.printf("현재일시:%TF %TT %n",now,now);
			String ClientAddress = request.getRemoteAddr();
			writer.printf("요청클라이언트 주소:%s %n",ClientAddress);
			chain.doFilter(request, response);
			
			String contentType = response.getContentType();
			writer.printf("문서의 타입: %s %n",contentType);
			writer.println("---------------------------------------------------");

			writer.println("웹 컴포넌트가 완료 되었습니다.");
	        writer.flush();
	}

	public void init(FilterConfig fConfig) throws ServletException {
		String filename = fConfig.getInitParameter("FILE_NAME");
		System.out.println("filename="+filename);
		if(filename==null)
			throw new ServletException("로그파일을 찾을 수 없습니다.");
		  try {
			     writer = new PrintWriter(new FileWriter(filename,true),true);
		  }catch(IOException e) {
			  throw new ServletException("로그파일을 열수 없습니다.");
		  }
		System.out.println("LogFilter 초기화");
	}

}
