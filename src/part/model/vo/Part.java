package part.model.vo;

import java.sql.Date;

public class Part implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private String partId;
	private String partName;
	private String partCategory;
	private Date partDate;
	private int price;
	private int quantity;
	private String partDesc;
	private String partImg;
	
	//INSERT INTO PART VALUES('PA8','철재 180X100cm','STEEL',SYSDATE,2300,5,'기본 철재 샘플4','default_steel4.jpg');
	
	public Part() {}

	public Part(String partId, String partName, String partCategory, int price, int quantity, String partDesc, String partImg) {
		super();
		this.partId = partId;
		this.partName = partName;
		this.partCategory = partCategory;
		this.price = price;
		this.quantity = quantity;
		this.partDesc = partDesc;
		this.partImg = partImg;
	}

	public Part(String partId, String partName, String partCategory, Date partDate, int price, int quantity, String partDesc, String partImg) {
		super();
		this.partId = partId;
		this.partName = partName;
		this.partCategory = partCategory;
		this.partDate = partDate;
		this.price = price;
		this.quantity = quantity;
		this.partDesc = partDesc;
		this.partImg = partImg;
	}

	@Override
	public String toString() {
		return "Part [partId=" + partId + ", partName=" + partName + ", partCategory=" + partCategory + ", partDate=" + partDate + ", price=" + price + ", quantity=" + quantity + ", partDesc=" + partDesc + ", partImg=" + partImg + "]";
	}

	public String getPartId() {
		return partId;
	}

	public void setPartId(String partId) {
		this.partId = partId;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public String getPartCategory() {
		return partCategory;
	}

	public void setPartCategory(String partCategory) {
		this.partCategory = partCategory;
	}

	public Date getPartDate() {
		return partDate;
	}

	public void setPartDate(Date partDate) {
		this.partDate = partDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getPartDesc() {
		return partDesc;
	}

	public void setPartDesc(String partDesc) {
		this.partDesc = partDesc;
	}

	public String getPartImg() {
		return partImg;
	}

	public void setPartImg(String partImg) {
		this.partImg = partImg;
	}
	
	

}
