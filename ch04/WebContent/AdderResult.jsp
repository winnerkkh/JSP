<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title></title></head>
<body>
<%  //넘어온 파라미터의 문자셋 설정
	request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    try{
    	int num = Integer.parseInt(request.getParameter("num1"));
    	int num2 = Integer.parseInt(request.getParameter("num2"));
    	out.print(num + num2);
    }catch(Exception e){
    	//out.print("오류 발생"+e.getMessage());
     out.print("<script>");
     out.print("alert('숫자가 아닙니다.');");
     out.print("history.back();");
     out.print("</script>");
    }
%>
</body>
</html>