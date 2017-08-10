package like.model.vo;

public class Like {

	private String designCode;
	private String partCode;
	private String designTitle;
	private int designprice;
	private String designImg;
	private String partTitle;
	private int partPrice;
	private String partImg;
	private String partCategory;

	public Like() {
	}

	public Like(String designCode, String partCode, String designTitle, int designprice, String designImg,
			String partTitle, int partPrice, String partImg, String partCategory) {
		super();
		this.designCode = designCode;
		this.partCode = partCode;
		this.designTitle = designTitle;
		this.designprice = designprice;
		this.designImg = designImg;
		this.partTitle = partTitle;
		this.partPrice = partPrice;
		this.partImg = partImg;
		this.partCategory = partCategory;
	}

	@Override
	public String toString() {
		return "Like [designCode=" + designCode + ", partCode=" + partCode + ", designTitle=" + designTitle
				+ ", designprice=" + designprice + ", designImg=" + designImg + ", partTitle=" + partTitle
				+ ", partPrice=" + partPrice + ", partImg=" + partImg + ", partCategory=" + partCategory + "]";
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

}
