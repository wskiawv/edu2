package com.szlhsoft.core.util;

import java.util.Vector;

public class BaseMailVO {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	//邮件的接收人
	private String[] to;
	//邮件抄送人
	private String[] cc;
	//邮件密送人
	private String[] bcc;
	//发送邮件的邮件发送人
	private String displayName;
	//邮件的发送邮箱
	private String username;
	//发送邮箱的密码
	private String password;
	//邮件的内容
	private String subject;
	//邮件主题
	private String content;
	//邮件类容
	private String mailType; 
	//发送邮件邮箱
    private String from; 
    //邮件附件
    private Vector file = new Vector(); //用于保存发送附件的文件名的集合
	public String[] getTo() {
		return to;
	}
	public void setTo(String[] to) {
		this.to = to;
	}
	public String[] getCc() {
		return cc;
	}
	public void setCc(String[] cc) {
		this.cc = cc;
	}
	public String[] getBcc() {
		return bcc;
	}
	public void setBcc(String[] bcc) {
		this.bcc = bcc;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMailType() {
		return mailType;
	}
	public void setMailType(String mailType) {
		this.mailType = mailType;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public Vector getFile() {
		return file;
	}
	public void setFile(Vector file) {
		this.file = file;
	}
	

}
