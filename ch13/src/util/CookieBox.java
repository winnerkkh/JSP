package util;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {
	private Map<String, Cookie> cookieMap= 
			  new HashMap<String, Cookie>();
	public CookieBox(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			for(int i=0;i<cookies.length;i++) {
				cookieMap.put(cookies[i].getName(),cookies[i]);
			}
		}
	}//생성자 끝.
	public static Cookie createCookie(String name,String value)
			               throws IOException{
		return new Cookie(name,value);
	}
	public static Cookie createCookie(String name,String value,int maxAge)
			throws IOException{
		Cookie cookie = new Cookie(name,value);
		cookie.setMaxAge(maxAge);
		
		return cookie;
		
	}
	public static Cookie createCookie(String name,String value,String domain,int maxAge)
			throws IOException{
		Cookie cookie = new Cookie(name,value);
		cookie.setMaxAge(maxAge);
		cookie.setDomain(domain);
		return cookie;
	}
	
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}
	
	public String getValue(String name) throws IOException{
		Cookie cookie = cookieMap.get(name);
		if(cookie==null) {
			return null;
		}
		return cookie.getValue();
	}
	
	public boolean exists(String name) {
		return cookieMap.get(name)!=null;
	}
}

