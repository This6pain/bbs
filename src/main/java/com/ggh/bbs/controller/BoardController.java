package com.ggh.bbs.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ggh.bbs.dto.BoardDTO;
import com.ggh.bbs.dto.BoardDTOJSON;
import com.ggh.bbs.dto.BoardDetailJSON;
import com.ggh.bbs.dto.LoginInfoDTO;
import com.ggh.bbs.dto.PageMake;
import com.ggh.bbs.dto.Search;
import com.ggh.bbs.service.BoardService;
import com.ggh.bbs.service.ReplyService;
import com.ggh.bbs.service.UserService;

import net.sf.json.JSONObject;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/")
	public ModelAndView Main(@ModelAttribute("search")Search search){
		
//		List<UserDTO> userList = userService.getAllUser();
		
		ModelAndView mav = new ModelAndView();

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

	/*******************************************************API*********************************************************/
	
/**								  
 	//JSONArray
	@RequestMapping(value = "api/search", method = RequestMethod.GET)
	public ModelAndView Search(@ModelAttribute("search")Search search){
		
		ModelAndView mav = new ModelAndView();

		if(search.getTitle() != null || search.getTitle() != "") {

			try {
				String title = URLDecoder.decode(search.getTitle(), "UTF-8");
				search.setTitle(title);

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if(search.getContent() != null || search.getContent() != "") {
			try {
				String content = URLDecoder.decode(search.getContent(), "UTF-8");
				search.setContent(content);

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		
		List<BoardDTO> boardList = boardService.boardList(search);

		List<BoardDTOJSON> jsonList = new ArrayList<BoardDTOJSON>();
		BoardDTOJSON json = null;
		
		for(int i = 0; i<boardList.size(); i++) {

			json = new BoardDTOJSON(boardList.get(i));
			json.setReplyCnt(replyService.commentCnt(boardList.get(i).getB_id()));
			jsonList.add(json);
		}
		JSONArray jsonArray = JSONArray.fromObject(jsonList);

		mav.addObject("result", jsonArray);
		mav.setViewName("search");
		
		return mav;
	}
*/
	
	//ResponseBody
	@RequestMapping(value = "api/search", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> Search(@ModelAttribute("search")Search search){
		
		HashMap<String, Object> rs = new HashMap<String, Object>();

		if(search.getTitle() != null || search.getTitle() != "") {
			System.out.println(search.getTitle());

			try {
				String title = URLDecoder.decode(search.getTitle(), "UTF-8");
				search.setTitle(title);
				System.out.println(search.getTitle());

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if(search.getContent() != null || search.getContent() != "") {
			System.out.println(search.getContent());
			try {
				String content = URLDecoder.decode(search.getContent(), "UTF-8");
				search.setContent(content);
				System.out.println(content);

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		
		List<BoardDTO> boardList = boardService.boardList(search);

		List<BoardDTOJSON> jsonList = new ArrayList<BoardDTOJSON>();
		BoardDTOJSON json = null;
		
		for(int i = 0; i<boardList.size(); i++) {

			json = new BoardDTOJSON(boardList.get(i));
			json.setReplyCnt(replyService.commentCnt(boardList.get(i).getB_id()));
			System.out.println(json.getIdx());
			jsonList.add(json);
			System.out.println(jsonList.get(i).getIdx());
		}
		rs.put("result", jsonList);
		return rs;
	}

/**	
	//JSONObject
	@RequestMapping(value = "api/detail", method = RequestMethod.GET)
	public ModelAndView boardViews(@RequestParam(value="account") String u_id, @RequestParam(value="pwd") String u_pass, @RequestParam(value="idx") int b_id) {
		
		ModelAndView mav = new ModelAndView("detail");
		int logincheck = userService.loginCheck(new LoginInfoDTO(u_id, u_pass));
		
		if(logincheck < 1) {
			mav.addObject("error", "存在しないユーザーです。");
			return mav;
		}
		
		BoardDTO boardView = boardService.boardView(b_id);
		
		if(boardView == null) {
			mav.addObject("error", "記事が存在しません。");
			return mav;
		}
		
		BoardDetailJSON json = new BoardDetailJSON(boardView);
		json.setReply(replyService.commentList(b_id));
		System.out.println(json.getReply());
		JSONObject jsonObject = JSONObject.fromObject(json);

		mav.addObject("result", jsonObject);

		return mav;				

	}
*/	

	//ReponseBody
	@RequestMapping(value = "api/detail", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> boardViews(@RequestParam(value="account") String u_id, @RequestParam(value="pwd") String u_pass, @RequestParam(value="idx") int b_id) {
		
		int logincheck = userService.loginCheck(new LoginInfoDTO(u_id, u_pass));
		HashMap<String, Object> rs = new HashMap<String, Object>();
		
		if(logincheck < 1) {
			rs.put("error", "存在しないユーザーです。");
			return rs;
		}
		
		BoardDTO boardView = boardService.boardView(b_id);
		
		if(boardView == null) {
			rs.put("error", "記事が存在しません。");
			return rs;
		}
		
		BoardDetailJSON json = new BoardDetailJSON(boardView);
		json.setReply(replyService.commentList(b_id));
		System.out.println(json.getReply());
		JSONObject jsonObject = JSONObject.fromObject(json);

		rs.put("result", jsonObject);

		return rs;				

	}
	
}
