package design.model.vo;

import java.sql.Date;

public class Design implements java.io.Serializable{
	private static final long serialVersionUID = 1L;

	private String designId;
	private String designName;
	private String designCategory;
	private Date designDate;
	private String designDesc;
	private int designPrice;
	private String designImg;
	private String designerId;
	
	//INSERT INTO DESIGN VALUES('DE1','목재서랍장1','WOOD',SYSDATE,'목재 서랍장1입니다.',15000,'default_design1.jpg','design11');
	
	public Design() {}

	public Design(String designId, String designName, String designCategory, String designDesc, int designPrice, String designImg, String designerId) {
		super();
		this.designId = designId;
		this.designName = designName;
		this.designCategory = designCategory;
		this.designDesc = designDesc;
		this.designPrice = designPrice;
		this.designImg = designImg;
		this.designerId = designerId;
	}

	public Design(String designId, String designName, String designCategory, Date designDate, String designDesc, int designPrice, String designImg, String designerId) {
		super();
		this.designId = designId;
		this.designName = designName;
		this.designCategory = designCategory;
		this.designDate = designDate;
		this.designDesc = designDesc;
		this.designPrice = designPrice;
		this.designImg = designImg;
		this.designerId = designerId;
	}

	@Override
	public String toString() {
		return "Design [designId=" + designId + ", designName=" + designName + ", designCategory=" + designCategory + ", designDate=" + designDate + ", designDesc=" + designDesc + ", designPrice=" + designPrice + ", designImg=" + designImg
				+ ", designerId=" + designerId + "]";
	}

	public String getDesignId() {
		return designId;
	}

	public void setDesignId(String designId) {
		this.designId = designId;
	}

	public String getDesignName() {
		return designName;
	}

	public void setDesignName(String designName) {
		this.designName = designName;
	}

	public String getDesignCategory() {
		return designCategory;
	}

	public void setDesignCategory(String designCategory) {
		this.designCategory = designCategory;
	}

	public Date getDesignDate() {
		return designDate;
	}

	public void setDesignDate(Date designDate) {
		this.designDate = designDate;
	}

	public String getDesignDesc() {
		return designDesc;
	}

	public void setDesignDesc(String designDesc) {
		this.designDesc = designDesc;
	}

	public int getDesignPrice() {
		return designPrice;
	}

	public void setDesignPrice(int designPrice) {
		this.designPrice = designPrice;
	}

	public String getDesignImg() {
		return designImg;
	}

	public void setDesignImg(String designImg) {
		this.designImg = designImg;
	}

	public String getDesignerId() {
		return designerId;
	}

	public void setDesignerId(String designerId) {
		this.designerId = designerId;
	}
	
	

}
