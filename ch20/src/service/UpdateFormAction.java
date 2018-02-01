package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardDao;
import dto.Board;

public class UpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
	    String pageNum = request.getParameter("pageNum");
	    Board board = new Board();
	    BoardDao dao = BoardDao.getInstance();
	    board = dao.getBoard(num);
		
	    request.setAttribute("num", num);
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("board", board);
	    
		return "board/updateForm.jsp";
	}

}
