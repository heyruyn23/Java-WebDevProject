<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!--header-->
<div id="allIndexHeader">
    <div id="allIndexHeaderBox">
        <div id="allIndexHome"><a href="/index"><i class="fas fa-home"></i></a></div>
        <div><a href="/pickme">픽미픽미</a></div>
        <div><a href="/Gift">#선물스타그램</a></div>
        <div class="all_index_dropdown">
            <button class="all_index_dropbtn">커뮤니티</button>
            <div class="all_index_dropdown-content">
                <div><a href="/giveBoard">나도 산타다</a></div>
                <div id="freeGo"><a href="/freeBoard" data-page='1'>자유게시판</a></div>
            </div>
        </div>
        <div><a href="/eventMain">EVENT</a></div>
        <c:choose>
        <c:when test="${loginMember==null }">
        <div><a href="/loginForm">로그인</a></div>
		<div><a href="/join">회원가입</a></div>
		</c:when>
		<c:otherwise>
        <div><a href="/mypage?no=${loginMember.no} "><strong>MyPage</strong></a></div>
        <div><a href="/customGift">맞춤선물</a></div>
        <div><form action="/session" method="POST">
        <input type="hidden" name="_method" value="DELETE" />
        <button class="all_index_logoutBtn">로그아웃</button>
        </form></div>
		</c:otherwise>
		</c:choose>
    </div>
</div>