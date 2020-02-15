<%@page import="org.bjd.loopy.dao.SongsDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.vo.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>작품</title>
    <link rel="styleSheet" href="/css/art.css"/>
   
   
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <style>
       
        #artistList{
            position: relative;
            width: 1200px;
            margin: auto;
        }

        .artist{
            width: 1200px;
            position: relative;
            background-color:#311b92;
            margin-bottom: 20px;
        }


        .contentsHeader{
            width: 1200px;
            height: 50px;

        }


        .bar{
            width: 1200px;
            height: 210px;
            background-color: #383838;
        }
        .list{
            width: 210px;
            height: 210px;
            background-color: #00AAB4;

        }

        .profile{
            margin: 5px;
            border-radius: 30px;

        }
        .contentsHeader .nickName{
            position: absolute;
            margin: 5px;
            line-height:40px;
            font-size: 20px;
            font-weight: bold;

        }

        .play{
            position: absolute;
            right: 10px;
            line-height:50px;
            font-size: 16px;
            font-weight: bold;

        }
        .playAllBtn{
            width: 30px;
            height: 30px;
            position: absolute;
            right: 90px;
            top:10px;
            border-radius: 100px;
            outline: none;
            background-color: #5f5f5f;
        }
        .playAllBtn:hover{
            color: black;
            cursor: pointer;
        }

        .cover{
            width: 210px;
            height: 120px;
            background-color: black;
            position: absolute;
        }

        .playForm{
            position: absolute;
            width: 210px;
            height: 210px;
            text-align: center;
            line-height: 120px;
            font-size: 50px;
            opacity: .6;
            cursor: pointer;
           /*  z-index: 1; */


        }


        .playForm:hover{
            transform: scale(1.05);
            color: red;
        }

        .playForm:active{

        }

        .playTime{
            position: absolute;
            font-size: 15px;
            bottom:5px;
            right: 5px;


        }
        .information{
            width: 210px;
            height: 90px;
            background-color: #aaaaaa;
            position: absolute;
         /*    bottom: 0px; */
            font-size: 15px;
            font-weight: bold;
            top:120px;

        }
        .info{
            position: absolute;
            color: black;
            font-weight: bold;
        }

        .list .nickName{
            top:5px;
            left: 5px;
            color: #311b92;
            font-weight: bold;
            z-index: 2;

        }
        .title{
            top:28px;
            left: 5px;

        }
        .playNum{
            left: 5px;
            bottom: 5px;
        }
        .grade{
            top: 5px;
            right: 5px;
        }
        .like{
            top: 28px;
            right: 5px;
        }

       .allList li{
            float: left;
            position: relative;
        }
        .allList li:nth-child(1){
            margin-right: 37.5px;

        }
        .allList li:nth-child(2){
            margin-right: 37.5px;

        }
        .allList li:nth-child(3){
            margin-right: 37.5px;

        }
        .allList li:nth-child(4){
            margin-right: 37.5px;

        }
       

        .fa-play-circle{
            opacity: 0.5;
        }
        
        
        .songBtn{
        	position: absolute;
        	width: 25px;
        	height: 25px;
        	background-color: #311b92;
        	color: white;
        	border-radius: 5px;
        	top: 10px;
        	left: 180px;
        	cursor: pointer;
        	z-index: 3;
        	font-weight: bold;
        	outline: none;
        	font-size: 20px;
        }
        
        .songAdd{
        	position:absolute;
        	width:180px;
        	height:40px;
        	left:-9999px;
        	top:2px;
        	z-index:3;
        	border-radius: 8px;
        }
        
        .albumAdd{
       		width:178px;
        	height:18px;
        }
        
        .albumAdd a{
       		width:178px;
        	height:18px;
        	display: block;
        	background: gray;
        	cursor: pointer;
        	text-indent: 5px;
        	transition: .5s ease;
        }
        
        .albumAdd a:hover{
        	background: #311b92;
        	box-shadow: 0 16px 28px 0 rgba(49, 27, 146, 0.22),
        				 0 25px 55px 0 rgba(49, 27, 146, 0.21);
        }
        
        
        .collectionAdd{
       		width:178px;
        	height:18px;
        }
        
        .collectionAdd a{
       		width:178px;
        	height:18px;
        	display: block;
        	background: gray;
        	cursor: pointer;
        	text-indent: 5px;
        	transition: .5s ease;
        }
        
        .collectionAdd a:hover{
        	background: #311b92;
        	box-shadow: 0 16px 28px 0 rgba(49, 27, 146, 0.22),
        				 0 25px 55px 0 rgba(49, 27, 146, 0.21);
        }
        
        
      
		
        .playListAdd{
       		width:178px;
        	height:18px;
        }
        
        .playListAdd a{
       		width: 178px;
        	height: 18px;
        	display: block;
        	background: gray;
        	border-top: 0;
        	cursor: pointer;
        	text-indent: 5px;
        }
        
        .playListAdd a:hover{
        	background: #311b92;
        	box-shadow: 0 16px 28px 0 rgba(49, 27, 146, 0.22),
			 			0 25px 55px 0 rgba(49, 27, 146, 0.21);
        }

        
    



    </style>
</head>
<body>

<%@ include file="/WEB-INF/template/header.jsp" %>
<!--아티스트 순 템플릿 스크립트-->
<% int type=1; %>
<%@ include file="/WEB-INF/template/art_header.jsp" %>


