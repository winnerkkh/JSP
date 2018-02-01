package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardDao;
import dto.Board;
import util.PageBean;
import util.Paging;

public class ListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
			throws Throwable {
			BoardDao dao = BoardDao.getInstance();
			int total = dao.getTotal();
			Paging pg = new Paging();
			PageBean pb = pg.getPaging(request, total);
			
			System.out.println("startRow="+pb.getStartRow());
			System.out.println("endRow="+pb.getEndRow());
			
			List<Board> list = dao.selectList(pb.getStartRow(),pb.getEndRow());
			//블럭처리
			request.setAttribute("list",list);
			request.setAttribute("pb", pb);
			request.setAttribute("total", total);
			
			System.out.println("listsize="+list.size());
			//이동할 뷰
		return "board/list.jsp";
	}

}
