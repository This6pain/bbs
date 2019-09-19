package com.ggh.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ggh.bbs.dto.ReplyDTO;
import com.ggh.bbs.mapper.ReplyMapper;
import com.ggh.bbs.service.ReplyService;

@Repository
@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyMapper replyMapper;
	
	@Override
	public List<ReplyDTO> commentList(int b_id) {
		// TODO 自動生成されたメソッド・スタブ
		return replyMapper.commentList(b_id);
	}

	@Override
	public int insertComment(ReplyDTO reply) {
		// TODO 自動生成されたメソッド・スタブ
		return replyMapper.insertComment(reply);
	}

	@Override
	public int deleteComment(int r_id) {
		// TODO 自動生成されたメソッド・スタブ
		return replyMapper.deleteComment(r_id);
	}

	@Override
	public int updateComment(ReplyDTO reply) {
		// TODO 自動生成されたメソッド・スタブ
		return replyMapper.updateComment(reply);

	}

	@Override
	public int commentCnt(int b_id) {
		// TODO 自動生成されたメソッド・スタブ
		return replyMapper.commentCnt(b_id);
	}

}
