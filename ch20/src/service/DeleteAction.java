package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardDao;

public class DeleteAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
			throws Throwable {
		  String num = request.getParameter("num");
	       String pageNum = request.getParameter("pageNum");
	       String password = request.getParameter("password");
	       
	       BoardDao dao = BoardDao.getInstance();
	       int result = dao.useCheck(Integer.parseInt(num), password);
	       String view=""; 
	       
	       if(result==-1){/* 패스워드가 맞지않으면 */
	    	   view = "deleteForm.do";
	       }else if(result==1){/* 패스워드가 맞으면 */
			    	   result = dao.deleteBoard(Integer.parseInt(num));
				       view = "list.do";
	       }//else 끝
	       
           request.setAttribute("num", num);
	       request.setAttribute("pageNum", pageNum);
		return view;
	}
}
