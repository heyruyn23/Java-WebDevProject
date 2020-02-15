<%@page import="org.bjd.loopy.dao.UsersDAO"%>
<%@page import="org.bjd.loopy.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String id = request.getParameter("id");

	String address1 = request.getParameter("emailAddress");
	
	String address2 = request.getParameter("address");
	
	String password = request.getParameter("password");
	
	String nicknameKo = request.getParameter("nickname1");
	
	String nicknameEn = request.getParameter("nickname2");
	
	String email = null;
	
	if(address1 != ""){
		email = id +"@"+ address1;
	}else{
		email = id +"@"+ address2;
	}// if~ else end
	
	User user = new User();
	
	user.setEmail(email);
	user.setPassword(password);
	user.setNickKo(nicknameKo);
	user.setNickEn(nicknameEn);	
	//user.setVerification(verification);
	// java jms email 검색해서 하기
	// xml에서 1로 넣어주기
	int result = UsersDAO.insert(user);
	response.sendRedirect("index.jsp");

%>
<%=email%>
<%=password%>
<%=nicknameKo%>
<%=nicknameEn%>

