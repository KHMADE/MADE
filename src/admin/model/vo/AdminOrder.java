package admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

@SuppressWarnings("serial")
public class AdminOrder implements Serializable{

	private String orderCode;
	private String designCode;
	private String partCode;
	private Date orderDate;
	private int orderCount;
	private String designTitle;
	private int designprice;
	private String designImg;
	private String partTitle;
	private int partPrice;
	private String partImg;
	private String partCategory;
	private String orderStateName;
	private String shipCompanyName;
	private String orderShipCode;

	public AdminOrder() {
	}

	public AdminOrder(String orderCode, String designCode, String partCode, Date orderDate, int orderCount,
			String designTitle, int designprice, String designImg, String partTitle, int partPrice, String partImg,
			String partCategory, String orderStateName, String shipCompanyName, String orderShipCode) {
		this.orderCode = orderCode;
		this.designCode = designCode;
		this.partCode = partCode;
		this.orderDate = orderDate;
		this.orderCount = orderCount;
		this.designTitle = designTitle;
		this.designprice = designprice;
		this.designImg = designImg;
		this.partTitle = partTitle;
		this.partPrice = partPrice;
		this.partImg = partImg;
		this.partCategory = partCategory;
		this.orderStateName = orderStateName;
		this.shipCompanyName = shipCompanyName;
		this.orderShipCode = orderShipCode;
	}

	@Override
	public String toString() {
		return "DesignerOrder [orderCode=" + orderCode + ", designCode=" + designCode + ", partCode=" + partCode
				+ ", orderDate=" + orderDate + ", orderCount=" + orderCount + ", designTitle=" + designTitle
				+ ", designprice=" + designprice + ", designImg=" + designImg + ", partTitle=" + partTitle
				+ ", partPrice=" + partPrice + ", partImg=" + partImg + ", partCategory=" + partCategory
				+ ", orderStateName=" + orderStateName + ", shipCompanyName=" + shipCompanyName + ", orderShipCode="
				+ orderShipCode + "]";
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
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

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public String getDesignTitle() {
		return designTitle;
	}

	public void setDesignTitle(String designTitle) {
		this.designTitle = designTitle;
	}

	public int getDesignprice() {
		return designprice;
	}

	public void setDesignprice(int designprice) {
		this.designprice = designprice;
	}

	public String getDesignImg() {
		return designImg;
	}

	public void setDesignImg(String designImg) {
		this.designImg = designImg;
	}

	public String getPartTitle() {
		return partTitle;
	}

	public void setPartTitle(String partTitle) {
		this.partTitle = partTitle;
	}

	public int getPartPrice() {
		return partPrice;
	}

	public void setPartPrice(int partPrice) {
		this.partPrice = partPrice;
	}

	public String getPartImg() {
		return partImg;
	}

	public void setPartImg(String partImg) {
		this.partImg = partImg;
	}

	public String getPartCategory() {
		return partCategory;
	}

	public void setPartCategory(String partCategory) {
		this.partCategory = partCategory;
	}

	public String getOrderStateName() {
		return orderStateName;
	}

	public void setOrderStateName(String orderStateName) {
		this.orderStateName = orderStateName;
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

}
