package util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//싱글톤 
public class Connections {
	private static Connections instance;
	private Connections() {}
	//메소드
	public static Connections getInstance() {
		if(instance == null) instance = new Connections();
 		return instance;
	}	

 	public Connection getConnections() {
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
}