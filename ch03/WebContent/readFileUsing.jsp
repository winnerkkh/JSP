<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본객체 사용하여 자원읽기 (경로 getResource)</title>
</head>
<body>
	<%
		String resourcePath = "/message/showmethemoney.txt";//URI(상대)경로로 읽어옴
		char[] buff = new char[128];/* 길이가128인 char배열 */
		int len = -1;//입력값이 없으면 -1
		URL url = application.getResource(resourcePath);
		          /* 리소스(파일)의 경로를 url형태로 리턴 */
		try{
			InputStreamReader br 
			          = new InputStreamReader(url.openStream(),"UTF-8");
			/* read(배열) : 배열길이만큼 읽으면 길이리턴, 일부만 읽으면 일부길이 리턴, 
			                    입력값이 없으면 -1을 리턴
			*/                    
			while((len=br.read(buff)) !=-1){
				out.print(new String(buff,0,len));//데이타 길이가 500 -> 128 3번 반복, 길이 16
			}
		}catch(IOException ex){
			out.print("예외발생:"+ex.getMessage());
		}
	%>
</body>
</html>