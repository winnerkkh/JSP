<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	/* ArrayList객체 생성 */
	ArrayList<String> items = new ArrayList<String>();
	items.add(request.getParameter("f1"));
	items.add(request.getParameter("f2"));
	items.add(request.getParameter("f3"));

	/* request에 객체 저장  */
	request.setAttribute("fruits", items);
	/* 페이지 이동 */
	RequestDispatcher dispatcher = request.getRequestDispatcher("FruitsView.jsp");
	dispatcher.forward(request, response);
%>