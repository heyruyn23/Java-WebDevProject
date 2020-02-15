<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="org.bjd.loopy.dao.UserMGMTDAO"%>
<%@page import="org.bjd.loopy.vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("userNo");
	// 팔로워 목록을 리스트로
	List<User> followingList = UserMGMTDAO.selectFollowing(Integer.parseInt(no));
	
	ObjectMapper om = new ObjectMapper();

	// 리스트를 json으로
	String json = om.writeValueAsString(followingList);
%>
<%=json %>