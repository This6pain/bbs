package com.ggh.bbs.service;

import java.util.List;

import com.ggh.bbs.dto.ReplyDTO;

public interface ReplyService {

	public List<ReplyDTO> commentList(int b_id);
	 
    public int insertComment(ReplyDTO reply);
     
    public int deleteComment(int r_id);

	public int updateComment(ReplyDTO reply);

}