<div class="songAdd">
	<div class="albumAdd">
		<a href="/main_album_popup.jsp">앨범에 추가</a>
	</div>
	<div class="collectionAdd">
		<a href="/main_collection_popup.jsp">컬렉션에 추가</a>
	</div>
	<div class="playListAdd">
		<a href="">현재플레이어에 추가</a>
	</div>
</div>

<!--아티스트 순 템플릿 스크립트-->
<script type="text/template" id="contentsListTmp">
    <@ _.each(contentsLists,function(contentsList){ @>
    <div class="artist">
        <div class="contentsHeader"><a href="/musicplay.jsp"><img src="profile/<@=contentsList.profile@>" width="40" height="40" class="profile"/><span class="nickName"><@=contentsList.nickName@></span></a><button class="playAllBtn"><i class="fas fa-play"></i><span class="screen_out">재생</span></button><span class="play">전체 듣기</span></div><!--contents header-->
        <div class="bar">
            <ul class="allList">
                <@ _.each(contentsList.musicList,function(music){ @>
                <li>
                    <div class="song">
                        <div class="cover">					
                            <a href="/musicplay.jsp" ><div class="playForm"><i class="fas fa-play-circle"></i></div></a>
                            <span class="playTime"><@=music.playTime@></span>
                        </div><!--cover end-->
                        <div class="information">
							<input type="hidden" class="songNo" value="<@=music.no@>"/>
                            <a href="/mypage.jsp" class="info nickName"><@=music.nickName@></a>
                            <span class="info title"><@=music.title@></span>
                            <span class="info playNum"><i class="fas fa-play"></i><@=music.playNum@></span>
                            <span class="info grade"><i class="far fa-star"></i> <@=music.grade@></span>
                            <span class="info like"><i class="fas fa-thumbs-up"></i> <@=music.like@></span>
                        </div><!--information end-->
                    </div><!--list-->
                </li>
                <@ }) @>
            </ul><!--allList-->
        </div><!--bar -->
    </div><!--artist end-->
    <@ }) @>
</script>
<!--아티스트 순 템플릿 스크립트 end-->



<!--아티스트 순 템플릿 마크업-->
<div id="artistList">

    <div class="artist">
        <div class="contentsHeader"><a href="/mypage.jsp"><img src="profile/buzz.jpg" width="40" height="40" class="profile"/><span class="nickName">nickName</span></a><button class="playAllBtn"><i class="fas fa-play"></i><span class="screen_out">재생</span></button><span class="play">전체 듣기</span></div><!--contents header-->
        <div class="bar">
            <ul class="allList">         
                <li>
                    <div class="song">
                        <div class="cover">		                 		
                            <a href="/musicplay.jsp" ><div class="playForm"><i class="fas fa-play-circle"></i></div></a>
                            <span class="playTime">playTime</span>
                        </div><!--cover end-->
                        <div class="information">      
                            <a href="/mypage.jsp" class="info nickName">nickName</a>
                            <span class="info title">title</span>
                            <span class="info playNum"><i class="fas fa-play"></i>playNum</span>
                            <span class="info grade"><i class="far fa-star"></i>grade</span>
                            <span class="info like"><i class="fas fa-thumbs-up"></i>like</span>
                        </div><!--information end-->
                    </div><!--list-->
                </li>
            </ul><!--allList-->
        </div><!--bar -->
    </div><!--artist end-->
</div><!--artistList end-->
<!--아티스트 순 템플릿 마크업 end-->




<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@(.+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};
    
	
    var $songAdd=$(".songAdd");

    
    
    //상단 탭 이동
    $("#tab>.tab").click(function () {
        $(".on").removeClass("on").before();
        $(this).addClass("on");

    });
    //상단 탭 이동 end

    
    
    //아티스트순 템플릿
    var tmp = _.template($("#contentsListTmp").html());
    
    function artistList() {
		
	

	    $.ajax({
	        url: "/ajax/artArtistList.jsp",
	        type: "get",
	        dataType: "json",
	
	
	        error:function () {
	        },
	
	        success:function (json) {
	            $("#artistList").append(tmp({contentsLists:json}))
	        }

    	});
    //아티스트순 템플릿end
    
    }//artistList() end
    
   
    
    
    
    $('#artistList').on("mouseenter",'.songWrap',function () {
		// 다른 유저라면
		$('<button class="songBtn subC">+</button>').prependTo(this);
	});
    
    $('#artistList').on("mouseleave",'.songWrap',function () {
    	$(".songWrap .songBtn").remove();
    });


    //무한 스크롤링
    $(window).scroll(function () {
        var sTop = $(this).scrollTop();

        console.log("스크롤탑:"+sTop);

        //브라우저의 높이
        var wTop = $(window).height();

        console.log("스크롤탑:"+sTop+"/브라우저높이:"+wTop);

        //문서의 높이
        var dTop = $(document).height();


        if((dTop-30)<=wTop+sTop) {

            $.ajax({
                url: "ajax/contentsLists.json",
                type: "get",
                dataType: "json",

                error:function () {

                },

                success:function (json) {

                    $("#artistList").append(tmp({contentsLists:json}))

                }

            });

        }
        console.log("스크롤탑:"+sTop+"/브라우저높이:"+wTop+"/문서높이:"+dTop);

    });
    //무한 스크롤링 end
    
    
    $("#artistList").on('click', '.songBtn',function (e) {
        //유저가 클릭한 좌표
        var x = e.clientX;
        var y = e.clientY;
        
        $songAdd.css({
        	left:x,
        	top:y
        });
        
        return false;
    });//#body click() end
    
    
	$("body").click(function(e) {
    	$songAdd.css({
    		left: "-99999px"
    	});
    });  
   

</script>
</body>
</html>