<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="org.bjd.loopy.dao.SongsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.bjd.loopy.vo.Song"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] param = request.getParameterValues("songNo");

	String inputParam = new String();
	
	int size = param.length;
	
	for(int i = 0 ; i < size ; i++) {
		if(i == size - 1) {
			inputParam = inputParam + param[i];
		}else {
			inputParam = inputParam + param[i] + ",";
		}//if~else end
	}//for end
	
	List<Song> list = SongsDAO.selectList(inputParam);
	
	ObjectMapper om = new ObjectMapper();
	
	String json = om.writeValueAsString(list);
	
%>
<%=json%>

