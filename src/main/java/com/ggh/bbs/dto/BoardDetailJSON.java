package com.ggh.bbs.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BoardDetailJSON {

	private String title;
	private String content;
	private String date;
	private String writer;
	private int writerIdx;
	private int readCnt;
	private int[] reply;
	
	public BoardDetailJSON() {
		
	}
	
	public BoardDetailJSON(BoardDTO board) {
		super();
		this.title = board.getB_title();
		this.content = board.getB_content();
		this.date = dateConvert(board.getB_createdate());
		this.writer = board.getB_nick();
		this.writerIdx = board.getB_writer();
		this.readCnt = board.getB_hit();
		this.reply = null;
	}



	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
		this.date = date.toString();
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public int[] getReply() {
		return reply;
	}

	public void setReply(List<ReplyDTO> replyList) {
		
		for(int i = 0; i<replyList.size(); i++) {
			reply[i] = replyList.get(i).getR_id();
		}
		
	}
	
	public String dateConvert(Timestamp createdate) {
		
		Date date = new Date();
		date.setTime(createdate.getTime());
		String res = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		
		return res;
	}
	
		  
}
