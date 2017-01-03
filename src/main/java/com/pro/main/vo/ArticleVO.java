package com.pro.main.vo;

import java.io.Serializable;

public class ArticleVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int board_no;
	private int article_no;
	private String article_title;
	private String article_user_id;
	private String article_user_password;
	private String article_content;
	private String article_creation_date;
	private String article_creating_ip;
	private String article_file_name;
	private String article_readcount;
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_user_id() {
		return article_user_id;
	}
	public void setArticle_user_id(String article_user_id) {
		this.article_user_id = article_user_id;
	}
	public String getArticle_user_password() {
		return article_user_password;
	}
	public void setArticle_user_password(String article_user_password) {
		this.article_user_password = article_user_password;
	}
	public String getArticle_content() {
		return article_content;
	}
	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
	public String getArticle_creation_date() {
		return article_creation_date;
	}
	public void setArticle_creation_date(String article_creation_date) {
		this.article_creation_date = article_creation_date;
	}
	public String getArticle_creating_ip() {
		return article_creating_ip;
	}
	public void setArticle_creating_ip(String article_creating_ip) {
		this.article_creating_ip = article_creating_ip;
	}
	public String getArticle_file_name() {
		return article_file_name;
	}
	public void setArticle_file_name(String article_file_name) {
		this.article_file_name = article_file_name;
	}
	public String getArticle_readcount() {
		return article_readcount;
	}
	public void setArticle_readcount(String article_readcount) {
		this.article_readcount = article_readcount;
	}
	@Override
	public String toString() {
		return "ArticleVO [board_no=" + board_no + ", article_no=" + article_no + ", article_title=" + article_title
				+ ", article_user_id=" + article_user_id + ", article_user_password=" + article_user_password
				+ ", article_content=" + article_content + ", article_creation_date=" + article_creation_date
				+ ", article_creating_ip=" + article_creating_ip + ", article_file_name=" + article_file_name
				+ ", article_readcount=" + article_readcount + "]";
	}
	
	

	
}
