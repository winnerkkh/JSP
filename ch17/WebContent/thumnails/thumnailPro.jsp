<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//파일 저장 경로
	String imagePath = getServletContext().getRealPath("/fileSave");

	//파일 제한 사이즈
	int size = 2 * 1024 * 1024;
	String filename = "";

	try {
		MultipartRequest multi = new MultipartRequest(request, //request 객체
				imagePath, // 저장 경로
				size, //파일 사이즈
				"utf-8", //문자셋
				new DefaultFileRenamePolicy()//중복파일명 처리방식
		);

		Enumeration files = multi.getFileNames();
		String file = (String) files.nextElement();
		filename = multi.getFilesystemName(file);
	} catch (Exception e) {
		e.printStackTrace();
	}

	//이미지 담기
	//이미지는 parameterBlock을 통행서 담음
	//이미지 저장용 객체 생성
	ParameterBlock pb = new ParameterBlock();

	//서버에 저장된 원본파일의 경로추가
	pb.add(imagePath + "/" + filename);

	//파라미터 블록 로드하여 RenderOp(이미지 생성객체)에 삽입
	RenderedOp rOp = JAI.create("fileload", pb);

	//블러온 이미지를 Buffer에 저장
	BufferedImage bi = rOp.getAsBufferedImage();

	//thumb 이미지 버퍼 생성, 사이즈 지정 100*100
	BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);

	//그래픽 이미지 생성
	Graphics2D g = thumb.createGraphics();//

	//버퍼사이즈 100*100을 조정
	g.drawImage(bi, 0, 0, 100, 100, null);

	//출력위치와 파일이름 설정, 저장타입은 jpg로 설정
	File file = new File(imagePath + "/sm_" + filename);
	//버퍼공간의 영역에 설정한 파일이미지 출력
	ImageIO.write(thumb, "jpg", file);
%>


<html>
<head>
<title></title>
</head>
<body>
	-원본 이미지-<br>
	<img src="../image/<%=filename%>"><p>
	-썸네일 이미지-<br> 
	<img src="../image/sm_<%=filename%>"><p>
	
</body>
</html>