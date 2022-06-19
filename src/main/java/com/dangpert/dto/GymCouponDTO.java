package com.dangpert.dto;

public class GymCouponDTO {
	private int gym_seq, user_seq, gym_price_seq, coupon_seq;
	private String gym_coupon_number;

	public GymCouponDTO() {};
	
	public GymCouponDTO(int gym_seq, int user_seq, int gym_price_seq, int coupon_seq, String gym_coupon_number) {
		super();
		this.gym_seq = gym_seq;
		this.user_seq = user_seq;
		this.gym_price_seq = gym_price_seq;
		this.coupon_seq = coupon_seq;
		this.gym_coupon_number = gym_coupon_number;
	}

	public int getGym_seq() {
		return gym_seq;
	}

	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public int getGym_price_seq() {
		return gym_price_seq;
	}

	public void setGym_price_seq(int gym_price_seq) {
		this.gym_price_seq = gym_price_seq;
	}

	public int getCoupon_seq() {
		return coupon_seq;
	}

	public void setCoupon_seq(int coupon_seq) {
		this.coupon_seq = coupon_seq;
	}
	
	public String getGym_coupon_number() {
		return gym_coupon_number;
	}

	public void setGym_coupon_number(String gym_coupon_number) {
		this.gym_coupon_number = gym_coupon_number;
	}

	@Override
	public String toString() {
		return " : " + gym_seq + " : " + user_seq + " : " + gym_price_seq
				+ " : " + coupon_seq + " : " + gym_coupon_number;
	}
	
	
}
