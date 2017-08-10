package order.model.vo;

import java.sql.Date;

public class OrderStat implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private String item;
	private String month;
	private Date orderDate;
	private int price;
	private int cnt;
	
	public OrderStat(){}
	
	public OrderStat(String item, String month, int price, int cnt) {
		super();
		this.item = item;
		this.month = month;
		this.price = price;
		this.cnt = cnt;
	}
	
	public OrderStat(String item, String month, int cnt) {
		super();
		this.item = item;
		this.month = month;
		this.cnt = cnt;
	}

	public OrderStat(String month, int price) {
		super();
		this.month = month;
		this.price = price;
	}
	
	public OrderStat(String month, int cnt, int price) {
		super();
		this.month = month;
		this.cnt = cnt;
		this.price = price;
	}
	
	public OrderStat(Date orderDate, int price) {
		super();
		this.orderDate = orderDate;
		this.price = price;
	}
	
	
	@Override
	public String toString() {
		return "OrderStat [item=" + item + ", month=" + month + ", orderDate=" + orderDate + ", price=" + price + ", cnt=" + cnt + "]";
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
