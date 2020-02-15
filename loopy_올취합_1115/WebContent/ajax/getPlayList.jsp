<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.vo.Playlist"%>
<%@page import="org.bjd.loopy.dao.PlaylistsDAO"%>
<%@ page language="java" 
contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%



String acType = request.getParameter("acType");

String userNoStr = request.getParameter("userNo");

int userNo = Integer.parseInt(userNoStr);

Playlist playlist = new Playlist(acType,userNo);

List<Playlist> list= PlaylistsDAO.selectMyList(playlist);

ObjectMapper om = new ObjectMapper();

String json = om.writeValueAsString(list);

%>
<%=json%>


