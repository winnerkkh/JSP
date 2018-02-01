package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;

@WebFilter("/sub1/*")
public class SecondFilter implements Filter{
	@Override
	public void destroy() {
		System.out.println("Filter 종료");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	        System.out.println("두번째 필터 작동전");
	        chain.doFilter(request, response);
	        System.out.println("두번째 필터 작동 후");
	}
	 
	@Override
	public void init(FilterConfig config) throws ServletException {	
		System.out.println("두번째 Filter 초기화");
	}

}
