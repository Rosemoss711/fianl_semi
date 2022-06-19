package com.dangpert.dto;

public class UsergymInterestDTO {

	private int gym_seq, user_seq;
	
	public UsergymInterestDTO() {}

	public UsergymInterestDTO(int gym_seq, int user_seq) {
		super();
		this.gym_seq = gym_seq;
		this.user_seq = user_seq;
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

	@Override
	public String toString() {
		return gym_seq + " : " + user_seq;
	}
	
	
	
	
}
