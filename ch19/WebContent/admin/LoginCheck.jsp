<%@ page  contentType="text/html; charset=UTF-8" %>
<%
	 request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    if(!(id==null || id.equals(""))){//id가 정상일 경우
    	if(password!=null){
    		  if(password.equals("1234")){
    			  request.setAttribute("id", id);
    			  request.setAttribute("password", password);
    			  RequestDispatcher rd = request.getRequestDispatcher("admin_menu.jsp");    
    		      rd.forward(request, response);
    		  } else{
    	        	RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
    	        	rd.forward(request, response);
    	        }
    	}
    }else if(id==null|| id.equals("")){//id가 비정상인 경우
    	  request.setAttribute("id", id);
		  RequestDispatcher rd = request.getRequestDispatcher("error2.jsp");    
	      rd.forward(request, response);
    }
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>