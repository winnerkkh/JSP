package util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//싱글톤 
public class OraConn {
	private static OraConn instance;
	private Connection conn;
	private Context env;
	private DataSource ds;
	
	private OraConn() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	//메소드
	public static OraConn getInstance() {
		if(instance == null) instance = new OraConn();
 		return instance;
	}	

 	public Connection getConnections() {
 			return conn;
 		 }
}