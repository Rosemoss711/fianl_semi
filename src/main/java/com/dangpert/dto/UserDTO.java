package com.dangpert.dto;

public class UserDTO {
	
	private int user_seq;
	private String user_id, user_pw, user_name, user_phone, signup_date, user_auth, user_memo;
	
	public UserDTO() {}

	

	public UserDTO(int user_seq, String user_id, String user_pw, String user_name, String user_phone,
			String signup_date, String user_auth, String user_memo) {
		super();
		this.user_seq = user_seq;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.signup_date = signup_date;
		this.user_auth = user_auth;
		this.user_memo = user_memo;
	}
	
	



	public int getUser_seq() {
		return user_seq;
	}



	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getUser_pw() {
		return user_pw;
	}



	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getUser_phone() {
		return user_phone;
	}



	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}



	public String getSignup_date() {
		return signup_date;
	}



	public void setSignup_date(String signup_date) {
		this.signup_date = signup_date;
	}



	public String getUser_auth() {
		return user_auth;
	}



	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}


	public String getUser_memo() {
		return user_memo;
	}



	public void setUser_memo(String user_memo) {
		this.user_memo = user_memo;
	}



	@Override
	public String toString() {
		return user_seq + " : " + user_id + " : " + user_pw + " : "
				+ user_name + " : " + user_phone + " : " + signup_date + " : " + user_auth + " : " + user_memo;
	}
	
	
	
	
}
