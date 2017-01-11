package com.pro.main.vo;

import java.io.Serializable;

public class MemberVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_creation_date;
	private int member_level;
	private int member_point;
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_creation_date() {
		return member_creation_date;
	}
	public void setMember_creation_date(String member_creation_date) {
		this.member_creation_date = member_creation_date;
	}
	public int getMember_level() {
		return member_level;
	}
	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	@Override
	public String toString() {
		return "MemberVO [member_no=" + member_no + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_name=" + member_name + ", member_email=" + member_email + ", member_creation_date="
				+ member_creation_date + ", member_level=" + member_level + ", member_point=" + member_point + "]";
	}
}
