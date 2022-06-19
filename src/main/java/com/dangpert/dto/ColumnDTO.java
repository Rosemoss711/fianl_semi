package com.dangpert.dto;

public class ColumnDTO {
	
	private int column_seq;
	private String column_title, column_content, column_date, column_src;
	
	public ColumnDTO() {}

	public ColumnDTO(int column_seq, String column_title, String column_content, String column_date,
			String column_src) {
		super();
		this.column_seq = column_seq;
		this.column_title = column_title;
		this.column_content = column_content;
		this.column_date = column_date;
		this.column_src = column_src;
	}




	public int getColumn_seq() {
		return column_seq;
	}



	public void setColumn_seq(int column_seq) {
		this.column_seq = column_seq;
	}



	public String getColumn_title() {
		return column_title;
	}



	public void setColumn_title(String column_title) {
		this.column_title = column_title;
	}



	public String getColumn_content() {
		return column_content;
	}



	public void setColumn_content(String column_content) {
		this.column_content = column_content;
	}



	public String getColumn_date() {
		return column_date;
	}



	public void setColumn_date(String column_date) {
		this.column_date = column_date;
	}



	public String getColumn_src() {
		return column_src;
	}



	public void setColumn_src(String column_src) {
		this.column_src = column_src;
	}



	@Override
	public String toString() {
		return column_seq + " : " + column_title + " : "
				+ column_content + " : " + column_date + " : " + column_src;
	}

	
	
}
