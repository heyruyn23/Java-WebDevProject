<%@page import="org.bjd.loopy.vo.BLKTag"%>
<%@page import="org.bjd.loopy.dao.BLKTagDAO"%>
<%@page import="org.bjd.loopy.vo.Tag"%>
<%@page import="org.bjd.loopy.dao.TagsDAO"%>
<%@page import="org.bjd.loopy.vo.User"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="org.bjd.loopy.dao.PlaylistsDAO"%>
<%@page import="org.bjd.loopy.vo.Playlist"%>
<%@ page language="java" 
contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

boolean flag = false;

try {
User loginUser = (User)session.getAttribute("loginUser");

//String nickKo = loginUser.getNickKo();

//int userNo = loginUser.getNo();
//int userNo = 1;

String name = request.getParameter("name");
//String defaultmsg = nickKo + "님의 컬렉션입니다.";

String[] tags = request.getParameterValues("tag");

String type = request.getParameter("type"); 

Playlist playlist = new Playlist();

playlist.setUserNo(1); //1 대신에 loginUser.getNo();
playlist.setAcType(type);
playlist.setName(name);
playlist.setCoverName("default.png");
//playlist.setContent(defaultmsg);

int result = PlaylistsDAO.insert(playlist);

for(String tagName : tags) {
	System.out.println(tagName);
	
	int tagNo = 0;
	
	Tag tag = TagsDAO.selectOne(tagName);
	
	if(tag!=null) {
		
		/* System.out.println("true"); */
		tagNo = tag.getNo();
		
	}else {
		
	/* 	System.out.println("false"); */
		
		Tag newTag = new Tag(tagName);
		
		/* System.out.println(newTag.getTag()); */
		
		int result2 = TagsDAO.insert(newTag);
		
	/* 	System.out.println(result2); */
		
		tagNo = newTag.getNo();
		
	}

	//System.out.println(playlist.getNo());
	//System.out.println(tagNo);
	
	BLKTag blkTag = new BLKTag(tagNo,type, playlist.getNo());
	
	BLKTagDAO.insert(blkTag);
	
	//TagsDAO.insert(tag);
}//for end

flag = true;
}catch(Exception e) {
	e.printStackTrace();
}

%>
{"result":<%=flag%>}
