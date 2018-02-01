<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html><head><title>Insert title here</title>
</head><body>
<%
	request.setCharacterEncoding("utf-8");
	HashMap<String,String> map = new HashMap<>();
	
	/* map.put("park","목동");
	map.put("Jesica","크라이스트 처치");
	map.put("Susan","시드니"); */
	
	/* map.put(request.getParameter("k1"),request.getParameter("v1"));
	map.put(request.getParameter("k2"),request.getParameter("v2"));
	map.put(request.getParameter("k3"),request.getParameter("v3")); */
	
	 String val1 = request.getParameter("value1");
	 int pos = val1.indexOf(".");
	 
	 String temp1 = val1.substring(0, pos);/* 0<= 범위 <pos  */
     String temp2 = val1.substring(pos+1);
	 
	 map.put(temp1,temp2);
	  val1 = request.getParameter("value2");
	  pos = val1.indexOf(".");
	  temp1 = val1.substring(0, pos);/* 0<= 범위 <pos  */
      temp2 = val1.substring(pos+1);
      map.put(temp1,temp2);
      
      val1 = request.getParameter("value3");
	  pos = val1.indexOf(".");
	  temp1 = val1.substring(0, pos);/* 0<= 범위 <pos  */
      temp2 = val1.substring(pos+1);
      map.put(temp1,temp2);
      
	//request에 객체 저장
	request.setAttribute("address", map);
	
	//경로 설정
	RequestDispatcher dispatcher
	  = request.getRequestDispatcher("mapView.jsp?name="+temp1);
	dispatcher.forward(request, response);
%>

</body>
</html>