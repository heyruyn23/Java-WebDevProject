<%@page import="org.bjd.loopy.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email = request.getParameter("email");

int cnt = UsersDAO.selectCheckEmail(email);

%>
{"count": <%=cnt%>}