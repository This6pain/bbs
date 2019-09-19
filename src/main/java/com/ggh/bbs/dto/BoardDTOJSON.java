package com.ggh.bbs.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDTOJSON {

	private int idx;
	private int writerIdx;
	private String writer;
	private String title;
	private String date;
	private int readCnt;
	private int replyCnt;
	
	public BoardDTOJSON() {
		
	}

	public BoardDTOJSON(BoardDTO board) {
		super();
		this.idx = board.getB_id();
		this.writerIdx = board.getB_writer();
		this.writer = board.getB_nick();
		this.title = board.getB_title();
		this.date = dateConvert(board.getB_createdate());
		this.readCnt = board.getB_hit();
		this.replyCnt = 0;
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getWriterIdx() {
		return writerIdx;
	}

	public void setWriterIdx(int writerIdx) {
		this.writerIdx = writerIdx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = dateConvert(date);
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	public String dateConvert(Timestamp createdate) {
		
		Date date = new Date();
		date.setTime(createdate.getTime());
		String res = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		
		return res;
	}
		  
}
