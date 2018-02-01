package bookshop.shopping;
import java.sql.Timestamp;
public class Buy {
	private Long buy_id; //���ž��̵�
	private String buyer; //������
	private int book_id; //���ŵ� å���̵�
	private String book_title; //���ŵ� å��
	private int buy_price; //�ǸŰ�
	private int buy_count; //�Ǹż���
	private String book_image; //å�̹���
	private Timestamp buy_date; //��������
	private String account; //��������
	private String deliveryName; //�����
	private String deliveryTel ; //����� ��ȭ��ȣ
	private String deliveryAddress; //����� �ּ�
	private String sanction; //��ۻ�Ȳ
	
	public String getAccount() {	return account;	}
	public void setAccount(String account) {	this.account = account;	}
	public int getBook_id() {	return book_id;	}
	public void setBook_id(int book_id) {	this.book_id = book_id;	}
	public int getBuy_price() {		return buy_price;	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public int getBuy_count() {	return buy_count;	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	public Timestamp getBuy_date() {	return buy_date;	}
	public void setBuy_date(Timestamp buy_date) {
		this.buy_date = buy_date;
	}
	public Long getBuy_id() {	return buy_id;	}
	public void setBuy_id(Long buy_id) {	this.buy_id = buy_id;	}
	public String getBuyer() {		return buyer;	}
	public void setBuyer(String buyer) {	this.buyer = buyer;	}
	public String getSanction() {	return sanction;	}
	public void setSanction(String sanction) { this.sanction = sanction; }
	public String getBook_title() {	return book_title;	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getBook_image() {	return book_image;	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	public String getDeliveryAddress() {	return deliveryAddress;	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public String getDeliveryName() {	return deliveryName;	}
	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}
	public String getDeliveryTel() {	return deliveryTel;	}
	public void setDeliveryTel(String deliveryTel) {
		this.deliveryTel = deliveryTel;
	}
}