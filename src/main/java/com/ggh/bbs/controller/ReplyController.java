package com.ggh.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggh.bbs.dto.ReplyDTO;
import com.ggh.bbs.service.ReplyService;
import com.ggh.bbs.service.UserService;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "insertComment", method = RequestMethod.POST)
    @ResponseBody
	public int insertComent(ReplyDTO reply) {
		System.out.println(1);
		String nick = userService.getNick(reply.getR_writer());		
		System.out.println(reply.getR_content());
		reply.setR_nick(nick);
		
		return replyService.insertComment(reply);
	}
	
	@RequestMapping(value = "commentList", method = RequestMethod.POST)
    @ResponseBody
    private List<ReplyDTO> commentList(@RequestParam(value="b_id") int b_id) {
       
		return replyService.commentList(b_id);
    }
	
	@RequestMapping(value = "updateComment", method = RequestMethod.POST)
    @ResponseBody
    public int updateComment(@RequestParam int r_id, @RequestParam String r_content) {
		
		ReplyDTO reply = new ReplyDTO();
		reply.setR_id(r_id);
		reply.setR_content(r_content);
		
		return replyService.updateComment(reply);
	}

	@RequestMapping(value = "deleteComment")
    @ResponseBody
	public int deleteComment(@RequestParam(value="r_id") int r_id) {
		
		return replyService.deleteComment(r_id);		
	}
	

}
