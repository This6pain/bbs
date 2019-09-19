package com.ggh.bbs.mapper;

import java.util.List;

import com.ggh.bbs.dto.ReplyDTO;

public interface ReplyMapper {

	public List<ReplyDTO> commentList(int b_id);
 
    public int insertComment(ReplyDTO reply);
     
    public int deleteComment(int r_id);

	public int updateComment(ReplyDTO reply);

	public int commentCnt(int b_id);

}
