<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String title = request.getParameter("title");
	String duration = request.getParameter("duration");
	String info = request.getParameter("info");
	String genre = request.getParameter("genre");
	String[] themes = request.getParameterValues("theme");
	String pubVeri = request.getParameter("pubVeri");
	String album = request.getParameter("album");
	String comVeri = request.getParameter("comVeri");
	String statVeri = request.getParameter("statVeri");
	String srcVeri = request.getParameter("srcVeri");

%>
<%= title %>
<%= duration %>
<%= info %>
<%= genre %>
<%= pubVeri %>
<%= album %>
<%= comVeri %>
<%= statVeri %>
<%= srcVeri %>