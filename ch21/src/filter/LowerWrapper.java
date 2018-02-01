package filter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class LowerWrapper extends HttpServletResponseWrapper {
	//필드생성
	HttpServletResponse response;
	public LowerWrapper(HttpServletResponse response) {
		super(response);
		this.response=response;
	}

	public void addCookie(Cookie cookie){
		String name = cookie.getName();
		String value = cookie.getValue();
		String nVal = value.toLowerCase();
		cookie.setValue(nVal);
		response.addCookie(cookie);
	}
}
