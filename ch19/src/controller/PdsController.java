package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FileInsert;
import service.SelectList;

//@WebServlet("/PdsController")
public class PdsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		//request로 들어온 파라미터의 문자셋을 현재 페이지의 문자셋으로 세팅
		request.setCharacterEncoding("utf-8");
		
		//만들어서 response에 실을 페이지 문자셋을 세팅
		response.setContentType("text/html; charset=utf-8");
		
		int chk=0;
		String pgm="";
		
		// 요청된 경로 및 uri 패턴을 분석
		String uri = request.getRequestURI();//uri = /ch19/pad/Upload.do */
		String path = request.getContextPath();// /ch19
		String command = uri.substring(path.length()+1);
		
		RequestDispatcher  rd=null;//처리 후 이동할 경로 
		System.out.println("uri="+uri);
		System.out.println("path="+path);
		System.out.println("command="+command);
		//command의 경우에 따라 분기
		switch (command) {
		case "pds/Upload.do":
				FileInsert fi = new FileInsert();//File저장 클래스
				int result = fi.addFile(request);//File저장 메소드
				if(result>0) {
					chk=0;
					pgm="uploadOk.jsp";
				}else {
					chk=1;
					pgm="uploadForm.jsp";
					request.setAttribute("msg", "업로드 실패");
				}
				  break;
		case "pds/List.do":
			SelectList sl = new SelectList();
			pgm= sl.selectAll(request);////이동 페이지 경로
			chk=1;
			
			request.setAttribute("path", path);
			break;
		}
		
		//처리 결과에 따라 페이지 이동 
		if(chk==0)//reDirect는 출발점이 다시 browser부터
			response.sendRedirect(pgm);// 화면을 이동
		else {//forward는 현재페이지에서 이동
			rd = request.getRequestDispatcher(pgm);//request에 값을 실어서 이동
			rd.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
