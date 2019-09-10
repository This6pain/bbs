package com.ggh.bbs.dto;

import java.sql.Timestamp;

public class BoardDTO {

	private int b_id;
	private String b_title;
	private String b_content;
	private int b_writer;
	private String b_nick;
	private Timestamp b_createdate;
	private int b_hit;
	
	public BoardDTO() {
		
	}
	
	public BoardDTO(int b_id, String b_title, String b_content, int b_writer, String b_nick, Timestamp b_createdate, int b_hit) {
		this.b_id = b_id;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_writer = b_writer;
		this.b_nick = b_nick;
		this.b_createdate = b_createdate;
		this.b_hit = b_hit;
	}
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_writer() {
		return b_writer;
	}
	public void setB_writer(int b_writer) {
		this.b_writer = b_writer;
	}
	public String getB_nick() {
		return b_nick;
	}

	public void setB_nick(String b_nick) {
		this.b_nick = b_nick;
	}
	public Timestamp getB_createdate() {
		return b_createdate;
	}
	public void setB_createdate(Timestamp b_createdate) {
		this.b_createdate = b_createdate;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
		  
}
