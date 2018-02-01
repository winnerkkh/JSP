package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebFilter("/loginPro.do")
public class LoginFilter2 implements Filter {
    public LoginFilter2() {  }
	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest rq = (HttpServletRequest)request;
		HttpServletResponse rs = (HttpServletResponse)response;
	
             chain.doFilter(rq, rs);
    
	}
	public void init(FilterConfig fConfig) 
			throws ServletException {
	}

}
