package com.ggh.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ggh.bbs.dto.BoardDTO;
import com.ggh.bbs.mapper.BoardMapper;
import com.ggh.bbs.service.BoardService;

@Repository
@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public void boardWrite(BoardDTO board) {
		// TODO 自動生成されたメソッド・スタブ
		boardMapper.boardWrite(board);
	}

	@Override
	public BoardDTO boardView(int b_id) {
		// TODO 自動生成されたメソッド・スタブ
		return boardMapper.boardView(b_id);
	}

	@Override
	public List<BoardDTO> boardList() {
		// TODO 自動生成されたメソッド・スタブ
		return boardMapper.boardList();
	}

	@Override
	public void updateHit(int b_id) {
		// TODO 自動生成されたメソッド・スタブ
		boardMapper.updateHit(b_id);
	}

	@Override
	public void boardUpdate(BoardDTO updateBoard) {
		// TODO 自動生成されたメソッド・スタブ
		boardMapper.boardUpdate(updateBoard);
	}

	@Override
	public void boardDelete(int b_id) {
		// TODO 自動生成されたメソッド・スタブ
		boardMapper.boardDelete(b_id);
	}

}
