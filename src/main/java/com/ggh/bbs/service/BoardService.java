package com.ggh.bbs.service;

import java.util.List;

import com.ggh.bbs.dto.BoardDTO;
import com.ggh.bbs.dto.Page;

public interface BoardService {

	public void boardWrite(BoardDTO board);

	public BoardDTO boardView(int b_id);
	
	public List<BoardDTO> boardList(Page page);
		
	public void updateHit(int b_id);

	public void boardUpdate(BoardDTO updateBoard);

	public void boardDelete(int b_id);

	public int boardCnt();
	
}
