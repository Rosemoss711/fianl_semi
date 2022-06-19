package com.dangpert.dto;

public class UserfoodInterestDTO {
	
	private int food_seq, user_seq;
	
	public UserfoodInterestDTO() {}

	public UserfoodInterestDTO(int food_seq, int user_seq) {
		super();
		this.food_seq = food_seq;
		this.user_seq = user_seq;
	}

	public int getFood_seq() {
		return food_seq;
	}

	public void setFood_seq(int food_seq) {
		this.food_seq = food_seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	@Override
	public String toString() {
		return food_seq + " : " +  user_seq;
	}
	
	
	
}
