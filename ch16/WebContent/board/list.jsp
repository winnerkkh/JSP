<%@page import="dao.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@ include file="color.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<title>게시글 list 화면</title>
</head>
<%
	 /* 페이징 설정 */
	int pageSize = 10;
    String pageNum = request.getParameter("pageNum");
    /* 파라미터로 넘어온 페이지번호값이 없으면 무조건 1 page로 설정 */
    if(pageNum ==null||pageNum.equals(""))
    	  pageNum = "1";
    int currentPage = Integer.parseInt(pageNum);//페이지를 숫자로 변환
    /* 현재페이지의 시작 번호 */
    int startRow = (currentPage -1)*pageSize +1;
    /* 현재페이지의 마지막 번호 */
    int endRow = currentPage * pageSize;
    /* 글번호와 글 순서 초기화  */
    int count = 0;
    int number = 0;
    
    /* 게시글 출력용 list 생성 */
    List<Board> boardList = null;
    BoardDao dao =BoardDao.getInstance();/* 싱글톤 객체 Dao 호출 */
     count = dao.getBoardCount();
     if(count>0){
    	 boardList = dao.getBoards(startRow,endRow);/* 시작번호, 마지막 번호 */
    	 System.out.println("boardList=?"+boardList.toString());
    	 number = count - (currentPage -1)*pageSize;
     } 
%>
<body bgcolor="<%=bodyback_c%>"><!-- body 시작  -->
     <h2>글목록(전체 글:<%=count%>)</h2>
     <table width="700" align="center">
     <tr align="right" bgcolor="<%=value_c%>">
     <td><a href="writerForm.jsp">글쓰기</a></td>
     </tr>
     </table>
<%
	if(count==0){%>
	<table width="700" align="center">
	<tr><td><h2>게시판에 저장된 글이 없습니다.</h2>
	</td></tr></table>
<% }else{%><!--  글 리스트 테이블 시작 -->
    <table border="1" width="700" align="center">
    	<tr height="30" bgcolor="<%=value_c1%>">
    	<th>번호</th><th>제목</th><th>작성자</th>
    	<th>작성일</th><th>조회</th><th>ip</th></tr>
    <%
    	for(int i=0;i<boardList.size();i++){
    		Board board = (Board)boardList.get(i);
      %>
        <tr height="30">
        <td><%=number-- %></td>
        <td width="250" class="left">
        <%
        	int wid =0;
        if(board.getRe_level()>0){
        	wid =10*(board.getRe_level());/* 답변인 경우 한칸씩 뒤로  */
        %>
        <img src="/ch16/images/level.gif" width="<%=wid%>" height="16">
        <img src="/ch16/images/re.gif">
        <%      
        }else{
        %>
        <img src = "/ch16/images/level.gif" width="<%=wid%>" height="16">
       <%}%><!-- if()else끝. -->
   <a href ="content.jsp?num=<%=board.getNum()%>&pageNum=<%=currentPage%>">
   		<%=board.getSubject() %>
   </a>
   <% if(board.getReadcount()>=20){ %>
     <img src="/ch16/images/hot.gif"  boarder="0" height="16"><%} %></td><!--제목 끝  -->
     <td><a href="mailto:<%=board.getEmail() %>"><%=board.getWriter() %></a></td><!--작성자  -->
     <td><%=board.getReg_date() %></td><!--  작성일-->
     <td><%=board.getReadcount() %></td><!-- 읽은 횟수  -->
     <td><%=board.getIp() %></td></tr><!-- ip주소 -->
    <%} %><!--if{} 끝  -->	
	</table>
	<%} %><!-- 글 리스트 테이블 끝  -->
	<!--  페이징 네비게이션 시작-->
	<%
		if(count>0){
			int pageCount = count/pageSize     /* 전체 건수 /페이지 크기 결과는 정수 페이지 수 */ 
					                + (count%pageSize==0?0:1);/* 나머지가 있으면 한 페이지를 추가 */
			int startPage = (int)((currentPage-1)/10)*10+1;	//현재페이지의 시작번호
			int pageBlock = 10;//한 화면에 보여지는 페이 수 단위
			int endPage = startPage + pageBlock -1;//한  화면에 보여지는 페이지 끝 번호
			if(endPage > pageCount) endPage = pageCount;
			                      /* 끝페이지가 전체 페이지를 넘지못하게 처리  */
			
			if(startPage > 10){ %>
			<a href="list.jsp?pageNum=<%=startPage - 10 %>">
			<img src="../images/prec.gif">
			[이전]</a>
			<%
			}
			for(int i=startPage;i<=endPage;i++){%>
				<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a><%
			}
			if(endPage < pageCount){%>
			<a href="list.jsp?pageNum=<%=startPage+10 %>">[다음]
			<img src="../images/next.gif"></a><%
			}
		}
				%>
</body>
</html>