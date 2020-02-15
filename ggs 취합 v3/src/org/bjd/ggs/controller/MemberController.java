package org.bjd.ggs.controller;

import javax.servlet.http.HttpSession;

import org.bjd.ggs.service.MembersService;
import org.bjd.ggs.vo.Member;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	
	private MembersService membersService;
	
	public void setMembersService(MembersService membersService) {
		this.membersService = membersService;
	}
	@RequestMapping(value="loginForm",method=RequestMethod.GET)
	public String log() {
		System.out.println("asdf");
		return "redirect:/login";
	}
	@RequestMapping(value= "/login",method=RequestMethod.GET)
	public String loginPage() {
		System.out.println("로그인 페이지 호출");
		return "loginForm";
		
	}
	@RequestMapping(value="/session",
			method=RequestMethod.POST)
	public String login(
			Member member,
			HttpSession session,
			@RequestHeader String referer) {
		
		System.out.println(member.getEmail());
		System.out.println(member.getPassword());
		
		session.setAttribute(Member.LOGIN, membersService.login(member));
		
		return "redirect:/index";
	}
	

	@RequestMapping(value="/session",
			method=RequestMethod.DELETE)
	public String logout(
			HttpSession session,
			@RequestHeader String referer) {
		
		session.invalidate();
		
		return "redirect:"+referer;
	}
	
	//회원가입 페이지 view
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		
		return "joinForm";
	}
	
	//회원가입
	@RequestMapping(value="/member/join",
			method=RequestMethod.POST)
	public String join(Member member,BindingResult br, RedirectAttributes ra) {
		
//		System.out.println(member.getBirthDate());
//		System.out.println(member.getEmail());
		//System.out.println("join email value : " + member.getEmail());
		if(membersService.join(member)) {
			ra.addFlashAttribute("msg", member.getEmail()+"님의 회원가입이 완료되었습니다.");
		}//if end
		
		return "redirect:/index";
	}
	
	//eamil ajax
	@RequestMapping(value="/ajax/member/email",
			method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String checkEmail(String email) {
		
		//System.out.println("ajax email value : " + email);
		
		return "{\"result\":"+ membersService.checkEmail(email)+"}";
	}
	
}
