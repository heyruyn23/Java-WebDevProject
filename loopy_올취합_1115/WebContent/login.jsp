<%@page import="org.bjd.loopy.dao.UsersDAO"%>
<%@page import="org.bjd.loopy.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
/* 그런데 여기서 받아오는 파라미터는 정해져있는 것 아닌가?  */

User user = new User();

user.setEmail(email);
user.setPassword(password);

User loginUser = UsersDAO.selectLogin(user);

session.setAttribute("loginUser", loginUser);

String referer = request.getHeader("referer");

String url = "/index.jsp";

if(referer != null) {
	url = referer;
}//if end

response.sendRedirect(url);
%>