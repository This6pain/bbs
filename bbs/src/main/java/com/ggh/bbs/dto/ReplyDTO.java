package com.ggh.bbs.dto;

public class ReplyDTO {
	
	private int r_id;
	private String r_content;
	private int r_writer;
	private int r_board;
	  
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getR_writer() {
		return r_writer;
	}
	public void setR_writer(int r_writer) {
		this.r_writer = r_writer;
	}
	public int getR_board() {
		return r_board;
	}
	public void setR_board(int r_board) {
		this.r_board = r_board;
	}
	  
}
