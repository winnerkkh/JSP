package model;

/* *
 * bean생성
 * */
public class Customer {

	// 필드(속성)
	private String name;
	private char gender;
	private int age;

	// 메소드
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public char getGender() {return gender;}
	public void setGender(char gender) {this.gender = gender;}
	public int getAge() {return age;}
	public void setAge(int age) {this.age = age;}
}
