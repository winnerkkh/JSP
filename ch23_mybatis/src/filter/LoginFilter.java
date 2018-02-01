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

//@WebFilter("*.do")
public class LoginFilter implements Filter {
    public LoginFilter() {  }
	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest rq = (HttpServletRequest)request;
		HttpServletResponse rs = (HttpServletResponse)response;
		HttpSession session = rq.getSession();
		boolean login=false;
		
            	 if( rq.getAttribute("id")==null) {
            		  System.out.println("request is is Null");
            		 login = false;
            	 }else {
            		 System.out.println("request is Not Null");
            		 login=true;
            	 }
    
        if (login) {
        	System.out.println("X");
        	 RequestDispatcher dispatcher = rq
                     .getRequestDispatcher("/list.do");
             dispatcher.forward(rq, rs);
             chain.doFilter(rq, rs);
             return;
        } else {
        	System.out.println("Y");
            RequestDispatcher dispatcher = rq
                    .getRequestDispatcher("/loginForm.do");
            dispatcher.forward(rq, rs);
        }

	}
	public void init(FilterConfig fConfig) 
			throws ServletException {
	}

}
