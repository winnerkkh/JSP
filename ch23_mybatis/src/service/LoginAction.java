package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MemberDao;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws Throwable {
		   String id=  request.getParameter("id");
		   String password =  request.getParameter("password");
		   MemberDao dao = MemberDao.getInstance();
		   HttpSession session = request.getSession();
		   String view = "";
		   if(dao.useCheck(id, password)==1) {
			   session.setAttribute("id",id);
			   view ="/list.do";
		   }else {
			   view ="/loginForm.do";
		   }
		return view;
	}

}
