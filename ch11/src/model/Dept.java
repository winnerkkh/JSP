package model;

// 속성을 저장할 Bean생성
// 속성은 private으로 설정
// 메소드는 public으로 설정
// 기본 생성자는 반드시 있어야함
public class Dept {

	//속성
	private int deptno;
	private String dname;
	private String loc;
	
	
	//생성자
	
	public Dept() {};
	public Dept(int deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}

	//메소드
	public int getDeptno() {return deptno;}
	public void setDeptno(int deptno) {this.deptno = deptno;}
	public String getDname() {return dname;}
	public void setDname(String dname) {this.dname = dname;}
	public String getLoc() {return loc;}
	public void setLoc(String loc) {this.loc = loc;}
}
