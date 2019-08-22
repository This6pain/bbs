package com.ggh.bbs.dto;

public class LoginInfoDTO {

	private String login_id;
	private String login_pass;
	
	public LoginInfoDTO() {
		super();
	}
	
	public LoginInfoDTO(String login_id, String login_pass) {
		super();
		this.login_id = login_id;
		this.login_pass = login_pass;
	}
	
	public String getLogin_id() {
		return login_id;
	}
	
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getLogin_pass() {
		return login_pass;
	}
	public void setLogin_pass(String login_pass) {
		this.login_pass = login_pass;
	}
	
}
