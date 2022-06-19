package com.dangpert.dto;

public class GymFreeservDTO {
	
	private int gym_seq;
	private String gym_freeserv;
	
	public GymFreeservDTO() {}

	public GymFreeservDTO(int gym_seq, String gym_freeserv) {
		super();
		this.gym_seq = gym_seq;
		this.gym_freeserv = gym_freeserv;
	}

	public int getGym_seq() {
		return gym_seq;
	}

	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}

	public String getGym_freeserv() {
		return gym_freeserv;
	}

	public void setGym_freeserv(String gym_freeserv) {
		this.gym_freeserv = gym_freeserv;
	}

	@Override
	public String toString() {
		return gym_seq + " : " + gym_freeserv;
	}
	
	
	
	
}
