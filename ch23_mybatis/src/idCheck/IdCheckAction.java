package idCheck;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MemberDao;

public class IdCheckAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
				throws Throwable {
		//파라미터 받기
		String id = request.getParameter("id");
		//DB처리 작업dao 생성 
	        MemberDao dao = MemberDao.getInstance();
			int result = dao.userCheck(id);
		 	 request.setAttribute("result", result);
		      	
		return   "member/idCheck.jsp";
	}

}
