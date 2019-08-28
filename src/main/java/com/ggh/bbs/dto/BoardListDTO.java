package com.ggh.bbs.dto;

import java.util.List;

public class BoardListDTO {

	private int totalBoardCount;
	private int currentPageNum;
	private List<BoardDTO> boardList;
	private int totalPageCount;
	private int boardCountPerPage;
	private int firstRow;
	
	public BoardListDTO() {
		
	}
	
	public BoardListDTO(int totalBoardCount, int currentPageNum, List<BoardDTO> boardList, int totalPageCount,
			int boardCountPerPage, int firstRow) {
		super();
		this.totalBoardCount = totalBoardCount;
		this.currentPageNum = currentPageNum;
		this.boardList = boardList;
		this.totalPageCount = totalPageCount;
		this.boardCountPerPage = boardCountPerPage;
		this.firstRow = firstRow;
	}

	public int getTotalBoardCount() {
		return totalBoardCount;
	}

	public void setTotalBoardCount(int totalBoardCount) {
		this.totalBoardCount = totalBoardCount;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}

	public List<BoardDTO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<BoardDTO> boardList) {
		this.boardList = boardList;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getBoardCountPerPage() {
		return boardCountPerPage;
	}

	public void setBoardCountPerPage(int boardCountPerPage) {
		this.boardCountPerPage = boardCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}
	
	

}
