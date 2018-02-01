<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int sum=0;
   for(int i=1;i<=100;i++)
	    sum+=i;
   request.setAttribute("result", sum);
   RequestDispatcher dispatcher 
             = request.getRequestDispatcher("HundredResult2.jsp");;
/*              = request.getRequestDispatcher("HundredResult.jsp");; */
   dispatcher.forward(request, response);
%>