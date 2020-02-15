<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	session.invalidate();

	String referer = request.getHeader("referer");

	String url = "/index.jsp?page=1";

	if(referer!=null) {
		url = referer;
	}//if end
	
	response.sendRedirect(url);

%>