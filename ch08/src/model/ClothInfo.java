package model;

public class ClothInfo extends ProductInfo {
	
	//속성추가
	private char size; //S/M/L
	private String color;
	
	//추가된 메소드
	public char getSize() {return size;}
	public void setSize(char size) {this.size = size;}
	public String getColor() {return color;}
	public void setColor(String color) {this.color = color;}	
}
