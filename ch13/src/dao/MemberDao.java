package dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import model.Member1;

public class MemberDao {
	 private Connection getConnection() {
		 Connection conn = null;
		 DataSource ds=null;
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
			conn=ds.getConnection();	
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	 }//getConnection()메소드 끝.
	 //회원가입 메소드
	public int insertMember(Member1 member){
		int result = 0;
		Connection conn = getConnection();
		String sql = "insert into member1 values(?,?,?,sysdate)";
		try {
		     PreparedStatement pstmt = conn.prepareStatement(sql);
		     pstmt.setString(1, member.getId());
		     pstmt.setString(2, member.getPassword());
		     pstmt.setString(3, member.getName());
		     		     
		     result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(conn!=null) conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;//인서트 결과 리턴
	 }
	
	//회원체크 메소드
	public int userCheck(String id,String password){
		int result=2;//정상1, 패스워드 이상0, 아이디 없을 때 2
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql = "select password from member1 where id=?";
		try {
			conn = getConnection();//연결
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbpass = rs.getString(1);
				if(password.equals(dbpass))
					result = 1;//정상1
				else
					result = 0;//패스워드 이상0
			}else
				result = 2;//아이디 없을 때 2
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}
