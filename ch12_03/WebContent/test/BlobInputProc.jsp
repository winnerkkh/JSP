<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%
Connection  conn = null;
String sql = "insert into testblob(id,pwd,name,photo) values(?,?,?,?)";
try{
	   Context init = new InitialContext();
	   DataSource ds 
	       = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
	   conn = ds.getConnection();
	   //자동 커밋 설정 해제
	   conn.setAutoCommit(false);//-----
	   File file = new File("C:/images/Desert.jpg");
	   InputStream is = new FileInputStream(file);
	   int fileSize= (int)file.length();
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, "aa");
	   pstmt.setString(2,"1234");
	   pstmt.setString(3,"사막");
	   //이미지 파일 셋팅
	   pstmt.setBinaryStream(4, is, fileSize);
	    
	   int  result = pstmt.executeUpdate();
	   if(result>0)
	     conn.commit();
	   else
		 conn.rollback();
	   is.close();
	   pstmt.close();
	   conn.setAutoCommit(true);//-----
	   conn.close();
	   out.print("입력 처리 완료");
	  
}catch(Exception e){
	out.print(e.getMessage());
}
%>