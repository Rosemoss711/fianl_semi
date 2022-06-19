package com.dangpert.dto;

public class PartDTO {
	
	private int part_seq;
	private String part_title, part_content, part_class;
	
	PartDTO(){}

	public PartDTO(int part_seq, String part_title, String part_content, String part_class) {
		super();
		this.part_seq = part_seq;
		this.part_title = part_title;
		this.part_content = part_content;
		this.part_class = part_class;
	}

	public int getPart_seq() {
		return part_seq;
	}

	public void setPart_seq(int part_seq) {
		this.part_seq = part_seq;
	}

	public String getPart_title() {
		return part_title;
	}

	public void setPart_title(String part_title) {
		this.part_title = part_title;
	}

	public String getPart_content() {
		return part_content;
	}

	public void setPart_content(String part_content) {
		this.part_content = part_content;
	}

	public String getPart_class() {
		return part_class;
	}

	public void setPart_class(String part_class) {
		this.part_class = part_class;
	}

	@Override
	public String toString() {
		return part_seq + " : " + part_title + " : " + part_content
				+ " : " + part_class;
	}
	
	
	
}
