package com.ggh.bbs.dto;

public class ReplyDTO {
	
	private int r_id;
	private String r_content;
	private int r_writer;
	private String r_nick;
	private int r_board;
	  
	public ReplyDTO() {
		super();
	}
	
	public ReplyDTO(int r_id, String r_content, int r_writer, String r_nick, int r_board) {
		super();
		this.r_id = r_id;
		this.r_content = r_content;
		this.r_writer = r_writer;
		this.r_nick = r_nick;
		this.r_board = r_board;
	}
	
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
	public String getR_nick() {
		return r_nick;
	}

	public void setR_nick(String r_nick) {
		this.r_nick = r_nick;
	}
	public int getR_board() {
		return r_board;
	}
	public void setR_board(int r_board) {
		this.r_board = r_board;
	}
	  
}
