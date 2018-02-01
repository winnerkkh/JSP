package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;

public class Message implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
			throws Throwable {
		    String message = request.getParameter("name");
            request.setAttribute("msg", message+"님 반갑습니다.");
		return "message.jsp";
	}

}
