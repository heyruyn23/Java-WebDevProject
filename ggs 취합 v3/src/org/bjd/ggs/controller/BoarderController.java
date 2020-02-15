package org.bjd.ggs.controller;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import org.bjd.ggs.service.BoardService;
import org.bjd.ggs.service.CommentsService;
import org.bjd.ggs.service.LikesService;
import org.bjd.ggs.vo.Article;
import org.bjd.ggs.vo.Comment;
import org.bjd.ggs.vo.Like;
import org.bjd.ggs.vo.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class BoarderController {
	private BoardService boardService;
	private CommentsService commentsService;
	private LikesService likesService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}
	public void setLikesService(LikesService likesService) {
		this.likesService = likesService;
	}
	//신고하기
	@RequestMapping(value="/warn", method=RequestMethod.GET)
	public String warn() {
		return "/warn";
	}
	
	//자유게시판
	@RequestMapping(value="/freeBoard", method=RequestMethod.GET)
	public String freeBoardList() {
		return "/freeBoard";
	}
	@RequestMapping(value= {"/ajax/freeBoard/page/{pageNo}/{order}/{select}/{wire}"},method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> freeBoard(@PathVariable int pageNo,@PathVariable String order,
			@PathVariable String select, @PathVariable String wire) {//int pageNo,Model model
		System.out.println("GET /freeBoard/page/"+pageNo);
//		model.addAllAttributes(boardService.getIndexContents(pageNo));
		Map<String, Object> map = boardService.getIndexContents(pageNo,order,select,wire);
		return map;
	}
	@RequestMapping(value="/viewArticle/{no}/page/{pageNo}", method=RequestMethod.GET)
	public String article(@PathVariable int no, @PathVariable int pageNo, @RequestHeader String referer,
			Model model, HttpSession session) {
		
		Set<Integer> viewPages = (Set)session.getAttribute("viewPages");
		
		if(viewPages==null) {
			// 없으면 생성후 세션에 attribute로 등록
			viewPages = new HashSet<>();
			session.setAttribute("viewPages", viewPages);
		}//if
		
		boolean isHit = false;
		
		if(!viewPages.contains(no)) {
			isHit = true;
			viewPages.add(no);
		}//if end
		
		int memberNo = 0;
		Member loginMember = (Member)session.getAttribute(Member.LOGIN); 
		if(loginMember!=null) {
			memberNo = loginMember.getNo();
		}
		
		model.addAllAttributes(boardService.getArticleContents(no, pageNo,memberNo, isHit));
		
		String prev = referer;
		
		if(!prev.startsWith("http://localhost/freeBoard/")) {
			prev = "/freeBoard/page/1";
		}
		model.addAttribute("prev",prev);
		
		return "viewArticle";
	}
	
	@RequestMapping(value="/ajax/like", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> like(Like like) {
		return likesService.execute(like);
	}
	
	@RequestMapping(value="/freeBoard/write", method=RequestMethod.GET)
	public String writeForm() {
		
		return "writeFreeBoard";
	}
	@RequestMapping(value="/viewArticle", method=RequestMethod.POST)
	public String write(Article article) {
		String url = "redirect:/";
		
		if(boardService.write(article)) {
			url+="viewArticle/"+article.getNo()+"/page/1";
		}else {
			url+="freeBoard/page/1";
		}//if~else end
		
		return url;
	}
	@RequestMapping(value="/commentF", method=RequestMethod.POST)
	public String write(Comment comment, @RequestHeader String referer) {
		
		commentsService.write(comment);
		
		return "redirect:"+referer;
	}
	
	// 나는 산타다
	@RequestMapping(value="/comment", method=RequestMethod.POST)
	public String writeSanta(Comment comment, @RequestHeader String referer) {
		
		commentsService.writeSanta(comment);
		
		return "redirect:"+referer;
	}
	@RequestMapping(value="giveBoard", method=RequestMethod.GET)
	public String giveBoardList() {
		return "/giveBoard";
	}
	@RequestMapping(value= {"/ajax/giveBoard/page/{pageNo}/{order}/{select}/{wire}"},method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> giveBoard(@PathVariable int pageNo,@PathVariable String order,
			@PathVariable String select, @PathVariable String wire) {
		System.out.println("GET /giveBoard/page/"+pageNo);
		Map<String, Object> map = boardService.getIndexContentsSanta(pageNo,order,select,wire);
		return map;
	}
	
	@RequestMapping(value="/giveBoard/write", method=RequestMethod.GET)
	public String writeFormSanta() {
		
		return "writeGiveBoard";
	}
	@RequestMapping(value="/viewArticleS", method=RequestMethod.POST)
	public String writeSanta(Article article) {
		String url = "redirect:/";
		
		if(boardService.writeSanta(article)) {
			url+="viewArticleS/"+article.getNo()+"/page/1";
		}else {
			url+="giveBoard/page/1";
		}//if~else end
		
		return url;
	}
	@RequestMapping(value="/viewArticleS/{no}/page/{pageNo}", method=RequestMethod.GET)
	public String articleS(@PathVariable int no, @PathVariable int pageNo, @RequestHeader String referer,
			Model model, HttpSession session) {
		
		Set<Integer> viewPages = (Set)session.getAttribute("viewPages");
		
		if(viewPages==null) {
			// 없으면 생성후 세션에 attribute로 등록
			viewPages = new HashSet<>();
			session.setAttribute("viewPages", viewPages);
		}//if
		
		boolean isHit = false;
		
		if(!viewPages.contains(no)) {
			isHit = true;
			viewPages.add(no);
		}//if end
		
		int memberNo = 0;
		Member loginMember = (Member)session.getAttribute(Member.LOGIN); 
		if(loginMember!=null) {
			memberNo = loginMember.getNo();
		}
		
		model.addAllAttributes(boardService.getArticleContentsSanta(no, pageNo,memberNo, isHit));
		
		String prev = referer;
		
		if(!prev.startsWith("http://localhost/giveBoard/")) {
			prev = "/giveBoard/page/1";
		}
		model.addAttribute("prev",prev);
		
		return "viewArticleS";
	}
	@RequestMapping(value="/ajax/likeS", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> likeS(Like like) {
		return likesService.execute(like);
	}
}
