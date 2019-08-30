package com.ggh.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ggh.bbs.dto.BoardDTO;

@Mapper
public interface BoardMapper {

	public void boardWrite(BoardDTO board);

	public BoardDTO boardView(int b_id);

	public List<BoardDTO> boardList();

	public void updateHit(int b_id);

	public void boardDelete(int b_id);

	public void boardUpdate(BoardDTO updateBoard);

}
