<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%><!-- 지시자 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 내용 읽기</title>
</head>
<body>
	<%
		/* 스크립틀릿 */
		BufferedReader reader = null;
		try {
			//입력파일의 절대경로 
			String filePath = application.getRealPath("/WEB-INF/input.txt");
			reader = new BufferedReader(new FileReader(filePath));
			while (true) {
				String str = reader.readLine();/*한줄 단위로 입력받는 메소드 '\r\n' */
				if (str == null)/* String의 값이 없으면...  */
					break;
				out.print(str + "<br>");
			}
		} catch (FileNotFoundException fnfe) {
			out.print("파일이 존재하지 않습니다.");
		} catch (IOException ioe) {
			out.print("파일을 읽을수 없습니다.");
		} finally {
			try {
				//자원해제
				reader.close();
			} catch (Exception e) {
				out.print("오류");
			}
		}
	%>
</body>
</html>