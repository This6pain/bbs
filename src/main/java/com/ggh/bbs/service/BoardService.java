package com.ggh.bbs.service;

import java.util.List;

import com.ggh.bbs.dto.BoardDTO;

public interface BoardService {

	public void boardWrite(BoardDTO board);

	public BoardDTO boardView(int b_id);
	
	public List<BoardDTO> boardList();
		
	public void updateHit(int b_id);

	public void boardUpdate(BoardDTO updateBoard);

	public void boardDelete(int b_id);
	
}
