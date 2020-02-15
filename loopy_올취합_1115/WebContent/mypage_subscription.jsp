<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.dao.UserMGMTDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>subscription</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/mypage.css">
    <style>
    
        body{
            background-color: #121212;
            font-size: 15px;
        }

        #subscriptionList{
            text-align: center;
            margin-top: 35px;
        }

        .subBtn{
            width: 148px;
            height: 38px;
            font-size: 20px;
            line-height: 19px;
            font-weight:900;
            cursor: pointer;
            border:1px solid #424242;
            background-color: #311b92;
            color: #fff;
            display: inline-block;
        }

        .subTmp{
            width: 900px;
            height: 550px;
            clear:both;
        }

        #subscription ul{
            overflow: hidden;
        }

        .subscriber{
            width: 100px;
            height: 100px;
            margin: 20px;
            position: relative;
            float:left;
            /*질문 부모와 자식간의 마진겹침현상
            부모에 overflow:hidden을 주면 된다.*/
        }
        .userPic:hover{
            cursor: pointer;
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
        .twoBtn{
            position: absolute;
            border-radius: 20px;
            font-size: 10px;
            width: 35px;
            height:35px;
            top:20px;
            font-weight: 900;
            background-color: transparent;
            border: none;
            color: #fff;
        }
        .unsubscribe{
            left:-15px;
        }
        .unsubscribe:hover{
            background-color: indianred;
            box-shadow: 0px 0px 4px indianred;
        }
        .block{
            right:-15px;
        }
        .block:hover{
            background-color: #9FA8DA;
            box-shadow: 0px 0px 4px #9FA8DA;
        }
        .userName>a{
            text-decoration: none;
            color:#fff;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<% int type = 2; %>
<%@ include file="/WEB-INF/template/mypage_header.jsp" %>
<%
	List<User> followerList = UserMGMTDAO.selectFollower(userNo);
%>
<div id="subscriptionList">
        <div class="followerBtn subBtn">follower</div>
        <div class="followingBtn subBtn">following</div>
        <div id="subscription" class="subTmp">
            <ul>
            <%for(User subscription:followerList){%>
                <li class="subscriber">
                    <div class="userPic"><img src="<%=subscription.getProfile()%>"/></div>
                    <div class="userName"><a href="/mypage.jsp?userNo=<%=subscription.getUserNo()%>"><%=subscription.getNickKo() %></a></div>
                </li>
            <%}%>
            </ul>
        </div>
    </div>
    <script type="text/template" id="followerTmp">
    <@_.each(followerList,function(follower){ @>
	    <li class="subscriber">
	        <div class="userPic"><img src="<@=follower.profile@>"/></div>
	        <div class="userName"><a href="/mypage.jsp?userNo=<@=follower.userNo @>"><@=follower.nickKo @></a></div>
	    </li>
	<@})@>
    </script>
    <script type="text/template" id="followingTmp">
    <@_.each(followingList,function(following){ @>
	    <li class="subscriber">
	        <div class="userPic"><img src="<@=following.profile@>"/></div>
	        <div class="userName"><a href="/mypage.jsp?userNo=<@=following.userNo @>"><@=following.nickKo @></a></div>
	    </li>
	<@})@>
    </script>
<%@ include file="/WEB-INF/template/mypage_footer.jsp" %>

    <script src="/js/jquery.js"></script>
    <script src="/js/underscore-min.js"></script>
    <script>
    var backgroundImage = "<%=user.getCoverArt()%>";
    </script>
    <script src="/js/mypage.js"></script>
    <script>

	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@(.+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};
	
	
	 var followerTmp = _.template($("#followerTmp").html());
	 var followingTmp = _.template($("#followingTmp").html());
		
	
    // follower를 클릭하면 follower 테이블에서 정보 불러오고
   	$(".followerBtn").click(function() {
		$(".subTmp>ul").empty();

		$.ajax({
			url:"/ajax/follower.jsp",
			type:"post",
			dataType:"json",
			data:{userNo:<%=userNo%>},
			error:function(){
				alert("에러!");
			},
			success:function(json){
	            $(".subTmp>ul").append(followerTmp({followerList:json}));
			}
		});
	});
    

    // following을 클릭하면 following 테이블에서 정보를 불러온다.
    $(".followingBtn").click(function() {
		$(".subTmp>ul").empty();

		$.ajax({
			url:"/ajax/following.jsp",
			type:"post",
			dataType:"json",
			data:{userNo:<%=userNo%>},
			error:function(){
				alert("에러!");
			},
			success:function(json){
	            $(".subTmp>ul").append(followingTmp({followingList:json}));
			}
		});
	});
    </script>
</body>
</html>