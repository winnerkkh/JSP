package util;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//싱글톤 
public class MysqlConn {
	private static MysqlConn instance;
	private Connection conn;
	private Context env;
	private DataSource ds;
	
	private MysqlConn() {
		try {
			String envDb = "jdbc/MysqlDB";
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/"+envDb);
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	//메소드
	public static MysqlConn getInstance() {
		if(instance == null) instance = new MysqlConn();
 		return instance;
	}	

 	public Connection getConnections() {
 			return conn;
 		 }
}