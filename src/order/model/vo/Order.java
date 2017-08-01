package order.model.vo;

import java.sql.*;

public class Order implements java.io.Serializable {
	private String orderCode;
	private String memberId;
	private Date orderDate;
	private int orderPoint;
	private String orderStateCode;
	private String shipCompanyName;
	private String orderShipCode;
	private int quantity;
	private String designCode;
	private String partCode;
	
	public Order(String memberId, int orderPoint, int quantity, String designCode, String partCode) {
		super();
		this.memberId = memberId;
		this.orderPoint = orderPoint;
		this.quantity = quantity;
		this.designCode = designCode;
		this.partCode = partCode;
	}
	public Order(String orderCode, String memberId, Date orderDate, int orderPoint, String orderStateCode, String shipCompanyName, String orderShipCode, int quantity, String designCode, String partCode) {
		super();
		this.orderCode = orderCode;
		this.memberId = memberId;
		this.orderDate = orderDate;
		this.orderPoint = orderPoint;
		this.orderStateCode = orderStateCode;
		this.shipCompanyName = shipCompanyName;
		this.orderShipCode = orderShipCode;
		this.quantity = quantity;
		this.designCode = designCode;
		this.partCode = partCode;
	}
	public Order() {}
	
	@Override
	public String toString() {
		return "Order [orderCode=" + orderCode + ", memberId=" + memberId + ", orderDate=" + orderDate + ", orderPoint=" + orderPoint + ", orderStateCode=" + orderStateCode + ", shipCompanyName=" + shipCompanyName + ", orderShipCode="
				+ orderShipCode + ", quantity=" + quantity + ", designCode=" + designCode + ", partCode=" + partCode + "]";
	}
	
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderPoint() {
		return orderPoint;
	}
	public void setOrderPoint(int orderPoint) {
		this.orderPoint = orderPoint;
	}
	public String getOrderStateCode() {
		return orderStateCode;
	}
	public void setOrderStateCode(String orderStateCode) {
		this.orderStateCode = orderStateCode;
	}
	public String getShipCompanyName() {
		return shipCompanyName;
	}
	public void setShipCompanyName(String shipCompanyName) {
		this.shipCompanyName = shipCompanyName;
	}
	public String getOrderShipCode() {
		return orderShipCode;
	}
	public void setOrderShipCode(String orderShipCode) {
		this.orderShipCode = orderShipCode;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDesignCode() {
		return designCode;
	}
	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}
	public String getPartCode() {
		return partCode;
	}
	public void setPartCode(String partCode) {
		this.partCode = partCode;
	}
}
