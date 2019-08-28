package com.ggh.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ggh.bbs.dto.BoardDTO;
import com.ggh.bbs.service.BoardService;
import com.ggh.bbs.service.UserService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public ModelAndView jspTest(){
		
		List<BoardDTO> boardList = boardService.boardList();
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("boardList", boardList);
		mav.setViewName("test");
		
		return mav;
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(BoardDTO board) {
	
		boardService.boardWrite(board);
		/*
		 * ModelAndView mav = new ModelAndView(); mav.setViewName("test");
		 */	

		return "redirect:/";
	}
	
	@RequestMapping(value = "deleteBoard")
	public ModelAndView deleteBoard(@RequestParam(value="b_id") int b_id, HttpSession session) {
		
		boardService.boardDelete(b_id);
		
		ModelAndView mav = new ModelAndView("redirect:/");
		
		return mav;				

	}
	
	@RequestMapping(value = "updateBoard", method = RequestMethod.POST)
	public ModelAndView updateBoard(BoardDTO updateBoard) {
		
		boardService.boardUpdate(updateBoard);
						
		ModelAndView mav = new ModelAndView("redirect:/");

		return mav;				

	}
	
	@RequestMapping(value = "boardView")
	public ModelAndView boardView(@RequestParam(value="b_id") int b_id) {
		
		BoardDTO boardView = boardService.boardView(b_id);
		boardService.updateHit(b_id);
		
		String writer = userService.getNick(boardView.getB_writer());
		
		ModelAndView mav = new ModelAndView("boardDetail");
		mav.addObject("boardView", boardView);
		mav.addObject("writer", writer);
		
		return mav;				

	}
}
