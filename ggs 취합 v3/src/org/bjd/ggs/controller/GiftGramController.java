package org.bjd.ggs.controller;

import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bjd.ggs.service.GiftGramsService;
import org.bjd.ggs.util.FileRenameUtil;
import org.bjd.ggs.util.ResizeImageUtil;
import org.bjd.ggs.vo.Comment;
import org.bjd.ggs.vo.Filter;
import org.bjd.ggs.vo.Like;
import org.bjd.ggs.vo.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class GiftGramController {

	private GiftGramsService giftgramService;
	
	private FileRenameUtil fileRenameUtil;
	
	private ResizeImageUtil resizeImageUtil;

	public void setFileRenameUtil(FileRenameUtil fileRenameUtil) {
		this.fileRenameUtil = fileRenameUtil;
	}
    public void setGiftgramService(GiftGramsService giftgramService) {
		this.giftgramService = giftgramService;
	}
    
    public void setResizeImageUtil(ResizeImageUtil resizeImageUtil) {
		this.resizeImageUtil = resizeImageUtil;
	};
    
	@RequestMapping(value="/ajax/gift",method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<org.bjd.ggs.vo.GiftGram> GiftGram(int num) {
		
		return giftgramService.getList(num); 
	}
	@RequestMapping(value="giftgram/{no}/ajax/{page}",method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<Comment> image(@PathVariable String page) {
		return giftgramService.getCommentList(page);
	}
	 
	@RequestMapping(value="giftgram/{no}/ajax/like/{page}",method=RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Like getlike(@PathVariable String page) {
		System.out.println("좋아요 리스트");
		return giftgramService.getLike(page);
	}
	
	@RequestMapping(value="giftgram/{no}/like/{page}",method=RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody
	public int insertlike(@PathVariable String page, HttpSession session) {
		System.out.println("liketest");
		Member loginMember = (Member)session.getAttribute(Member.LOGIN);
		
		return giftgramService.findUser(loginMember.getNo(), page);
	}
	
	
	
	
	
 	@RequestMapping(value="/Gift",method=RequestMethod.GET)
	public String bestGiftGram(Model model, HttpSession session) {
		
		model.addAllAttributes(giftgramService.getBestList());
		
		return "/GiftGram";
	}
	
 	@RequestMapping(value="/ajax/gift/filter",method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public List<org.bjd.ggs.vo.GiftGram> giftGramFilter(Filter filter) {
		return giftgramService.getFilterList(filter); 
	}
 	
 	@RequestMapping(value="/GiftGramDetail/{no}/{page}",method=RequestMethod.GET)
 	public String detailList(Model model, HttpSession session) {
 		System.out.println("이건 실행 안되나?");
 		return "redirect:gifteGramDetail/{no}/{page}";
 	}
 	
 	@RequestMapping(value="giftgram/{no}/{page}",method=RequestMethod.GET)
	public String giftGramDetail (@PathVariable int no ,@PathVariable int page, Model model, HttpSession session) {
 		
 		giftgramService.hitUpdate(page);
 		
 		Member loginMember;
 		
 		if(session != null) {
 		    loginMember = (Member)session.getAttribute(Member.LOGIN);
 	 		System.out.println("detail");
 		}
 		else {
 			loginMember = new Member();
 		}
 		
 		model.addAllAttributes(giftgramService.getDetailGram(no,page));
 		System.out.println();
 		return "/GiftGramDetail";
	};
 	
 	@RequestMapping(value="giftgram/{no}/comment/insert/{page}",method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
 	public int cmtInsert(@PathVariable int no, @PathVariable int page, String content , HttpSession session) {
 		System.out.println("댓글 입력");
 		
 		Member loginMember = (Member)session.getAttribute(Member.LOGIN);
		
 		Comment cmt = new Comment();
 		
 		cmt.setMemberNo(loginMember.getNo());
 		cmt.setPostNum(page);
 		cmt.setContent(content); 
 		
 		giftgramService.cmtInsert(cmt);
 		 
 		return 1;
 		
 	}
 	
 	@RequestMapping(value="/wirte/giftGram",method=RequestMethod.POST)
 	public String writeGram(String[] image, String content, HttpSession session) {
 		
 		System.out.println("이미지 등록 시작");
 		
 		for(String img : image)
 		{
 			System.out.println(img);
 		}
 		
 
 		Member loginMember = (Member)session.getAttribute(Member.LOGIN);
 		
 		giftgramService.gramInsert(image, content, loginMember.getNo());
 		
 		return "redirect:/Gift";
 	}
 	
	

	@RequestMapping(value = "/ajax/upload", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String uploadImage(HttpServletRequest request, String type, MultipartFile uploadImg) {

		ServletContext sc = request.getServletContext();

		String uploadPath = sc.getRealPath("upload");
		String imgPath = sc.getRealPath("img");

		System.out.println(uploadPath);

		System.out.println(uploadImg.getOriginalFilename());

		File file = new File(uploadPath + File.separator + uploadImg.getOriginalFilename());

		file = fileRenameUtil.rename(file);

		String src = "/";

		try {

			uploadImg.transferTo(file);

			resizeImageUtil.resize(file.getAbsolutePath(), imgPath + File.separator + file.getName(), 100, 100);

			src += file.getName();

			return "{\"src\":\"" + src + "\"}";

		} catch (Exception e) {
			e.printStackTrace();

			return "에러";
		}

	}
 	
 	
}
