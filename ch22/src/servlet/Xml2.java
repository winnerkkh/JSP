package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import dao.EmpDao;
import dto.Emp;

@WebServlet("/Xml2")
public class Xml2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
		
				String job = request.getParameter("job");
				EmpDao dao = EmpDao.getInstance();
				List<Emp>list = dao.selectEmpList(job);
			    response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				
				Element root = new Element("empData");//<empData></empData>
			    for(Emp e:list) {
			    	 Element emp = new Element("emp");//<empData><emp></emp></empData>
			    	
			    	 Element empno = new Element("empno");
			    	 empno.setText(e.getEmpno()+"");
			    	 emp.addContent(empno);             //<empData><emp><empno>7369</empno></emp></empData>
                      			    	 
			    	 Element ename = new Element("ename");
			    	 ename.setText(e.getEname());      //<empData><emp><empno>7369</empno>
			    	 emp.addContent(ename);             //		                       <ename>SMITH</ename>
			    	                                                 //                 </emp></empData>
			    	 Element empJob = new Element("job");
			    	 empJob.setText(e.getJob());      //<empData><emp><empno>7369</empno>
			    	 emp.addContent(empJob);   
			    	 
			    	 Element mgr = new Element("mgr");
			    	 mgr.setText(e.getMgr()+"");      //<empData><emp><empno>7369</empno>
			    	 emp.addContent(mgr);
			    	 
			    	 Element hireDate = new Element("hiredate");
			    	 hireDate.setText(e.getHiredate()+"");      //<empData><emp><empno>7369</empno>
			    	 emp.addContent(hireDate);
			    	 
			    	 Element sal = new Element("sal");
			    	 sal.setText(e.getSal()+"");      //<empData><emp><empno>7369</empno>
			    	 emp.addContent(sal);
			    	 
			    	 Element comm = new Element("comm");
			    	 comm.setText(e.getComm()+"");      //<empData><emp><empno>7369</empno>
			    	 emp.addContent(comm);
			    	 
			    	 Element deptno = new Element("deptno");
			    	 deptno.setText(e.getDeptno()+"");      //<empData><emp><empno>7369</empno>
			    	 emp.addContent(deptno);
			    	
			    	 root.addContent(emp);
			    }
			    //출력
			    Document d = new Document(root);
			    XMLOutputter xml = new XMLOutputter();
			    Format f = Format.getPrettyFormat();
			    f.setEncoding("utf-8");
			    xml.setFormat(f);
			    xml.output(d, out);
			    out.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
