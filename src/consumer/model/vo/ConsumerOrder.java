package consumer.model.vo;

import java.sql.Date;

public class ConsumerOrder {
	
	private String orderCode;
	private String memberId;
	private String designCode;
	private String partCode;
	private String productTitle;
	private int productPrice;
	private int orderQuantity;
	private Date orderDate;
	private int orderPoint;
	private String orderStateCode;
	private String shipCompanyName;
	private String orderShipCod;
	
	
	public ConsumerOrder(){
	}

	public ConsumerOrder(String orderCode, String memberId, String designCode, String partCode, String productTitle,
			int productPrice, int orderQuantity, Date orderDate, int orderPoint, String orderStateCode,
			String shipCompanyName, String orderShipCod) {
		this.orderCode = orderCode;
		this.memberId = memberId;
		this.designCode = designCode;
		this.partCode = partCode;
		this.productTitle = productTitle;
		this.productPrice = productPrice;
		this.orderQuantity = orderQuantity;
		this.orderDate = orderDate;
		this.orderPoint = orderPoint;
		this.orderStateCode = orderStateCode;
		this.shipCompanyName = shipCompanyName;
		this.orderShipCod = orderShipCod;
	}

	@Override
	public String toString() {
		return "ConsumerOrder [orderCode=" + orderCode + ", memberId=" + memberId + ", designCode=" + designCode
				+ ", partCode=" + partCode + ", productTitle=" + productTitle + ", productPrice=" + productPrice
				+ ", orderQuantity=" + orderQuantity + ", orderDate=" + orderDate + ", orderPoint=" + orderPoint
				+ ", orderStateCode=" + orderStateCode + ", shipCompanyName=" + shipCompanyName + ", orderShipCod="
				+ orderShipCod + "]";
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


	public String getProductTitle() {
		return productTitle;
	}


	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public int getOrderQuantity() {
		return orderQuantity;
	}


	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
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


	public String getOrderShipCod() {
		return orderShipCod;
	}


	public void setOrderShipCod(String orderShipCod) {
		this.orderShipCod = orderShipCod;
	}
	
}
