package com.dangpert.dto;

public class GymInfoDTO {
	
	private int gym_seq;
	private String gym_name, gym_phone, gym_postcode, gym_roadAddr, gym_detailAddr, gym_extraAddr, gym_month;
	private int gym_price;
	private String gym_time, gym_comment, gym_src_main;
	
	public GymInfoDTO() {}

	public GymInfoDTO(int gym_seq, String gym_name, String gym_phone, String gym_postcode, String gym_roadAddr,
			String gym_detailAddr, String gym_extraAddr, String gym_month, int gym_price, String gym_time,
			String gym_comment, String gym_src_main) {
		super();
		this.gym_seq = gym_seq;
		this.gym_name = gym_name;
		this.gym_phone = gym_phone;
		this.gym_postcode = gym_postcode;
		this.gym_roadAddr = gym_roadAddr;
		this.gym_detailAddr = gym_detailAddr;
		this.gym_extraAddr = gym_extraAddr;
		this.gym_month = gym_month;
		this.gym_price = gym_price;
		this.gym_time = gym_time;
		this.gym_comment = gym_comment;
		this.gym_src_main = gym_src_main;
	}

	public int getGym_seq() {
		return gym_seq;
	}

	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}

	public String getGym_name() {
		return gym_name;
	}

	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}

	public String getGym_phone() {
		return gym_phone;
	}

	public void setGym_phone(String gym_phone) {
		this.gym_phone = gym_phone;
	}

	public String getGym_postcode() {
		return gym_postcode;
	}

	public void setGym_postcode(String gym_postcode) {
		this.gym_postcode = gym_postcode;
	}

	public String getGym_roadAddr() {
		return gym_roadAddr;
	}

	public void setGym_roadAddr(String gym_roadAddr) {
		this.gym_roadAddr = gym_roadAddr;
	}

	public String getGym_detailAddr() {
		return gym_detailAddr;
	}

	public void setGym_detailAddr(String gym_detailAddr) {
		this.gym_detailAddr = gym_detailAddr;
	}

	public String getGym_extraAddr() {
		return gym_extraAddr;
	}

	public void setGym_extraAddr(String gym_extraAddr) {
		this.gym_extraAddr = gym_extraAddr;
	}

	public String getGym_month() {
		return gym_month;
	}

	public void setGym_month(String gym_month) {
		this.gym_month = gym_month;
	}

	public int getGym_price() {
		return gym_price;
	}

	public void setGym_price(int gym_price) {
		this.gym_price = gym_price;
	}

	public String getGym_time() {
		return gym_time;
	}

	public void setGym_time(String gym_time) {
		this.gym_time = gym_time;
	}

	public String getGym_comment() {
		return gym_comment;
	}

	public void setGym_comment(String gym_comment) {
		this.gym_comment = gym_comment;
	}

	public String getGym_src_main() {
		return gym_src_main;
	}

	public void setGym_src_main(String gym_src_main) {
		this.gym_src_main = gym_src_main;
	}

	@Override
	public String toString() {
		return gym_seq + " : " + gym_name + " : " + gym_phone
				+ " : " + gym_postcode + " : " + gym_roadAddr + " : "
				+ gym_detailAddr + " : " + gym_extraAddr + " : " + gym_month + " : "
				+ gym_price + " : " + gym_time + " : " + gym_comment + " : " + gym_src_main;
	}
	
	
	
	
}
