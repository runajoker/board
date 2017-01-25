package com.pro.main.vo;

public class CommentVO {

	private int comment_no; 
	private String comment_user_id; 
	private String comment_user_pw; 
	private String comment_content;
	private String comment_creation_date;
	private String comment_creation_ip;
	private int article_no;
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getComment_user_id() {
		return comment_user_id;
	}
	public void setComment_user_id(String comment_user_id) {
		this.comment_user_id = comment_user_id;
	}
	public String getComment_user_pw() {
		return comment_user_pw;
	}
	public void setComment_user_pw(String comment_user_pw) {
		this.comment_user_pw = comment_user_pw;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_creation_date() {
		return comment_creation_date;
	}
	public void setComment_creation_date(String comment_creation_date) {
		this.comment_creation_date = comment_creation_date;
	}
	public String getComment_creation_ip() {
		return comment_creation_ip;
	}
	public void setComment_creation_ip(String comment_creation_ip) {
		this.comment_creation_ip = comment_creation_ip;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	@Override
	public String toString() {
		return "CommentVO [comment_no=" + comment_no + ", comment_user_id=" + comment_user_id + ", comment_user_pw="
				+ comment_user_pw + ", comment_content=" + comment_content + ", comment_creation_date="
				+ comment_creation_date + ", comment_creation_ip=" + comment_creation_ip + ", article_no=" + article_no
				+ "]";
	}
	
	
}
