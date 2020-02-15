<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.dao.UserMGMTDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>black_list</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/mypage.css">
    <style>
        body{
            background-color: #121212;
            font-size: 15px;
        }
        .subTmp{
            width: 900px;
            height: 550px;
        }

        #subscription ul{
            overflow: hidden;
        }

        .block{
            width: 100px;
            height: 100px;
            margin: 20px;
            display: inline-block;
            text-align: center;
            position: relative;
        }
        .block a{
            text-decoration: none;
            color: #fff;
        }
        .userPic>img{
            width: 80px;
            height: 80px;
            border-radius: 40px;
            margin:auto;
        }

        .userName{
            width: 100px;
            height: 20px;
            font-weight: 900;
            line-height: 20px;
        }
        .unblock{
            position: absolute;
            background-color: red;
            border:none;
            opacity: 0.6;
            top:34px;
            left: 24px;
            font-weight: bold;
            border-radius: 30px;
            font-size: 10px;
        }
        .unblock:hover{
            opacity: 1;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<% int type = 8; %>
<%@ include file="/WEB-INF/template/mypage_header.jsp" %>
<%
	List<User> blackList = UserMGMTDAO.selectBlock(userNo);
%>
<div id="blackList">
    <div id="blockedUsers" class="subTmp">
        <ul>
            <%for(User blocked:blackList){%>
                <li class="subscriber">
                    <div class="userPic"><img src="<%=blocked.getProfile()%>"/></div>
                    <div class="userName"><a href="/mypage.jsp?userNo=<%=blocked.getUserNo()%>"><%=blocked.getNickKo() %></a></div>
                </li>
            <%}%>
        </ul>
    </div>
</div>

<%@ include file="/WEB-INF/template/mypage_footer.jsp" %>

	<script src="js/jquery.js"></script>
	<script>
	var backgroundImage = "<%=user.getCoverArt()%>";
	</script>
	<script src="/js/mypage.js"></script>
<script>
    // 프로필 사진에 마우스오버 하면 구독,차단,이미지 편집 뜨는 기능
    $('.block').on("mouseenter",function () {
        $(this).css({"cursor":"pointer"});
        $('<button class="unblock">차단해제</button>').prependTo(this);
        return false;
    });

    // 프로필 사진에 마우스떼면 구독,차단,이미지 편집 없어지는 기능
    $('.block').on("mouseleave",function () {
        $(".block button").remove();
        return false;
    });
    $('body').on("click",".unblock",function () {
        if(!confirm("차단을 해제하시겠습니까?")){
            return false;
        };
    });
</script>
</body>
</html>