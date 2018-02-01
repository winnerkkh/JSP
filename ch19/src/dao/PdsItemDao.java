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

import dto.PdsItem;

//싱글톤
public class PdsItemDao {	
	private static PdsItemDao instance;
	private PdsItemDao() {}
	
	private Connection conn=null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	public static PdsItemDao getInstance() {
		if(instance==null) instance=new PdsItemDao();
 		return instance;
	}
	public Connection getConnection() {
		Context ctx;
		try{
			    ctx = new InitialContext();
			    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OraDB");
			    conn = ds.getConnection();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int  insert(PdsItem pdsItem){
		int result = 0;
		String idSql="select nvl(max(id),0) +1 from pdsItem ";//집계함수는 null값이 없음.
		String sql ="insert into pdsItem(id,filename,filesize,description) values(?,?,?,?)";
		try {
			    //파일 업로드 번호 자동발번처리
	             conn =getConnection();
	             pstmt = conn.prepareStatement(idSql);
	             rs = pstmt.executeQuery();
	             int id=0;
	             if(rs.next()) {
	            	 id = rs.getInt(1);
	             } 
	             pstmt.close(); 		 
			    //발번된 번호로 파일 입력처리
			      conn=getConnection();
			      pstmt = conn.prepareStatement(sql);
			      
			      pstmt.setInt(1,id );
			      pstmt.setString(2, pdsItem.getFilename());
			      pstmt.setLong(3, pdsItem.getFilesize());
			      pstmt.setString(4, pdsItem.getDescription());
			      
			      result = pstmt.executeUpdate();
			    		  
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally 끝.
		return result;
	}//insert()메소드끝.
	
	
	//upload파일 리스트 조회 메소드
		public List<PdsItem> selectAll(){
			List<PdsItem> list = new ArrayList<>();
			try {
				     conn = getConnection();
				     stmt = conn.createStatement();
				     rs = stmt.executeQuery("select * from pdsItem order by id");
				     while(rs.next()) {
				    	 PdsItem pi = new PdsItem();
				    	 int i=0;
				    	 
				    	 pi.setId(rs.getInt(++i));
				    	 pi.setFilename(rs.getString(++i));
				    	 pi.setFilesize(rs.getLong(++i));
				    	 pi.setDescription(rs.getString(++i));
				   
				    	 list.add(pi);
				     }
			}catch(Exception e) {
			System.out.println(e.getMessage());
			}finally {
				try {
					 if(rs!=null)rs.close();
					 if(stmt!=null)stmt.close();
					 if(conn!=null)conn.close();
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}//finally 끝.
			return list;
		}//selectAll()메소드 끝.
		
	}
