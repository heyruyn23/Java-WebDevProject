<%@page import="org.bjd.loopy.vo.PageVO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="org.bjd.loopy.dao.RepliesTextsDAO"%>
<%@page import="org.bjd.loopy.vo.ReplyText"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String noStr = request.getParameter("no");
	String pageNoStr = request.getParameter("pageNo");

	int no = Integer.parseInt(noStr);
	int pageNo = Integer.parseInt(pageNoStr);
	
	PageVO pageVO = new PageVO(pageNo,10,no);

	List<ReplyText> list = RepliesTextsDAO.selectList(pageVO);
    
    ObjectMapper om = new ObjectMapper();
    
    String json  = om.writeValueAsString(list);
%>
<%=json %>
