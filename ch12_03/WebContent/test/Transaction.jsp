<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
Connection  conn = null;
String sql = "insert into student(num,name) values(12,'홍길동')";
String sql2 = "select * from student where num=11";
try{
	   Context init = new InitialContext();
	   DataSource ds 
	       = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
	   conn = ds.getConnection();
	   //자동 커밋 설정 해제
	   conn.setAutoCommit(false);//-----
	   PreparedStatement pstmt = 
	    		conn.prepareStatement(sql,
	    				              ResultSet.TYPE_SCROLL_SENSITIVE,
	    				              ResultSet.CONCUR_UPDATABLE);
	   //insert처리 
	   pstmt.executeUpdate();
	   //insert 쿼리객체 해제
	   pstmt.close();
	   //select쿼리 생성 및 실행
	   pstmt = conn.prepareStatement(sql2);
	  ResultSet rs = pstmt.executeQuery();
	  if(!rs.next()){
		  //입력 처리한 결과 가 없으면 rollback;
		  conn.rollback(); //---------------
		  out.print("<h3>데이타 삽입에 문제가 발생하였습니다.</h3>");
	  }else{
		  //입력처리한 결과가 있으면 commit;
		  conn.commit();//----------------
		  out.print("<h3>데이타 삽입이 완료되었습니다.</h3>");
	  }
		  pstmt.close();
		  conn.setAutoCommit(true);//----------
}catch(Exception e){
	out.print(e.getMessage());
}

%>