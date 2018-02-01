<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- forward 사용시 request객체에 속성으로 값을 저장하여 이동
	 setAttribute(name,값);
	 -> getAttribute(name);
 -->    
<%
	Calendar cal = Calendar.getInstance();
	request.setAttribute("time", cal);/* time이라는 이름으로 cal객체를 속성으로 저장 */
%>
<jsp:forward page="/to/viewTime.jsp"/>