<%@page import="util.CookieBox"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	CookieBox cookieBox = new CookieBox(request);
    out.print("쿠키 값:"+cookieBox.getValue("name"));
%>