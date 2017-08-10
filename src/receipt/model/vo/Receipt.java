package receipt.model.vo;

import java.sql.Date;

public class Receipt {

	private String orderCode;
	private Date orderDate;
	private String memberName;
	private int price; // 공통
	private String title; // 공통
	private int orderCount;

	public Receipt() {
	}

	public Receipt(String orderCode, Date orderDate, String memberName, int price, String title, int orderCount) {
		super();
		this.orderCode = orderCode;
		this.orderDate = orderDate;
		this.memberName = memberName;
		this.price = price;
		this.title = title;
		this.orderCount = orderCount;
	}

	@Override
	public String toString() {
		return "Receipt [orderCode=" + orderCode + ", orderDate=" + orderDate + ", memberName=" + memberName
				+ ", price=" + price + ", title=" + title + ", orderCount=" + orderCount + "]";
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

}
