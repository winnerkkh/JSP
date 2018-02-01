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

import dto.Emp;
import dto.Emp2;


public class EmpDao {
	private static EmpDao instance;
	private EmpDao() {}
	Connection conn=null;
	PreparedStatement pstmt=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	public static EmpDao getInstance() {
		if(instance==null) instance=new EmpDao();
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
	 
	 //Emp테이블에서 job리스트 구하는 메소드
	 public List<String> selectJob(){
		 List<String> list =new ArrayList<String>();
		 try {
			 	 conn = getConnection();
			 	 pstmt = conn.prepareStatement("select distinct job from emp");
			     rs = pstmt.executeQuery();
			     while(rs.next()) {
			    	   list.add(rs.getString(1));
			     }
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
		 return list;
	 }//selectJob() 메소드 끝.
	 
	 //사원정보 리스트 출력 메소드
	 public List<Emp>selectEmpList(String job){
		 List<Emp> list = new ArrayList<>();
		 String sql="select * from emp where job=? order by empno";
		 try {
			     conn = getConnection();
			     pstmt=conn.prepareStatement(sql);
			     pstmt.setString(1, job);
			     rs = pstmt.executeQuery();
	
			     while(rs.next()) {
			    	 int i=0;
			    	 Emp emp = new Emp();
			    	 
			    	  emp.setEmpno(rs.getInt(++i));
			    	  emp.setEname(rs.getString(++i));
			    	  emp.setJob(rs.getString(++i));
			    	  emp.setMgr(rs.getInt(++i));
			    	  emp.setHiredate(rs.getDate(++i));
			    	  emp.setSal(rs.getInt(++i));
			    	  emp.setComm(rs.getInt(++i));
			    	  emp.setDeptno(rs.getInt(++i));
	
			    	 list.add(emp);
			     }
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
		 return list;
	 }//selectEmpList() 끝.
	 
	 //Json형태의 emp리스트 출력 메소드
	 public List<Emp2> selectJson(String job){
		 List<Emp2> list = new ArrayList<>();
		 String sql="select * from emp where job=? order by empno";
		 try {
			     conn = getConnection();
			     pstmt=conn.prepareStatement(sql);
			     pstmt.setString(1, job);
			     rs = pstmt.executeQuery();
	
			     while(rs.next()) {
			    	 int i=0;
			    	 Emp2 emp = new Emp2();
			    	 
			    	  emp.setEmpno(rs.getString(++i));
			    	  emp.setEname(rs.getString(++i));
			    	  emp.setJob(rs.getString(++i));
			    	  emp.setMgr(rs.getString(++i));
			    	  emp.setHiredate(rs.getString(++i));
			    	  emp.setSal(rs.getString(++i));
			    	  emp.setComm(rs.getString(++i));
			    	  emp.setDeptno(rs.getString(++i));
	
			    	 list.add(emp);
			     }
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
		 return list;
	 }//selectJson() 끝.
}




