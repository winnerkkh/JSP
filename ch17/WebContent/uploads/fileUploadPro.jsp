<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	//전송할 파일 정보 설정
	//전송할 파일의 최대 사이즈 
	int maxSize = 5*1024*1024; //5Mb로 설정
	
	//전송 경로
	String fileSave="/fileSave";
	
	//전송 경로에 대한 절대경로
	String realPath = getServletContext().getRealPath(fileSave);
	
    /* ------------------------------------------------------------- */
	MultipartRequest multi = new MultipartRequest(
				request, //전송할 request객체
				realPath, //전송할 경로
				maxSize, //한번에(파일 하나당) 전송되는 최대 사이즈
				"utf-8", //문자셋
				new DefaultFileRenamePolicy() //파일 중복처리 방식
			);
    /* ------------------------------------------------------------- */
    
	//작성자
	String user = multi.getParameter("user");
	
	//제목
	String title = multi.getParameter("title");
	
	//upload되는 파일명 설정
	String name = "uploadFileName";
	String fileName = multi.getFilesystemName(name); /* file은 multi.getParameter로 받을 수 없음. */
	
	//로컬영역의 원래 파일명
	String originalName = multi.getOriginalFileName(name);
	
	//전송될 파일의 내용 타입
	String type = multi.getContentType(name);
	
	//전송될 파일 속성인 file인 태그의 name속성값을 이용한 파일 객체 생성
	File file = multi.getFile(name);
	out.print("파라미터 이름: " + name + "<br>");
	out.print("실제 파일명: " + originalName + "<br>");
	out.print("저장된 파일명: " + fileName + "<br>");
	out.print("파일크기: " + file.length() + "<br>");
	out.print("파라타입: " + type + "<br>");
    out.print("작성자:"+user+"<br>");
    out.print("제목:"+title+"<br>");

%>