package com.ggh.bbs.dto;

public class Search extends Page{

//	private String searchType;
//	private String keyword;	
//	
//	public String getSearchType() {
//		return searchType;
//	}
//
//	public void setSearchType(String searchType) {
//		this.searchType = searchType;
//	}
//
//	public String getKeyword() {
//		return keyword;
//	}
//
//	public void setKeyword(String keyword) {
//		this.keyword = keyword;
//	}

	private String beginDate = "1990-01-01";
	private String endDate = "2222-01-01";	
	private String title;
	private String content;	
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
