<%@page import="org.bjd.loopy.vo.Emotion"%>
<%@page import="org.bjd.loopy.dao.EmotionsDAO"%>
<%@page import="org.bjd.loopy.dao.UsersDAO"%>
<%@page import="org.bjd.loopy.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userStr = request.getParameter("userNo");
	int userNo = 0;
	if(userStr!=null){
		userNo = Integer.parseInt(userStr);	
	}// if end

	User user = UsersDAO.selectOne(userNo);
	if(user==null){
%>
	<script> 
		alert(userNo+" 해당 유저가 존재하지 않습니다."); 
		location.href="/index.jsp"; 
	</script>
<%
	}else{
		Emotion emotion = EmotionsDAO.selectTodayEmotion(userNo);
		
%>
<div id="content">
        <div class="backgroundPic">
            <div class="myFirstName nameTmp">
                <a href=""><span id="nickname1"><%=user.getNickKo() %></span></a>
            </div>
            <div class="mySecondName nameTmp">
                <a href="">( <span id="nickname2"><%=user.getNickEn() %></span> )</a>
            </div>
            <%if(emotion==null){ %>
            <div class="emoticons">
                <ul>
                    <li class="moodExcited"><a title="excited" href="">excited</a></li>
                    <li><a title="happy" href="">happy</a></li>
                    <li><a title="okay" href="">okay</a></li>
                    <li><a title="sad" href="">sad</a></li>
                    <li><a title="angry" href="">angry</a></li>
                </ul>
            </div>
            <div class="emoPopUp"></div>
            <%} else{%>
            <div class="emoticons2">
                <ul>
                    <li class="moodExcited"><a title="excited" href="">excited</a></li>
                    <li><a title="happy" href="">happy</a></li>
                    <li><a title="okay" href="">okay</a></li>
                    <li><a title="sad" href="">sad</a></li>
                    <li><a title="angry" href="">angry</a></li>
                </ul>
            </div>
            <div class="emoPopUp2"></div>
            <%}%>
        </div><!--//.backgroundPic"-->
        <div id="myPage">
            <div class="menuBar">
                <div class="profilePic">
				    <div id="followingCheck">
				        <i class="fas fa-check"></i>
				    </div>
					<img src="<%=user.getProfile() %>"/>
                </div>
                <ul>
					<li<%if(type==1) {%> class="on"<%} %>><a href="mypage.jsp?userNo=<%=user.getNo() %>">내가 업로드한 곡</a></li>
			         <li<%if(type==2) {%> class="on"<%} %>><a href="mypage_subscription.jsp?userNo=<%=user.getNo() %>">구독</a></li>
			         <li<%if(type==3) {%> class="on"<%} %>><a href="mypage_album.jsp?userNo=<%=user.getNo() %>">앨범</a></li>
			         <li<%if(type==4) {%> class="on"<%} %>><a href="mypage_collection.jsp?userNo=<%=user.getNo() %>">컬렉션</a></li>
			         <li<%if(type==5) {%> class="on"<%} %>><a href="mypage_writetab.jsp?userNo=<%=user.getNo() %>">게시글</a></li>
			         <li<%if(type==6) {%> class="on"<%} %>><a href="mypage_soundsource1.jsp?userNo=<%=user.getNo() %>">소리 소스</a></li>
			         <li<%if(type==7) {%> class="on"<%} %>><a href="">통계</a></li>
                
                </ul>
            </div><!--//#menuBar-->

<!--
            <div class="searchEngine">
                <form>
                <input/> <button><i class="fas fa-search"></i><span id="search" class="screen_out">검색</span></button>
                <select>
                    <option>최신순</option>
                    <option>평점순</option>
                    <option>추천순</option>
                    <option>조회순</option>
                </select>
                </form>
            </div><!--//.searchEngine-->
            
            <div id="myUpload">
<%} %>
                