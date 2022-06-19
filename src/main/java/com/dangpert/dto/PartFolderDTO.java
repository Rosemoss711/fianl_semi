package com.dangpert.dto;

public class PartFolderDTO {
	
	private int part_seq;
	private String part_src;
	
	public PartFolderDTO() {}

	public PartFolderDTO(int part_seq, String part_src) {
		super();
		this.part_seq = part_seq;
		this.part_src = part_src;
	}

	public int getPart_seq() {
		return part_seq;
	}

	public void setPart_seq(int part_seq) {
		this.part_seq = part_seq;
	}

	public String getPart_src() {
		return part_src;
	}

	public void setPart_src(String part_src) {
		this.part_src = part_src;
	}

	@Override
	public String toString() {
		return part_seq + " : " + part_src;
	}
	
	
}
