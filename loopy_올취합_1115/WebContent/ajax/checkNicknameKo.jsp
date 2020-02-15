<%@page import="org.bjd.loopy.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String nickname1 = request.getParameter("nickname1");

//3초후에 응답
//Thread.sleep(3000);

int cnt1 = UsersDAO.selectCheckNicknameKo(nickname1);

%>
{"count":<%=cnt1 %>}
