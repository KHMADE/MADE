package noticereply.model.vo;

import java.sql.Date;

public class NoticeReply implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private String noticeCode;
	private String replyCode;
	private String memberId;
	private String memberImg;
	private String replyContent;
	private Date replyDate;
	
	public NoticeReply(String noticeCode, String memberId, String memberImg, String replyContent) {
		super();
		this.noticeCode = noticeCode;
		this.memberId = memberId;
		this.memberImg = memberImg;
		this.replyContent = replyContent;
	}
	public NoticeReply(String noticeCode, String replyCode, String memberId, String memberImg, String replyContent,
			Date replyDate) {
		super();
		this.noticeCode = noticeCode;
		this.replyCode = replyCode;
		this.memberId = memberId;
		this.memberImg = memberImg;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
	}
	public String getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(String noticeCode) {
		this.noticeCode = noticeCode;
	}
	public String getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(String replyCode) {
		this.replyCode = replyCode;
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
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	@Override
	public String toString() {
		return "NoticeReply [noticeCode=" + noticeCode + ", replyCode=" + replyCode + ", memberId=" + memberId
				+ ", memberImg=" + memberImg + ", replyContent=" + replyContent + ", replyDate=" + replyDate + "]";
	}
	
	
}
