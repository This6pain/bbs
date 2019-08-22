package com.ggh.bbs.dto;

public class UserDTO {

	private int u_no;
	private String u_id;
	private String u_pass;
	private String u_kanjiname;
	private String u_kananame;
	private String u_nickname;
	private String u_birthdate;
	private int admin_check;
	
	public UserDTO() {
		
	}
	
	public UserDTO(int u_no, String u_id, String u_pass, String u_kanjiname, String u_kananame, String u_nickname,
			String u_birthdate, int admin_check) {
		super();
		this.u_no = u_no;
		this.u_id = u_id;
		this.u_pass = u_pass;
		this.u_kanjiname = u_kanjiname;
		this.u_kananame = u_kananame;
		this.u_nickname = u_nickname;
		this.u_birthdate = u_birthdate;
		this.admin_check = admin_check;
	}
	
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public String getU_kanjiname() {
		return u_kanjiname;
	}
	public void setU_kanjiname(String u_kanjiname) {
		this.u_kanjiname = u_kanjiname;
	}
	public String getU_kananame() {
		return u_kananame;
	}
	public void setU_kananame(String u_kananame) {
		this.u_kananame = u_kananame;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getU_birthdate() {
		return u_birthdate;
	}
	public void setU_birthdate(String u_birthdate) {
		this.u_birthdate = u_birthdate;
	}
	public int getAdmin_check() {
		return admin_check;
	}
	public void setAdmin_check(int admin_check) {
		this.admin_check = admin_check;
	}
	
}
