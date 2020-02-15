package org.bjd.ggs.controller;

import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.bjd.ggs.service.ItemsService;
import org.bjd.ggs.vo.Item;
import org.bjd.ggs.vo.Survey;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class CustomGiftController {
	private ItemsService itemsService;
	
	
	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}

	@RequestMapping(value="/customGift",method=RequestMethod.GET)
	public void customGift() {
		System.out.println("custom Gift »£√‚");
	}//welcome end
	
	@RequestMapping(value = "/ajax/customGiftList", method = RequestMethod.GET)
	@ResponseBody
	public List<Item> getCustomGift(HttpServletRequest request) {
		Survey survey=new Survey();
		survey.setAge(Integer.parseInt(request.getParameter("age")));
		survey.setMaxAge(Integer.parseInt(request.getParameter("age"))+9);
		survey.setGender(request.getParameter("gender"));
		survey.setReason(request.getParameter("reason"));
		survey.setRelation(request.getParameter("relation"));

		System.out.println(survey.getAge());
		System.out.println(survey.getMaxAge());
		System.out.println(survey.getGender());
		System.out.println(survey.getReason());
		System.out.println(survey.getRelation());
		return itemsService.getCustomGift(survey);
	}
//	@RequestMapping(value="/customGift")
//	@ModelAttribute
//	public String form(Model model) {
//		model.addAttribute("survey",new Survey());
//		return "customGift";
//		
//	}
}
