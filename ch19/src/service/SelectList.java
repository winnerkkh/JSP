package service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import dao.PdsItemDao;
import dto.PdsItem;

public class SelectList {
	public String selectAll(HttpServletRequest request) {
		String path = request.getContextPath();
		PdsItemDao dao = PdsItemDao.getInstance();
		List<PdsItem> list = dao.selectAll();
		request.setAttribute("list", list);
		request.setAttribute("path", path);
		return "list.jsp";
	}
}
