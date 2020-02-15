<%@page import="org.bjd.loopy.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header">
    <%
    	User loginUser = 
    		(User)session.getAttribute("loginUser");
    %>
	<div class="headerIndex">
	   <h1 class="logo"><a class="screen_out" href="/index.jsp">Loopy</a></h1>
	   <div class="songList">
	        <a href="/art_page_artist.jsp">작품</a>
	   </div><!--songList end-->
	  <div class="looper">
	      <a href="">루퍼</a>
	  </div><!--looper end-->
	  <div class="community">
	      <a href="/community_allBoard_page01.jsp">커뮤니티</a>
	  </div><!--community end-->
	  <div class="ranking">
	      <a href="/main_rank_rp.jsp">랭킹</a>
	  </div><!--ranking end-->
	  <div class="betting">
	      <a href="/betting.jsp">배팅</a>
	  </div><!--betting end-->
  	  <div class="totalSearch">
 	  <form action="" method="get">
	        <input name="search"
	               value=""
	               placeholder="통합 검색"
	        />
	        <button type="submit">
	            <i class="fas fa-search"></i>
	            <span class="screen_out">검색</span>
	        </button>
	   </form>
	   </div><!-- .totalSearch end--> 
	  
	<%if(loginUser == null) {%>
	  <div class="login">
	      <form action = "login.jsp" method="post">
	          <fieldset>
	              <legend class="screen_out">로그인 폼</legend>
	              <input type="text"
	                             placeholder="이메일"
	                             title = "이메일 입력창"
	                             size = "20"
	                             name = "email"
	              >
	              <input id= "password"
	                         type="password"
	                         placeholder="패스워드"
	                         title = "패스워드 입력창"
	                         size = "20"
	                         name = "password"
	              >
	              <button type="submit">로그인</button>
	          </fieldset>
	      </form>
	  </div><!--login end-->
	  <div>
	      <a href="/insert_userForm.jsp">회원가입</a>
	  </div><!--div end-->
	<%} else{ %>
	<div class="user">
	<%if(loginUser.getProfile() != null){ %>
		<div class="profile">
			<img src="<%=loginUser.getProfile()%>" width="40" height="40"/>
		</div><!-- profile end -->
	<%}else{%>
		<div class="profile">
			<img src="/profile/userDefault.jpg" width="40" height="40"/>
		</div><!-- profile end -->
	<%} %>
		<div class="myPage">
			<a href="/mypage.jsp?userNo=<%=loginUser.getNo() %>">myPage</a>
		</div>
		<div class="logout">
			<a href="/logout.jsp">로그아웃</a>
		</div>
<!-- 		<div class="message">
			<a href=""><i class="far fa-envelope"><span class="screen_out">메세지 함</span></i></a>
		</div> -->
	</div><!-- user end --> 
	<%} %>
            
    </div><!--.headerIndex end-->
</div><!--header end-->