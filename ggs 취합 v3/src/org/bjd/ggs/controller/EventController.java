package org.bjd.ggs.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.bjd.ggs.service.CategoriesService;
import org.bjd.ggs.service.CommentsService;
import org.bjd.ggs.service.EventsService;
import org.bjd.ggs.service.MembersService;
import org.bjd.ggs.service.RespondentsService;
import org.bjd.ggs.service.ResponsesService;
import org.bjd.ggs.vo.Comment;
import org.bjd.ggs.vo.Member;
import org.bjd.ggs.vo.Respondent;
import org.bjd.ggs.vo.Response;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EventController {
	
	private EventsService eventsService;
	private MembersService membersService;
	private CategoriesService categoriesService;
	private CommentsService commentsService;
	private RespondentsService respondentsService;
	private ResponsesService responsesService;
	
	public void setResponsesService(ResponsesService responsesService) {
		this.responsesService = responsesService;
	}
	
	public void setRespondentsService(RespondentsService respondentsService) {
		this.respondentsService = respondentsService;
	}
	
	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}
	
	public void setMembersService(MembersService membersService) {
		this.membersService = membersService;
	}
	
	public void setEventsService(EventsService eventsService) {
		this.eventsService = eventsService;
	}
	
	public void setCategoriesService(CategoriesService categoriesService) {
		this.categoriesService = categoriesService;
	}
	
	@RequestMapping(value="/eventMain",method=RequestMethod.GET)
	public void eventMain(Model model) {
		model.addAttribute("list",eventsService.selectList());
	}
	@RequestMapping(value="/eventEnded",method=RequestMethod.GET)
	public String eventEndedFirst() {
		return "redirect:/eventEnded/page/1";
	}
	
	@RequestMapping(value="/eventEnded/page/{pageNo}",method=RequestMethod.GET)
	public String eventEnded(@PathVariable int pageNo, Model model) {
		//System.out.println(pageNo);
		model.addAllAttributes(eventsService.selectEndedEvent(pageNo));
		return "eventEnded";
	}
	
	@RequestMapping(value="/eventWinners/{no}", method=RequestMethod.GET)
	public String eventWinners(Model model,@PathVariable int no) {
		//System.out.println("위너페이지 번호:"+no);
		model.addAttribute("content", eventsService.selectOne(no));
		model.addAttribute("list", membersService.selectWinner(no));
		model.addAttribute("countW", membersService.selectWinTotal(no));
		return "eventWinners";
	}
	
	@RequestMapping(value="/eventDetail/{no}", method=RequestMethod.GET)
	public String eventDetailGo(@PathVariable int no) {
		//System.out.println("이벤트 진입:"+no);
		return "redirect:/eventDetail/"+no+"/page/1";
	}
	
	@RequestMapping(value="/eventDetail/{no}/page/{pageNo}", method=RequestMethod.GET)
	public String eventDetail(@PathVariable int no, Model model, @PathVariable int pageNo
			, HttpSession session) {
		//System.out.println("페이지 번호:"+pageNo);
		model.addAttribute("event", eventsService.selectOne(no));
		model.addAttribute("categoryList", categoriesService.selectAll());
		model.addAllAttributes(commentsService.selectListEC(pageNo, no));
		model.addAttribute("commentNum", commentsService.selectTotalEC(no));
		
		int memberNo = 0;
		Member loginMember = (Member)session.getAttribute(Member.LOGIN); 
		if(loginMember!=null) {
			memberNo = loginMember.getNo();
		}
		model.addAttribute("no",no);
		return "eventDetail";
		//  ~~ eventDetail.jsp 로 완성되는 것이기 때문에 
		//		"eventDetail" + no 는 안됨(eventDetail1.jsp 이런식으로 만들어짐)
	}
	
	@RequestMapping(value="/research", method=RequestMethod.POST)
	public String research(Respondent respondent, @RequestHeader String referer, Response response) {
		//System.out.println("출력되나");
		//System.out.println("respondent.getEventNo()="+respondent.getEventNo());
		//System.out.println("respondent.getMemberNo()="+respondent.getMemberNo());
		//System.out.println("respondent.getTarget()="+respondent.getTarget());
		//System.out.println("referer="+referer);

		referer = referer.substring(16, referer.length());
		int bool = respondentsService.insertE(respondent);
		System.out.println("respondent.getNo(): "+respondent.getNo());

		response.setRespondentNo(respondent.getNo());
		int categoryNo = response.getCategoryNoFirst();
		int rank = response.getRankFirst();
		System.out.println("categoryNo: " + categoryNo);
		System.out.println("rank: " + rank);
		System.out.println("respondentNo: "+ respondent.getNo());
		
		response.setCategoryNo(categoryNo);
		response.setRank(rank);
		boolean bool1 = responsesService.insertEvent(response);
		System.out.println("bool1: "+bool1);
		
		// 두번째 인서트
		categoryNo = response.getCategoryNoSecond();
		rank = response.getRankSecond();
		System.out.println("categoryNo: " + categoryNo);
		System.out.println("rank: " + rank);
		System.out.println("respondentNo: "+ respondent.getNo());
		
		response.setCategoryNo(categoryNo);
		response.setRank(rank);
		boolean bool2 = responsesService.insertEvent(response);
		System.out.println("bool2: "+bool2);
		
		// 세번째 인서트
		categoryNo = response.getCategoryNoThird();
		rank = response.getRankThird();
		System.out.println("categoryNo: " + categoryNo);
		System.out.println("rank: " + rank);
		System.out.println("respondentNo: "+ respondent.getNo());
		
		response.setCategoryNo(categoryNo);
		response.setRank(rank);
		boolean bool3 = responsesService.insertEvent(response);
		System.out.println("bool3: "+bool3);
		
		// 여기까진 됨!
		return "redirect:"+referer;
	}
	
	@RequestMapping(value="/commentE", method=RequestMethod.POST)
	public String research(Comment comment, @RequestHeader String referer) {
		//System.out.println("출력되나");
		referer = referer.substring(16, referer.length());
		
		boolean bool = commentsService.insertE(comment);
		System.out.println("respondentsService.insertE(respondent) ="+ bool);
		
		// 여기까진 됨!
		return "redirect:"+referer;
	}
}
