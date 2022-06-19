package com.dangpert.dto;

public class InformationDTO {
	
	private int qna_seq;
	private String qna_title, qna_content;
	
	public InformationDTO() {}

	public InformationDTO(int qna_seq, String qna_title, String qna_content) {
		super();
		this.qna_seq = qna_seq;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
	}

	public int getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	@Override
	public String toString() {
		return qna_seq + " : " + qna_title + " : " + qna_content;
	}
	
	
}
