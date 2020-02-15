<%@page import="org.bjd.loopy.dao.SongsDAO"%>
<%@page import="org.bjd.loopy.vo.Song"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Song> list = SongsDAO.selectListTest();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>임시 뮤직플레이어 이니시에이터</title>
	<link rel="stylesheet" href="/css/reset.css" />
	<link rel="stylesheet" href="/css/default.css" />
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
	<style>
		#content {
	        width: 1200px;
	        height: 900px;
	        margin: auto;
	        position: relative;
        }
        #content>h1 {
        	font-weight: bold;
        	font-size: 2em;
        }
        #container li{
        	border: 1px solid #fff;
        }
        .songInfo {
        	width: 1200px;
        	overflow: hidden;
        }
        .songWrap {
        	width: 1200px;
        	overflow: hidden;
        }
        .songWrap>li {
        	float: left;
        	height: 42px;
        	line-height: 42px;
        	text-align: center;
        }
        .songWrap input {
        	vertical-align: middle;
        }
        .songWrap>li:nth-child(1) {
        	width: 42px;
        }
        .songWrap>li:nth-child(2) {
        	width: 85px;
        }
        .songWrap>li:nth-child(3) {
        	width: 828px;
        }
        .songWrap>li:nth-child(4) {
        	width: 105px;
        	
        }
        .songWrap>li:nth-child(5) {
        	width: 130px;
        }
	</style>
</head>
<body>
	<div id="content">
		<h1>쿠키에 저장된 다음 곡 목록을 받거나</h1>
		<h1>유저가 누른 앨범/컬렉션을 넣거나</h1>
		<h1>북마크 한 앨범/컬렉션을 넣거나</h1>
		<h1>테마 추천 컬렉션을 넣거나</h1>
					<form id="sendMusic" action="/ajax/playSong.jsp" method="post">
		<button type="submit" id="playBtn">플레이어로</button>
		<div id="container">
			<ul id="songList">
				<li class="songInfo">
					<ul class="songWrap">
						<li>선택</li>
						<li>PK번호</li>
						<li>곡 이름</li>
						<li>아티스트</li>
						<li>isValidWAV</li>
					</ul>
						<% for(Song song : list) { %>
						<ul class="songWrap">
							<li>
								<label>
								<input type="checkbox" title="선택" class="selectSong" />
								<input type="hidden" name="songNo" value="<%= song.getNo() %>" />
								</label>
							</li>
							<li><%= song.getNo() %></li>
							<li><%= song.getTitle() %></li>
							<li><%= song.getNickKo()%></li>
							<li><%= song.getCoverName() %></li>
						</ul>
						<% } %>
				</li>
			</ul>
		</div><!-- //#container -->
					</form>
	</div><!-- //#content -->
	<script src="/js/jquery.js"></script>
	<script>
		//localStorage.removeItem("songs");
	 	$("#sendMusic").submit(function(e) {
	 		
	 		localStorage.setItem("flag",false);
	 		
			e.preventDefault();
			window.open('/music_player.jsp','Loopy - 뮤직플레이어',"width=380,height=570")
		});//#sendMusic.submit() end
	</script>
</body>
</html>