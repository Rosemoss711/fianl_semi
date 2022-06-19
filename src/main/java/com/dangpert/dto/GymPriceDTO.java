package com.dangpert.dto;

public class GymPriceDTO {
	private int gym_seq, gym_price_seq, gym_price;
	private String gym_month;
	
	public GymPriceDTO() {};
	
	public GymPriceDTO(int gym_seq, int gym_price_seq, String gym_month, int gym_price) {
		super();
		this.gym_seq = gym_seq;
		this.gym_price_seq = gym_price_seq;
		this.gym_month = gym_month;
		this.gym_price = gym_price;
	}

	public int getGym_seq() {
		return gym_seq;
	}

	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}

	public int getGym_price_seq() {
		return gym_price_seq;
	}

	public void setGym_price_seq(int gym_price_seq) {
		this.gym_price_seq = gym_price_seq;
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

	@Override
	public String toString() {
		return " : " + gym_seq + " : " + gym_price_seq + " : " + gym_price
				+ " : " + gym_month;
	}
	
	
}
