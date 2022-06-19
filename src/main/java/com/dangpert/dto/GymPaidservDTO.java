package com.dangpert.dto;

public class GymPaidservDTO {
	
	private int gym_seq;
	private String gym_paidserv;
	
	public GymPaidservDTO() {}

	public GymPaidservDTO(int gym_seq, String gym_paidserv) {
		super();
		this.gym_seq = gym_seq;
		this.gym_paidserv = gym_paidserv;
	}

	public int getGym_seq() {
		return gym_seq;
	}

	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}

	public String getGym_paidserv() {
		return gym_paidserv;
	}

	public void setGym_paidserv(String gym_paidserv) {
		this.gym_paidserv = gym_paidserv;
	}

	@Override
	public String toString() {
		return gym_seq + " : " + gym_paidserv;
	}
	
	
	
	
}
