package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MemberDao;
import dto.Member;

public class ListAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	    String view="";
		HttpSession session = request.getSession();
		if(session!=null) {
		     if(session.getAttribute("id")!=null) {
			MemberDao dao =  MemberDao.getInstance();
			List<Member> list = dao.selectMembers();
			request.setAttribute("list", list);
			view = "member/list.jsp";
		     }else
		    	 view = "loginForm.do";	
		}else
		 view = "loginForm.do";			 
		return view;
	}
}
