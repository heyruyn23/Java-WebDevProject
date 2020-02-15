<%@page import="org.bjd.loopy.dao.SongsDAO"%>
<%@page import="org.bjd.loopy.vo.Song"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.vo.Playlist"%>
<%@page import="org.bjd.loopy.dao.PlaylistsDAO"%>
<%@ page language="java" 
contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* String title =request.getParameter("");
String nickKo =request.getParameter("");
String nickEn = request.getParameter("nickEn");
String hit = request.getParameter("hit"); */


List<Song> list = SongsDAO.selectArtList();

ObjectMapper om = new ObjectMapper();

String json = om.writeValueAsString(list);

%>
<%=json%>

