<%@page import="org.bjd.loopy.util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//기본 WAS 경로
	String root = request.getServletContext().getRealPath("");
	//원본 파일 경로
	String uploadPath = root + "upload" + File.separator;
	//프로필 사진 모아놓는 폴더 경로(썸네일)
	String profilePath = root + "profile" + File.separator;
	
	MultipartRequest mr = new MultipartRequest(request, uploadPath, 1024*1024*100, "UTF-8",
			new DefaultFileRenamePolicy());
	
	String fileName = mr.getFilesystemName("uploadImg");
	
	String type = mr.getParameter("type");
	
	String src = "/";
	
	switch(type) {
	case "P" : 
		src+="profile/";
        //ResizeImage유틸 이용하여 profile폴더에 짤라서 넣고 그 이름을 리턴
		ResizeImageUtil.resize(uploadPath+fileName,profilePath+fileName,140); // 원본 소스, 소스 이름, 사이즈
		break;
	case "B" : 
		src+="upload/";
		break;
	}//switch end
	
	src+= fileName;
	
%>
{"src":"<%=src%>"}