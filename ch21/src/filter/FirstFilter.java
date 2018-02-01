package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//@WebFilter("/hello2.jsp")
public class FirstFilter implements Filter {
    public FirstFilter() { }

	public void destroy() {

	}
	public void doFilter(ServletRequest request, ServletResponse response, 
			                       FilterChain chain) throws IOException, ServletException {
		 System.out.print("아직 웹 작동 전");
		chain.doFilter(request, response);
		 System.out.print("웹 작동 종료");
	}


	public void init(FilterConfig fConfig) throws ServletException {

	}

}
