<%@page import="org.bjd.loopy.dao.TextsDAO"%>
<%@page import="org.bjd.loopy.vo.Text"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		
	

	String boardType = request.getParameter("boardType");
	String title = request.getParameter("txtTitle");
	String contents = request.getParameter("contents");
	String trace = request.getParameter("trace");
	
	Text text = new Text();
	
	text.setBoard(boardType);
	text.setRef(trace);
	text.setTitle(title);
	text.setUserNo(1); // 추후 바꿀 것
	text.setText(contents);
	
	int result = TextsDAO.insert(text);
	
	System.out.println(result);
	
	//response.sendRedirect("");
	
%>
