package bookshop.shopping;
import java.sql.Timestamp;
public class Member {
	private String id;//���̵�
	private String passwd;//��й�ȣ
	private String name;//�̸�
	private Timestamp reg_date;//��������
	private String tel;//��ȭ��ȣ
	private String address;//�ּ�
	
	public String getAddress() {	return address;	}
	public void setAddress(String address) {	this.address = address;	}
	public String getId() {	return id;	}
	public void setId(String id) {	this.id = id;	}
	public String getName() {	return name;	}
	public void setName(String name) {	this.name = name;	}
	public String getPasswd() {	return passwd;	}
	public void setPasswd(String passwd) {	this.passwd = passwd;	}
	public Timestamp getReg_date() {	return reg_date;	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getTel() {	return tel;	}
	public void setTel(String tel) {	this.tel = tel;	}
}