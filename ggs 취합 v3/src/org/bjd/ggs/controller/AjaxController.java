package org.bjd.ggs.controller;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.bjd.ggs.service.ItemsService;
import org.bjd.ggs.service.PickmesService;
import org.bjd.ggs.vo.Item;
import org.bjd.ggs.vo.Member;
import org.bjd.ggs.vo.PageVO;
import org.bjd.ggs.vo.Pickme;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class AjaxController {
	private ItemsService itemsService;
	private PickmesService pickmesService;
	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}
	public void setPickmesService(PickmesService pickmesService) {
		this.pickmesService = pickmesService;
	}
	@RequestMapping(value="/ajax/getItems",method=RequestMethod.GET)
	@ResponseBody
	public List<Item> more(HttpSession session,Model model) {
		int memberNo = 0;
		Set<Integer> nos = (Set<Integer>)session.getAttribute("nos");
		if(nos==null) {
			nos = new HashSet<>();
			nos.add(0);
			session.setAttribute("nos", nos);
		}//if end
		
		Member loginMember = (Member)session.getAttribute(Member.LOGIN); 
		if(loginMember==null) {}
		else {
			memberNo=loginMember.getNo();
			/*평가 했던 목록들 제거*/
			List<Integer> itemNos = itemsService.getItemNos(memberNo);
			System.out.println("하이 나는 로그인됨");
			for( int itemNo : itemNos) {
				if(!nos.contains(itemNo)) {
					nos.add(itemNo);
				}//if end
			}//for end
		}

		String nosStr  = nos.toString();
		nosStr = nosStr.substring(1,nosStr.length()-1);
		
		PageVO pageVO = new PageVO();
		pageVO.setStart(1);
		pageVO.setEnd(6);
		pageVO.setNos(nosStr);
		
		/*새로 나온 목록들 제거*/
		List<Item> items = itemsService.getItems(pageVO);
		for( Item item : items) {
			
			int itemNo = item.getNo();
			
			if(!nos.contains(itemNo)) {
				nos.add(itemNo);
			}//if end
			
		}//for end
		
		System.out.println("nos:"+nosStr);

		return items;
	};
	
	
	
	
	@RequestMapping(value="/ajax/pickmeItem/{no}",method=RequestMethod.POST)
	@ResponseBody
	public String insertItem(HttpServletRequest request,HttpSession session,@PathVariable int no) {
		int itemNo = no;
		int rank = Integer.parseInt(request.getParameter("rank"));
		int memberNo = 0;
		Member loginMember = (Member)session.getAttribute(Member.LOGIN); 
		if(loginMember!=null) {
			memberNo = loginMember.getNo();
		} 
		Pickme pickme = new Pickme();
		pickme.setMemberNo(memberNo);
		pickme.setItemNo(itemNo);
		pickme.setRank(rank);
//		System.out.println(pickme.getMemberNo());
//		System.out.println(pickme.getItemNo());
//		System.out.println(pickme.getRank());
		int result = pickmesService.putItem(pickme);
		System.out.print(result+"개  pickme insert");
		
		return "{\"result\":true}";
	} 
	
	@RequestMapping(value="/ajax/pickmeItem/{no}",method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteItem(HttpServletRequest request,HttpSession session,@PathVariable int no) {
		int itemNo = no;
		int memberNo = 0;

		Member loginMember = (Member)session.getAttribute(Member.LOGIN); 
		if(loginMember!=null) {
			memberNo = loginMember.getNo();
		} 
		Pickme pickme = new Pickme();
		pickme.setMemberNo(memberNo);
		pickme.setItemNo(itemNo);
		
//		System.out.println(pickme.getMemberNo());
//		System.out.println(pickme.getItemNo());

		int result = pickmesService.deleteItem(pickme);
		System.out.print(result+"개  pickme delete");
		
		return "{\"result\":true}";
	} 
	
	@RequestMapping(value="/ajax/pickmeItem/{no}/rank/{rank}",method=RequestMethod.PUT)
	@ResponseBody
	public String updateItem(HttpServletRequest request,HttpSession session,@PathVariable int no, @PathVariable int rank) {
		int itemNo = no;
		int memberNo = 0;
		Member loginMember = (Member)session.getAttribute(Member.LOGIN); 
		if(loginMember!=null) {
			memberNo = loginMember.getNo();
		} 
		Pickme pickme = new Pickme();
		pickme.setMemberNo(memberNo);
		pickme.setItemNo(itemNo);
		pickme.setRank(rank);
//		System.out.println(pickme.getMemberNo());
//		System.out.println(pickme.getItemNo());
//		System.out.println(pickme.getRank());
		int result = pickmesService.updateItem(pickme);
		System.out.print(result+"개  pickme update");
		
		return "{\"result\":true}";
	} 
}