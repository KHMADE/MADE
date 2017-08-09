package notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private String noticeCode;
	private String noticeTitle;
	private String noticeContents;
	private Date noticeDate;
	private String noticeImg;
	
	public String getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(String noticeCode) {
		this.noticeCode = noticeCode;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeImg() {
		return noticeImg;
	}
	public void setNoticeImg(String noticeImg) {
		this.noticeImg = noticeImg;
	}

	public Notice(String noticeCode, String noticeTitle, String noticeContents, Date noticeDate, String noticeImg) {
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
		this.noticeDate = noticeDate;
		this.noticeImg = noticeImg;
	}
	
	public Notice(String noticeCode, String noticeTitle, String noticeContents) {
		super();
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
	}
	public Notice(String noticeTitle, String noticeContents) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
	}
	
	
	@Override
	public String toString() {
		return  noticeCode + ", " + noticeTitle + ", "	+ noticeContents + ", " + noticeDate + ", " + noticeImg ;
	}
	
	
}
