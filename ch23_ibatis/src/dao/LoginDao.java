package dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import dto.Member;
import sun.security.jca.GetInstance;

public class LoginDao {
	private static LoginDao instance;
	private static SqlMapClient sqlMapper;
	private LoginDao() {}
	//초기화
	static {
		try {
			String confPath = "dao/SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(confPath);
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}//초기화 끝.
	
	//getInstance메소드
	public static LoginDao getInstance() {
		if(instance==null) instance = new LoginDao();
		return instance;
	}
	//사용자 로그인 체크 메소드
	 public int userCheck(String id,String password)throws Exception{
		 int result = -1;
		 String dbPass = (String)sqlMapper.queryForObject("userCheck2",id);
		 if(password.equals(dbPass))
			 result =1; 
		 return result;
	 }
}
