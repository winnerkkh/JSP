package model;

import java.util.Date;

public class Emp {
	//필드
	private String name;
	private int empno;
	private Date hireDate;
	private int deptno;
	
	//생성자
	public Emp(){}

	//메소드
	
	public String getName() { return name;}
	public void setName(String name) { this.name = name;}
	public int getEmpno() { return empno;}
	public void setEmpno(int empno) { this.empno = empno;}
	public Date getHireDate() { return hireDate; }
	public void setHireDate(Date hireDate) { this.hireDate = hireDate;}
	public int getDeptno() { return deptno;}
	public void setDeptno(int deptno) { this.deptno = deptno; }
	
}
