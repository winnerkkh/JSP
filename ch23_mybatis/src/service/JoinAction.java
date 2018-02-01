package service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MemberDao;
import dto.Member;

public class JoinAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
			throws Throwable {
		request.setCharacterEncoding("utf-8");
        Member member = new Member();
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        Date dt = new Date();
		java.sql.Date reg_date = new java.sql.Date(dt.getTime());
		
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setReg_date(reg_date);

		String view="";
	    /* 회원가입 처리 */
	     MemberDao dao = MemberDao.getInstance();
	      int result= dao.insertMember(member);
	      if(result>0){
	    	  System.out.println("/loginForm.do");
	    	  view = "/loginForm.do";
	      }else{
	    	  System.out.println("/joinForm.do");
			view = "/joinForm.do";
	      } 	  
		return view;
	}

}
