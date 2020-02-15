package org.bjd.ggs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.bjd.ggs.service.ItemsService;
import org.bjd.ggs.service.PickmesService;
import org.bjd.ggs.vo.Item;
import org.bjd.ggs.vo.Member;
import org.bjd.ggs.vo.PageVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PickmeController {
	private ItemsService itemsService;
	private PickmesService pickmesService;
	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}
	public void setPickmesService(PickmesService pickmesService) {
		this.pickmesService = pickmesService;
	}
	
	@RequestMapping(value="/pickme",method=RequestMethod.GET)
	public void pickme(Model model,HttpSession session) {
		System.out.println("픽미 페이지");
		int memberNo = 0;
		int count = 0;
		Member loginMember = (Member)session.getAttribute(Member.LOGIN); 
		if(loginMember==null) {
			count = 0;
			model.addAttribute("count",count);
		}
		else {
			memberNo=loginMember.getNo();
			count = itemsService.getCount(memberNo);
			model.addAttribute("count",count);
		}
		System.out.println("유저가 가지고있는 item 갯수 :"+count);
	}
}
