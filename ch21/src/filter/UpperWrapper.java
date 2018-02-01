package filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class UpperWrapper extends HttpServletRequestWrapper{
	//생성자의 매개변수로 받은 request객체를 저장할 필드 변수 선언
	HttpServletRequest request;
	//HttpServletRequest를 매개변수로 받는 생성자
	public UpperWrapper(HttpServletRequest request) {
		super(request);
		this.request = request;
	}
	
	//문자열을 대문자로 변경하는 메소드
	public String getParameter(String name) {
		String value = request.getParameter(name);
		String nVal = value.toUpperCase();
		return nVal;
	}
	//문자열 배열을 대문자배열로 변경하는 메소드
	public String[]  getParameterValues(String name) {
		String[] value = request.getParameterValues(name);
		String[] nVal = new String[value.length];
		for(int i=0;i<nVal.length;i++) {
			   nVal[i] = value[i].toUpperCase()+" 변형";
		}
		return nVal;
	}
	

}
