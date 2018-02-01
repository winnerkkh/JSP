package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			   throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    String id = request.getParameter("id");
	    String password = request.getParameter("password");
	    
	    if(!(id==null || id.equals(""))){//id가 정상일 경우
	    	if(password!=null){
	    		  if(password.equals("1234")){
	    			  request.setAttribute("id", id);
	    			  request.setAttribute("password", password);
	    			  RequestDispatcher rd = request.getRequestDispatcher("admin_menu.jsp");    
	    		      rd.forward(request, response);
	    		  } else{
	    	        	RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
	    	        	rd.forward(request, response);
	    	        }
	    	}
	    }else if(id==null|| id.equals("")){//id가 비정상인 경우
	    	  request.setAttribute("id", id);
			  RequestDispatcher rd = request.getRequestDispatcher("error2.jsp");    
		      rd.forward(request, response);
	    }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
