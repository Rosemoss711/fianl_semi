package com.dangpert.dto;

public class DiaryDTO {

	private int diary_seq, user_seq, diary_weight;
	private String diary_date, diary_content, diary_part;
	
	public DiaryDTO() {}

	public DiaryDTO(int diary_seq, int user_seq, String diary_date, String diary_content, String diary_part,
			int diary_weight) {
		super();
		this.diary_seq = diary_seq;
		this.user_seq = user_seq;
		this.diary_date = diary_date;
		this.diary_content = diary_content;
		this.diary_part = diary_part;
		this.diary_weight = diary_weight;
	}

	public int getDiary_seq() {
		return diary_seq;
	}

	public void setDiary_seq(int diary_seq) {
		this.diary_seq = diary_seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getDiary_date() {
		return diary_date;
	}

	public void setDiary_date(String diary_date) {
		this.diary_date = diary_date;
	}

	public String getDiary_content() {
		return diary_content;
	}

	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}

	public String getDiary_part() {
		return diary_part;
	}

	public void setDiary_part(String diary_part) {
		this.diary_part = diary_part;
	}

	public int getDiary_weight() {
		return diary_weight;
	}

	public void setDiary_weight(int diary_weight) {
		this.diary_weight = diary_weight;
	}

	@Override
	public String toString() {
		return diary_seq + " : " + user_seq + " : " + diary_date
				+ " : " + diary_content + " : " + diary_part + " : " + diary_weight;
	}
	

	
	
	
}
