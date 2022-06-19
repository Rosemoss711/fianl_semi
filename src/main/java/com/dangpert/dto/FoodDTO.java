package com.dangpert.dto;

public class FoodDTO {

	private int food_seq;
	private String food_com, food_name, food_title, food_src;
	private int food_price;
	
	FoodDTO(){}

	public FoodDTO(int food_seq, String food_com, String food_name, String food_title, int food_price, String food_src) {
		super();
		this.food_seq = food_seq;
		this.food_com = food_com;
		this.food_name = food_name;
		this.food_title = food_title;
		this.food_price = food_price;
		this.food_src = food_src;
	}

	public int getFood_seq() {
		return food_seq;
	}

	public void setFood_seq(int food_seq) {
		this.food_seq = food_seq;
	}

	public String getFood_com() {
		return food_com;
	}

	public void setFood_com(String food_com) {
		this.food_com = food_com;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_title() {
		return food_title;
	}

	public void setFood_title(String food_title) {
		this.food_title = food_title;
	}

	public int getFood_price() {
		return food_price;
	}

	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}

	public String getFood_src() {
		return food_src;
	}

	public void setFood_src(String food_src) {
		this.food_src = food_src;
	}

	@Override
	public String toString() {
		return food_seq + " : " + food_com + " : " + food_name + " : "
				+ food_title + " : " + food_price + " : " + food_src;
	}
	
	
}
