package member.model.vo;

import java.sql.Date;

public class ItemReview implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private String reviewCode;
	private String partCode;
	private String designCode;
	private String memberId;
	private String memberImg;
	private String reviewContent;
	private Date reviewDate;

	public ItemReview() {}

	public ItemReview(String partCode, String designCode, String memberId, String memberImg, String reviewContent) {
		super();
		this.partCode = partCode;
		this.designCode = designCode;
		this.memberId = memberId;
		this.memberImg = memberImg;
		this.reviewContent = reviewContent;
	}

	public ItemReview(String reviewCode, String partCode, String designCode, String memberId, String memberImg, String reviewContent, Date reviewDate) {
		super();
		this.reviewCode = reviewCode;
		this.partCode = partCode;
		this.designCode = designCode;
		this.memberId = memberId;
		this.memberImg = memberImg;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
	}

	public String getReviewCode() {
		return reviewCode;
	}

	public void setReviewCode(String reviewCode) {
		this.reviewCode = reviewCode;
	}

	public String getPartCode() {
		return partCode;
	}

	public void setPartCode(String partCode) {
		this.partCode = partCode;
	}

	public String getDesignCode() {
		return designCode;
	}

	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberImg() {
		return memberImg;
	}

	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
}
