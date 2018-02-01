package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import model.Board;
import model.FavorBean;
//BoardDao Singleton
public class BoardDao {
	private static BoardDao instance;
	private BoardDao() {}
	public static BoardDao getInstance() {
		if(instance==null) instance = new BoardDao();
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			 Context init = new InitialContext();
			 DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
			 conn = ds.getConnection();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}//getConnecton()메소드 끝.

	public int  getBoardCount() {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from board";
		int count = 0;//전체 게시글의 건수
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				 count = rs.getInt(1);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return count;
	}// getBoardCount() 메소드 끝.
	
	public List<Board> getBoards(int startRow,int endRow){
		System.out.println("X");
		List<Board> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select *  from "
				      + " (select rownum rn, a.* from "
				      + " (select * from board order by ref desc,re_step asc) a) "
				      + " where rn between ? and ?";
		try {
			    conn = getConnection();//connection()
			    pstmt = conn.prepareStatement(sql);
				System.out.println("conn?="+conn);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				System.out.println("startRow="+startRow);
				System.out.println("endRow="+endRow);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					  Board board = new Board();
					  
					  int i = 1;
					  
					  board.setNum(rs.getInt(++i));
					  board.setWriter(rs.getString(++i));
					  board.setSubject(rs.getString(++i));
					  board.setContent(rs.getString(++i));
					  board.setEmail(rs.getString(++i));
					  board.setReadcount(rs.getInt(++i));
					  board.setPassword(rs.getString(++i));
					  board.setRef(rs.getInt(++i));
					  board.setRe_step(rs.getInt(++i));
					  board.setRe_level(rs.getInt(++i));
					  board.setIp(rs.getString(++i));
					  board.setReg_date(rs.getDate(++i));

					  list.add(board);
				}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
			}
		}//finally끝.
		return list;
	}//getBoards() 메소드 끝.
	
	public int insert(Board board) {
		 int result=0;
		 int number = 0;//글 번호 
		 Connection conn=null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 String sql1 = "select max(num) from board";//현재 글의 마지막 번호 출력
		 String sql2 = "insert into "
		 		          + " board(num,writer,subject,content,email,readcount,password, "
		 		          + " ref,re_step,re_level,ip,reg_date) "
		 		          + " values(?,?,?,?,?,0,?,?,?,?,?,sysdate)";
		  String sql3="update board set re_step=re_step+1 "
		  		        + " where ref=? and re_step > ? ";//읽은 글의 re_step보다 큰것들만 +1
		  int num = board.getNum();
		 try {
			     conn = getConnection();//DBConnection
			     pstmt = conn.prepareStatement(sql1);
			     rs = pstmt.executeQuery();
			     
			     if(rs.next()) number = rs.getInt(1);//현재 글번호 중 마지막 번호
			      number +=1;//새로운 글번호
			      pstmt.close();
			      
			      //답변글
			      if(num!=0) {//답별글 입력
			    	  pstmt = conn.prepareStatement(sql3);
			    	  pstmt.setInt(1, board.getRef());
			    	  pstmt.setInt(2, board.getRe_step());
			    	  pstmt.executeUpdate();
			    	  pstmt.close();
			    	  board.setRe_level(board.getRe_level()+1);//부모(읽은 글)+1
			    	  board.setRe_step(board.getRe_step()+1);//부모(읽은 글)+1
			    	  
			      }else  if(num==0) {//답변글이 아님
			    	  board.setRef(number);
			      }
			      //원글 입력
			      pstmt = conn.prepareStatement(sql2);
			      int i=0;
			      pstmt.setInt(++i, number);//새로운 글번호 입력
			      pstmt.setString(++i, board.getWriter());
			      pstmt.setString(++i, board.getSubject());
			      pstmt.setString(++i, board.getContent());
			      pstmt.setString(++i, board.getEmail());
			      pstmt.setString(++i,board.getPassword());
			      pstmt.setInt(++i, board.getRef());
			      pstmt.setInt(++i, board.getRe_step());
			      pstmt.setInt(++i, board.getRe_level());
			      pstmt.setString(++i, board.getIp());       
			     
			       result = pstmt.executeUpdate();
		 }catch(Exception e) {
			 System.out.println(e.getMessage());
		 }finally {
			 try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {
		 } 
	   }//finally 끝.
		 return result;
	 }//insert()메소드 끝.
	
	//게시글 내용 조회 메소드
	public Board getBoard(int num){
		Board board = new Board();
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = "select * from board where num=?";
		try {
				updateCount(num);//조회수 증가
				
			    conn=getConnection();//DB connection 맺기
			   pstmt=conn.prepareStatement(sql);
			   pstmt.setInt(1, num);
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   int i=0;
				   board.setNum(rs.getInt(++i));
				   board.setWriter(rs.getString(++i));
				   board.setSubject(rs.getString(++i));
				   board.setContent(rs.getString(++i));
				   board.setEmail(rs.getString(++i));
				   board.setReadcount(rs.getInt(++i));
				   board.setPassword(rs.getString(++i));
				   board.setRef(rs.getInt(++i));
				   board.setRe_step(rs.getInt(++i));
				   board.setRe_level(rs.getInt(++i));
				   board.setIp(rs.getString(++i));
				   board.setReg_date(rs.getDate(++i));
			   }
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return board;
	}
	
	//조회수 증가 메소드
	public void updateCount(int num) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql = "update board set readcount = readcount +1 where num = ?";
		try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {	}
		}
	}//updateCount() 메소드 끝.
	
	public  int useCheck(int num,String password){
		int result = -1;//패스워드가 맞지않으면 -1
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select password from board where num=?";
		try {
			   conn = getConnection();//DB연결맺기
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, num);
			   rs = pstmt.executeQuery();
			   if(rs.next()) 
				   if(rs.getString(1).equals(password)) result = 1;//패스워드가 맞으면 1
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}//finally끝.
		
		return result;
	}//useCheck()메소드 끝.
	
	public int updateBoard(Board board) {
		int result = 0;
		Connection conn=getConnection();//DB 연결맺기
		PreparedStatement pstmt = null;
		String sql = "update board set subject =?, email=?, content=? where num=?";
		try {
				pstmt = conn.prepareStatement(sql);//쿼리 객체 생성
				//변수 바인딩
				pstmt.setString(1, board.getSubject());
				pstmt.setString(2, board.getEmail());
				pstmt.setString(3, board.getContent());
				pstmt.setInt(4, board.getNum());
				//update처리
				result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {	
			}
		}//finally 끝.
		return result;
	}//updateBoard() 메소드 끝.
	
	//댓글 존재여부 확인 메소드
	public  boolean isReply(int num){
    	boolean isRef=false;
    	Connection conn = getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = "select count(*) from board where ref=? and num!=? ";
    	try {
    		 pstmt = conn.prepareStatement(sql);
    	    
    		 pstmt.setInt(1, num);
    		 pstmt.setInt(2, num);
    		 
    		 rs = pstmt.executeQuery();
    		 if(rs.next()) {
    			 if(rs.getInt(1)>0) isRef=true;//댓글이 존재함.
    		 }
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    	}finally {
    	   	try {
    	   		if(rs!=null) rs.close();
    	   		if(pstmt!=null)pstmt.close();
    	   		if(conn!=null)conn.close();
    	   	}catch(Exception e) {    	   		
    	   	}
    	}//finally끝.
    	return isRef;
    }//isReply()메소드 끝.
	
	//게시글 삭제 메소드
	/* 게시글 삭제시 삭제 trigger실행되어 board_history테이블에 저장됨 */
	public int deleteBoard(int num) {
		int result=0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from board where num =?";
		try {
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setInt(1, num);
			  result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {				
			}
		}//finally 끝.
		return result;
	}//deleteBoard()메소드 끝.
	
	//좋아요 싫어요 데이타 입력/수정
	public int updateFavor(int num) {
		int result =0;
		Connection conn = getConnection();//DBconnection 맺기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select count(*) from favor where num =?";//데이타 존재여부 확인
		String sql2 = "insert into favor(num,favorcnt,hatecnt) values(?,1,0)";//좋아요/싫어요 테이블에 데이타 없을 시
		String sql3 = "update favor set favorcnt = favorcnt+1 where num = ? ";//데이타가 있으면 update
		try {
				pstmt = conn.prepareStatement(sql1);//데이타 존재여부 확인 쿼리 문 생성
			    pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
			    if(rs.next()) {
			    	if(rs.getInt(1)>0) {
			    		 pstmt = conn.prepareStatement(sql3);//update
			    		 pstmt.setInt(1, num);
			    		 result = pstmt.executeUpdate();
			    	}else {
			    		pstmt = conn.prepareStatement(sql2);//insert
			    		pstmt.setInt(1, num);
			    		result = pstmt.executeUpdate();
			    	}
			    }
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
			}
		}//finally 끝
		return result;
	}
	
	//좋아요/싫어요 내용 조회 메소드
	public FavorBean getFavor(int num) {
		FavorBean fb = new FavorBean();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select nvl(num,?) num, nvl(favorcnt,0) favorcnt, nvl(hatecnt,0) hatecnt "
				      + " from favor where num=?";
		try {
			   pstmt = conn.prepareStatement(sql);
			  
			   pstmt.setInt(1, num);
			   pstmt.setInt(2, num);
			   
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   fb.setNum(rs.getInt(1));
				   fb.setFavorcnt(rs.getInt(2));
				   fb.setHatecnt(rs.getInt(3));
			   }
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
			}
		}//finally끝		
		return fb;
	}//getFavor() 메소드 끝.
	
	//좋아요 싫어요 데이타 입력/수정
	public int updateHate(int num){
			int result =0;
			Connection conn = getConnection();//DBconnection 맺기
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql1 = "select count(*) from favor where num =?";//데이타 존재여부 확인
			String sql2 = "insert into favor(num,favorcnt,hatecnt) values(?,0,1)";//좋아요/싫어요 테이블에 데이타 없을 시
			String sql3 = "update favor set hatecnt = hatecnt+1 where num = ? ";//데이타가 있으면 update
			try {
					pstmt = conn.prepareStatement(sql1);//데이타 존재여부 확인 쿼리 문 생성
				    pstmt.setInt(1, num);
					rs = pstmt.executeQuery();
				    if(rs.next()) {
				    	if(rs.getInt(1)>0) {
				    		 pstmt = conn.prepareStatement(sql3);//update
				    		 pstmt.setInt(1, num);
				    		 result = pstmt.executeUpdate();
				    	}else {
				    		pstmt = conn.prepareStatement(sql2);//insert
				    		pstmt.setInt(1, num);
				    		result = pstmt.executeUpdate();
				    	}
				    }
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null) pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {
				}
			}//finally 끝
			return result;	
	}
}











