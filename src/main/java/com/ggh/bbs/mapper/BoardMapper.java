package com.ggh.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ggh.bbs.dto.BoardDTO;

@Mapper
public interface BoardMapper {

	void boardWrite(BoardDTO board);

	BoardDTO boardView(int b_id);

	List<BoardDTO> boardList();

	void updateHit(int b_id);

	void boardDelete(int b_id);

	void boardUpdate(BoardDTO updateBoard);

}
