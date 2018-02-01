package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.Member;

public class MemberDao {
	private static MemberDao instance;
	private static SqlSession session;	
	static {
		try {
			   String conf = "resources/configuration.xml";
			    Reader reader = Resources.getResourceAsReader(conf);
			    SqlSessionFactory sf =
			    		new SqlSessionFactoryBuilder().build(reader);
			     session = sf.openSession(true);
			    reader.close();
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}
	}//static 초기화 끝.
	
	private MemberDao() {}
	public static MemberDao getInstance() {
		if(instance==null) instance=new MemberDao();
		return instance;
	}

	 public List<Member> selectMembers(){
		 List<Member> list = new ArrayList<>();
		   list = session.selectList("selectAllMembers");
		 return list;
	 }
	
	 public  Member getMemberInfo(String id) {
		 Member member = new Member();
		 member = (Member) session.selectOne("selectMemberInfo", id);
		 return member;
	 }
	 
	 public  int updateMemberInfo(Member member){
		 int result =0;
		 System.out.println("패스워드="+member.getPassword());
		 System.out.println("패스워드길이는"+member.getPassword().length());
		 
		 if(member.getPassword().length()==0)
		    result = session.update("updateMemberInfo", member);
		 else if(member.getPassword().length()>0)
			 result = session.update("updateMemberInfo2", member);
		 return result ;
	 }
	 
	public  int  useCheck(String id, String password){
		 int result =-1;
		 String dbPass = (String)session.selectOne("selectPassword", id);
		 if(password.equals(dbPass))
			   result =1;
		 return result;
	 }
	
	public int deleteMember(String id){
		int result=-1;
		result = session.delete("deleteMember", id);
		return result;
	}
	
	 public int userCheck(String id) {
		 int result=-1;
		 if((int)session.selectOne("selectIdCount", id)>0)
			result =1;
		 return result;
	 }
	 
	 public int  insertMember(Member member){
		 int result=0;
		 result= session.insert("insertMember", member);
		 System.out.println("result="+result);
		 return result;
	 }
}
