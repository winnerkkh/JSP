package model;

//부모빈을 상속받은 자식 빈
public class BookInfo extends ProductInfo{
	
	//속성 추가
	private Short page;//페이지수
	private String writer;//저자
	
	//추가된 메소드
	public Short getPage() {return page;}
	public void setPage(Short page) {this.page = page;	}
	public String getWriter() {	return writer;	}
	public void setWriter(String writer) {	this.writer = writer;}
	
}
