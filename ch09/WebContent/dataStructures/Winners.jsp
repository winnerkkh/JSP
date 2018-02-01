<%@ page contentType="text/html; charset=UTF-8" %>
<%
   request.setCharacterEncoding("utf-8");
    /* String타입의 배열 생성 및 접근 */
	String Winners[] = new String[3];
    Winners[0] = request.getParameter("win1");
    Winners[1] = request.getParameter("win2");
    Winners[2] = request.getParameter("win3");
    
    /* request객체에 속성으로 객체 저장 */ 
    request.setAttribute("winners", Winners);
    /* 페이지 이동 */ 
    RequestDispatcher dispatcher 
       = request.getRequestDispatcher("WinnersView.jsp");
     dispatcher.forward(request, response);
%>