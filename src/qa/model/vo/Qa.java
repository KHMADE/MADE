package qa.model.vo;

import java.sql.Date;

public class Qa implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private String qaCode;
	private String memberId;
	private String qaTitle;
	private String qaContents;
	private Date qaDate;
	private String qaImg;
	private String qaAnswer;
	public Qa() {}
	public String getQaCode() {
		return qaCode;
	}
	public void setQaCode(String qaCode) {
		this.qaCode = qaCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getQaTitle() {
		return qaTitle;
	}
	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}
	public String getQaContents() {
		return qaContents;
	}
	public void setQaContents(String qaContents) {
		this.qaContents = qaContents;
	}
	public Date getQaDate() {
		return qaDate;
	}
	public void setQaDate(Date qaDate) {
		this.qaDate = qaDate;
	}
	public String getQaImg() {
		return qaImg;
	}
	public void setQaImg(String qaImg) {
		this.qaImg = qaImg;
	}
	public String getQaAnswer() {
		return qaAnswer;
	}
	public void setQaAnswer(String qaAnswer) {
		this.qaAnswer = qaAnswer;
	}
	public Qa(String qaCode, String memberId, String qaTitle, String qaContents, Date qaDate, String qaImg,
			String qaAnswer) {
		this.qaCode = qaCode;
		this.memberId = memberId;
		this.qaTitle = qaTitle;
		this.qaContents = qaContents;
		this.qaDate = qaDate;
		this.qaImg = qaImg;
		this.qaAnswer = qaAnswer;
	}
	
	public Qa(String memberId,String qaTitle, String qaContents, String qaImg) {
		this.memberId = memberId;
		this.qaTitle = qaTitle;
		this.qaContents = qaContents;
		this.qaImg = qaImg;
	}
	@Override
	public String toString() {
		return  qaCode + ", " + memberId + ", " + qaTitle + ", " + qaContents + ", " + qaDate + ", " + qaImg + ", " + qaAnswer;
	}
	
	
	
}
