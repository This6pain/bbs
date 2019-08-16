package com.ggh.bbs.dto;

import java.util.Date;

public class BoardDTO {

	private int b_id;
	private String b_title;
	private String b_content;
	private int b_writer;
	private int b_category;
	private Date b_createdate;
	private int b_hit;
	
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
	public int getB_category() {
		return b_category;
	}
	public void setB_category(int b_category) {
		this.b_category = b_category;
	}
	public Date getB_createdate() {
		return b_createdate;
	}
	public void setB_createdate(Date b_createdate) {
		this.b_createdate = b_createdate;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
		  
}
