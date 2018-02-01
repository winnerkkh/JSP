<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
		BoardDao dao = BoardDao.getInstance();
        Board board = new Board();
        for(int i=0;i<512;i++){
        	board.setWriter("홍길동"+i);
        	board.setSubject("제목"+i);
        	board.setContent("글 내용"+i);
        	board.setEmail("hong"+i+"@daum.net");
        	board.setPassword("1111");
        	board.setNum(0);/* 생성시 글번호를 0번으로 넘김 */
        	board.setIp("127.0.0.1");
        	dao.insert(board);
        }
%>
작업완료
</body>
</html>