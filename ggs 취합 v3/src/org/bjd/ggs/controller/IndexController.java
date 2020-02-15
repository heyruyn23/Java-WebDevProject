package org.bjd.ggs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index2() {
		System.out.println("인덱스 호출");
		return "redirect:/index";
	}
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index() {
		System.out.println("인덱스 호출"); 
		
		return "index";
	}//welcome end
}
