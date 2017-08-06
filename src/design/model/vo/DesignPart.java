package design.model.vo;

@SuppressWarnings("serial")
public class DesignPart implements java.io.Serializable{
	private String designCode;
	private String partCode;
	private int quantity;
	
	public DesignPart() {}
	
	public DesignPart(String designCode, String partCode, int quantity) {
		this.designCode = designCode;
		this.partCode = partCode;
		this.quantity = quantity;
	}

	public DesignPart(String partCode, int quantity) {
		this.partCode = partCode;
		this.quantity = quantity;
	}
	
	@Override
	public String toString() {
		return "DesignPart [designCode=" + designCode + ", partCode=" + partCode + ", quantity=" + quantity + "]";
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
