package com.dangpert.dto;

public class GymProgramDTO {
	
	private int gym_seq;
	private String gym_program;
	
	public GymProgramDTO() {}

	public GymProgramDTO(int gym_seq, String gym_program) {
		super();
		this.gym_seq = gym_seq;
		this.gym_program = gym_program;
	}

	public int getGym_seq() {
		return gym_seq;
	}

	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}

	public String getGym_program() {
		return gym_program;
	}

	public void setGym_program(String gym_program) {
		this.gym_program = gym_program;
	}

	@Override
	public String toString() {
		return gym_seq + " : " + gym_program;
	}
	
	
	
	
}
