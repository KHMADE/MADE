package message.model.vo;

import java.sql.Date;


public class Message {
	public Message(){}
	
	public String messageCode; //쪽지 코드
	public String messageTitle;//쪽지 제목
	public String messageSenderId;//보낸아이디
	public String messageRecipientId;//받는 아이디
	public String messageContents; // 내용
	public Date messageDate;//작성일
	
	
	public Message(String messageCode, String messageTitle, String messageSenderId, String messageRecipientId,
			String messageContents, Date messageDate) {
		super();
		this.messageCode = messageCode;
		this.messageTitle = messageTitle;
		this.messageSenderId = messageSenderId;
		this.messageRecipientId = messageRecipientId;
		this.messageContents = messageContents;
		this.messageDate = messageDate;
	}
	
	
	


	public Message(String messageCode, String messageTitle, String messageSenderId, String messageRecipientId,
			String messageContents) {
		super();
		this.messageCode = messageCode;
		this.messageTitle = messageTitle;
		this.messageSenderId = messageSenderId;
		this.messageRecipientId = messageRecipientId;
		this.messageContents = messageContents;
	}


	public String getMessageCode() {
		return messageCode;
	}


	public void setMessageCode(String messageCode) {
		this.messageCode = messageCode;
	}


	public String getMessageTitle() {
		return messageTitle;
	}


	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}


	public String getMessageSenderId() {
		return messageSenderId;
	}


	public void setMessageSenderId(String messageSenderId) {
		this.messageSenderId = messageSenderId;
	}


	public String getMessageRecipientId() {
		return messageRecipientId;
	}


	public void setMessageRecipientId(String messageRecipientId) {
		this.messageRecipientId = messageRecipientId;
	}


	public String getMessageContents() {
		return messageContents;
	}


	public void setMessageContents(String messageContents) {
		this.messageContents = messageContents;
	}


	public Date getMessageDate() {
		return messageDate;
	}





	@Override
	public String toString() {
		return "message [messageCode=" + messageCode + ", messageTitle=" + messageTitle + ", messageSenderId="
				+ messageSenderId + ", messageRecipientId=" + messageRecipientId + ", messageContents="
				+ messageContents + ", messageDate=" + messageDate + "]";
	}


	
	
	
}
