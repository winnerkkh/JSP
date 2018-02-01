package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Board;

public class BoardDao {
	private static BoardDao instance;
	private BoardDao() {}
	Connection conn=null;
	PreparedStatement pstmt=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	public static BoardDao getInstance() {
		if(instance==null) instance=new BoardDao();
		return instance;
	}
	 public Connection getConnection() {
		    try {
		    	   Context ctx = new InitialContext();
		    	    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OraDB");
		    	    conn=ds.getConnection();
		    }catch(Exception e) {
		    	System.out.println(e.getMessage());
		    }
		    return conn;
	 }//getConnection()메소드 끝.
	
	 //답변형 게시판 글 저장 메소드
	 public  int insert(Board board){
		 int result=0;
		 String sql1="select count(*)+1 from board2";//글번호 
		 String sql2="insert into board2(num,writer,subject,content,email,readcount,password,ref,re_step,re_level,ip,reg_date)"
		 		       + " values(?,?,?,?,?,0,?,?,?,?,?,sysdate)";//글입력
		 String sql3="update board2 set re_step=re_step+1 where ref=? and re_step > ? ";//답변글 update
		 int num = board.getNum();//파라미터로 넘어온 글 번호
		 int newNum=0;//새글 번호
		 try {
			 	 conn = getConnection();//DB연결맺기
			 	 pstmt = conn.prepareStatement(sql1);
			 	 rs = pstmt.executeQuery();
			 	 if(rs.next()) newNum=rs.getInt(1);//글번호 발번
			     pstmt.close();
			     //답변글인 경우
			     if(num!=0) {//파라미터로 넘어온 글번호 비교 답변인 경우 0이 아님
			    	 pstmt = conn.prepareStatement(sql3);
			    	 pstmt.setInt(1, board.getRef());//같은 답변글 그룹
			    	 pstmt.setInt(2, board.getRe_step());//입력할 답변글의 step
			    	 pstmt.executeUpdate();
			    	 pstmt.close();
			    	 board.setRe_level(board.getRe_level()+1);//부모글(읽은글)+1
			    	 board.setRe_step(board.getRe_step()+1);//부모글(읽은글)+1
			     }else if(num==0) {//파라미터로 넘어온 글번호 원글은 0
			    	 board.setRef(newNum);//신규 게시글인 경우 글번호와 ref번호가 동일
			     }
			     //나머지 값 처리
			     pstmt = conn.prepareStatement(sql2);
			     pstmt.setInt(1, newNum);//새글 번호
			     pstmt.setString(2, board.getWriter());
			     pstmt.setString(3, board.getSubject());
			     pstmt.setString(4, board.getContent());
			     pstmt.setString(5, board.getEmail());
			     pstmt.setString(6, board.getPassword());
			     pstmt.setInt(7, board.getRef());
			     pstmt.setInt(8, board.getRe_step());
			     pstmt.setInt(9, board.getRe_level());
			     pstmt.setString(10, board.getIp());
			     
			     result = pstmt.executeUpdate();
		 }catch(Exception e) {
			 System.out.println(e.getMessage());
		 }finally {
			 try {
				 if(rs!=null)rs.close();
				 if(pstmt!=null)pstmt.close();
				 if(conn!=null)conn.close();
			 }catch(Exception e) {
				 System.out.println(e.getMessage());
			 }
		 }//finally 끝.
		 return result;
	 }//insert()메소드 끝.
	 
	 //게시글 전체 건수
	 public int getTotal() {
			int total=0;
			Connection conn=null;
			ResultSet rs=null;
			PreparedStatement pstmt=null;
			try {
				conn=getConnection();
				pstmt=conn.prepareStatement("select count(*) from board2");
				rs = pstmt.executeQuery();
				rs.next();
				total = rs.getInt(1);
				System.out.println("total:"+total);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally{
				try{if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null) conn.close();
				}catch(Exception e) {
				}
			}
			return total;
		}//getTotal()메소드 끝.
	 
	 //페이지의 시작번호 와 끝번호로 게시글이 리스트 추출하는 메소드
	 public List<Board> selectList(int startRow,int endRow) {
		 List<Board> list = new ArrayList<>();
		 String sql = "select * from ( "
		 		        +" select rownum rn, a.* from "
		 		        +" (select * from board2 order by ref desc,re_step) a ) where rn between ? and ?";
		 try {
			     conn=getConnection();//DB연결 맺기
			     pstmt=conn.prepareStatement(sql);
			     pstmt.setInt(1, startRow);
			     pstmt.setInt(2, endRow);
			     rs = pstmt.executeQuery();
			     while(rs.next()) {
			    	 Board bd = new Board();
			    	 
			    	 	bd.setNum(rs.getInt("num"));
						bd.setContent(rs.getString("content"));
						bd.setEmail(rs.getString("email"));
						bd.setIp(rs.getString("ip"));
						bd.setPassword(rs.getString("password"));
						bd.setRe_level(rs.getInt("re_level"));
						bd.setRe_step(rs.getInt("re_step"));
						bd.setReadcount(rs.getInt("readcount"));
						bd.setRef(rs.getInt("ref"));
						bd.setReg_date(rs.getDate("reg_date"));
						bd.setSubject(rs.getString("subject"));
						bd.setWriter(rs.getString("writer"));
						bd.setDel(rs.getString("del"));
						
			    	 list.add(bd);
			     }
		 } catch (Exception e) {
				System.out.println(e.getMessage());
			} finally{
				try{if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null) conn.close();
				}catch(Exception e) {
				}
			}//finally 끝.
		 return list;
		}// selectList()메소드 끝.
	 
	 
	//조회수 증가 메소드
		public void updateReadCount(int num) {
			Connection conn=null;
			PreparedStatement pstmt = null;
			String sql = "update board2 set readcount = readcount +1 where num = ?";
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
		}//updateReadCount() 메소드 끝.
		
	 
		//게시글 내용 조회 메소드
		public Board getBoard(int num){
			Board board = new Board();
			Connection conn=null;
			PreparedStatement pstmt =null;
			ResultSet rs = null;
			String sql = "select * from board2 where num=?";
			try {
					updateReadCount(num);//조회수 증가
					
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
		}//getBoard() 메소드 끝.

	public int useCheck(int num, String password) {
		int result = -1;// 패스워드가 맞지않으면 -1
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select password from board2 where num=?";
		try {
			conn = getConnection();// DB연결맺기
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next())
				if (rs.getString(1).equals(password))
					result = 1;// 패스워드가 맞으면 1
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		} // finally끝.
		return result;
	}// useCheck()메소드 끝.
	 
	public int updateBoard(Board board) {
		int result = 0;
		String sql = "update board2 set subject =?, email=?, content=? where num=?";
		try {
			    conn=getConnection();//DB 연결맺기
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
	 
	 //게시글 삭제 메소드
	 /* 게시글 삭제시 삭제 trigger실행되어 board_history테이블에 저장됨 */
		public int deleteBoard(int num) {
			int result=0;
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			String sql = "delete from board2 where num =?";
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
	 
}




