package com.dangpert.dto;

public class GymFolderDTO {
	
	private int gym_seq;
	private String gym_src;
	
	public GymFolderDTO() {}
	
	public GymFolderDTO(int gym_seq, String gym_src) {
		super();
		this.gym_seq = gym_seq;
		this.gym_src = gym_src;
	}

	public int getGym_seq() {
		return gym_seq;
	}

	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}

	public String getGym_src() {
		return gym_src;
	}

	public void setGym_src(String gym_src) {
		this.gym_src = gym_src;
	}
	
	@Override
	public String toString() {
		return gym_seq + " : " + gym_src;
	}
	
	
}
