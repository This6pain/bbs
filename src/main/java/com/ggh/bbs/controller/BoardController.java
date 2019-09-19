package com.ggh.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ggh.bbs.dto.BoardDTO;
import com.ggh.bbs.dto.PageMake;
import com.ggh.bbs.dto.Search;
import com.ggh.bbs.dto.Search2;
import com.ggh.bbs.dto.UserDTO;
import com.ggh.bbs.service.BoardService;
import com.ggh.bbs.service.UserService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public ModelAndView Main(@ModelAttribute("search")Search search){
		
//		List<UserDTO> userList = userService.getAllUser();
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println(search.getBeginDate());
		System.out.println(search.getEndDate());

		PageMake maker = new PageMake();
		maker.setPage(search);
	    maker.setTotalCount(boardService.boardCnt(search));
		
		List<BoardDTO> boardList = boardService.boardList(search);

		System.out.println("endPage="+maker.getEndPage());
		System.out.println("displayPageNum="+maker.getDisplayPageNum());
		System.out.println("startPage="+maker.getStartPage());
		
		mav.addObject("boardList", boardList);
//		mav.addObject("userList", userList);
		mav.addObject("search", search);
		mav.addObject("pageMaker", maker);
		mav.setViewName("test");
		
		return mav;
	}
	
	/*******************API*********************/
	
	@RequestMapping(value = "api/search", method = RequestMethod.GET)
	public ModelAndView Search(@ModelAttribute("search")Search search){
		
		
		ModelAndView mav = new ModelAndView();

		System.out.println(search.getBeginDate());
		System.out.println(search.getEndDate());
		PageMake maker = new PageMake();
		maker.setPage(search);
	    maker.setTotalCount(boardService.boardCnt(search));
		
		List<BoardDTO> boardList = boardService.boardList(search);

		System.out.println("endPage="+maker.getEndPage());
		System.out.println("displayPageNum="+maker.getDisplayPageNum());
		System.out.println("startPage="+maker.getStartPage());
		
		mav.addObject("boardList", boardList);
		mav.addObject("search", search);
		mav.addObject("pageMaker", maker);
		mav.setViewName("search");
		
		return mav;
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public ModelAndView write(BoardDTO board) {
	
		String nick = userService.getNick(board.getB_writer());		

		board.setB_nick(nick);
		
		boardService.boardWrite(board);

		ModelAndView mav = new ModelAndView("redirect:/");
		
		return mav;	
	}
	
	@RequestMapping(value = "deleteBoard")
	public ModelAndView deleteBoard(@ModelAttribute("search")Search search, @RequestParam(value="b_id") int b_id, HttpSession session) {
		
		boardService.boardDelete(b_id);
		
		ModelAndView mav = new ModelAndView("redirect:/");
		mav.addObject("search", search);

		return mav;				

	}
	
	@RequestMapping(value = "updateBoard", method = RequestMethod.POST)
	public ModelAndView updateBoard(@ModelAttribute("search")Search search, BoardDTO updateBoard) {
		
		boardService.boardUpdate(updateBoard);
						
		ModelAndView mav = new ModelAndView("redirect:/");
		mav.addObject("search", search);

		return mav;				

	}
	
	@RequestMapping(value = "boardView")
	public ModelAndView boardView(@ModelAttribute("search")Search search, @RequestParam(value="b_id") int b_id) {
		
		BoardDTO boardView = boardService.boardView(b_id);
		boardView.setB_content(boardView.getB_content().replaceAll("\r\n", "<br>"));
		boardService.updateHit(b_id);
//		int nextNum = boardService.nextBoard(b_id, search);
//		int prevNum = boardService.prevBoard(b_id, search);
		ModelAndView mav = new ModelAndView("boardDetail");
		mav.addObject("boardView", boardView);
		mav.addObject("search", search);
//		mav.addObject("prevNum", prevNum);
//		mav.addObject("nextNum", nextNum);

		return mav;				

	}
	
	@RequestMapping(value = "api/detail", method = RequestMethod.GET)
	public ModelAndView boardViews(@ModelAttribute("search")Search search, @RequestParam(value="b_id") int b_id) {
		
		BoardDTO boardView = boardService.boardView(b_id);
		boardView.setB_content(boardView.getB_content().replaceAll("\r\n", "<br>"));
		boardService.updateHit(b_id);
//		int nextNum = boardService.nextBoard(b_id, search);
//		int prevNum = boardService.prevBoard(b_id, search);
		ModelAndView mav = new ModelAndView("boardDetail");
		mav.addObject("boardView", boardView);
		mav.addObject("search", search);
//		mav.addObject("prevNum", prevNum);
//		mav.addObject("nextNum", nextNum);

		return mav;				

	}
}
