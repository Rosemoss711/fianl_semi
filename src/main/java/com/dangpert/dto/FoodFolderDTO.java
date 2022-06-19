package com.dangpert.dto;

public class FoodFolderDTO {
	
	private int food_seq;
	private String food_src;
	
	public FoodFolderDTO() {}

	public FoodFolderDTO(int food_seq, String food_src) {
		super();
		this.food_seq = food_seq;
		this.food_src = food_src;
	}

	public int getFood_seq() {
		return food_seq;
	}

	public void setFood_seq(int food_seq) {
		this.food_seq = food_seq;
	}

	public String getFood_src() {
		return food_src;
	}

	public void setFood_src(String food_src) {
		this.food_src = food_src;
	}

	@Override
	public String toString() {
		return food_seq + " : " + food_src;
	}
	
	
	
}
