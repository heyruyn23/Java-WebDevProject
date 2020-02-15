<%@page import="org.bjd.loopy.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String nickname2 = request.getParameter("nickname2");

//3초후에 응답
//Thread.sleep(3000);

int cnt2 = UsersDAO.selectCheckNicknameEn(nickname2);

%>
{"count":<%=cnt2 %>}