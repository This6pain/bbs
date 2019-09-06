package com.ggh.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ggh.bbs.dto.BoardDTO;
import com.ggh.bbs.dto.Search;

@Mapper
public interface BoardMapper {

	public void boardWrite(BoardDTO board);

	public BoardDTO boardView(int b_id);

	public List<BoardDTO> boardList(Search search);

	public void updateHit(int b_id);

	public void boardDelete(int b_id);

	public void boardUpdate(BoardDTO updateBoard);

	public int boardCnt(Search search);

	public int nextBoard(@Param("b_id")int b_id, @Param("searchType")String searchType, @Param("keyword")String keyword);

	public int prevBoard(@Param("b_id")int b_id, @Param("searchType")String searchType, @Param("keyword")String keyword);
}
