package com.dangpert.dto;

public class UserDataDTO {

	private int user_seq, user_age, height, weight, final_weight;
	
	public UserDataDTO() {}

	public UserDataDTO(int user_seq, int user_age, int height, int weight, int final_weight) {
		super();
		this.user_seq = user_seq;
		this.user_age = user_age;
		this.height = height;
		this.weight = weight;
		this.final_weight = final_weight;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public int getUser_age() {
		return user_age;
	}

	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getFinal_weight() {
		return final_weight;
	}

	public void setFinal_weight(int final_weight) {
		this.final_weight = final_weight;
	}

	@Override
	public String toString() {
		return user_seq + " : " + user_age + " : " + height + " : "
				+ weight + " : " + final_weight + " : ";
	}

	
	
	
	
	
	
}
