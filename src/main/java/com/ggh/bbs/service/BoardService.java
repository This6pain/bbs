package com.ggh.bbs.service;

import java.util.List;

import com.ggh.bbs.dto.BoardDTO;
import com.ggh.bbs.dto.Search;
import com.ggh.bbs.dto.Search2;

public interface BoardService {

	public void boardWrite(BoardDTO board);

	public BoardDTO boardView(int b_id);
	
	public List<BoardDTO> boardList(Search search);
		
	public void updateHit(int b_id);

	public void boardUpdate(BoardDTO updateBoard);

	public void boardDelete(int b_id);

	public int boardCnt(Search search);

	/*
	 * public int nextBoard(int b_id, Search search);
	 * 
	 * public int prevBoard(int b_id, Search search);
	 */

	
}
