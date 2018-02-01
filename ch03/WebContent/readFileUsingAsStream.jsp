<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체 사용하여 자원 읽기(getResourceAsStream)</title>
</head>
<body>
<%-- <%
	String resourcePath = "/message/notice.txt";
%>
 --%>


<%
	//web.xml에 초기 파라미터로 설정
	//읽어서 resourePath에 리턴
	String resourcePath = application.getInitParameter("resourcePath");

%>




자원의 실제경로:<br>
<%=application.getRealPath(resourcePath) %>
<!-- getRealPath(상대경로)=>절대경로 리턴 -->
<br>
---------------------<br>
<%=resourcePath %> 의 내용<br>

<%
	char[] buff = new char[128];
	int len = -1;
			
	try{
		InputStreamReader reader = new InputStreamReader(application.getResourceAsStream(resourcePath), "UTF-8");
		
		while(true){
			len = reader.read(buff);
			if(len == -1){
				break;
			}
			
			out.print(new String(buff,0,len));
		}
		
		
	}catch(IOException e){
		pageContext.getOut().print("예외 발생: " + e.getMessage());
	}

%>


</body>
</html>