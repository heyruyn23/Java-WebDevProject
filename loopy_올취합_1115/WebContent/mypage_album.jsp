<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Album</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/mypage.css"/>
    <link rel="stylesheet" href="/css/album_card.css"/>
    <style>
        body{
            background-color: #121212;
            font-size: 15px;
        }
        #album{
            width: 950px;
            min-height:660px;
            padding: 10px 25px;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<% int type=3; %>
<%@ include file="/WEB-INF/template/mypage_header.jsp" %>
<div id="album">
    <ul id="albumList">

    </ul>
</div><!--//#album-->

<%@ include file="/WEB-INF/template/album_card.jsp" %>
    
    
<%@ include file="/WEB-INF/template/mypage_footer.jsp" %>
    <script src="js/jquery.js"></script>
    <script src="js/underscore-min.js"></script>
    <script>
    var backgroundImage = "<%=user.getCoverArt()%>";
    </script>
	<script src="/js/mypage.js"></script>
    <script>

//collectionIcon이라는 것은 또한 새롭게 생기는 요소이므로 새롭게 생성이 안되는 요소를 부모로 잡는다.
$("#albumList").on("click",".bookmark",function () {
    if($(this).children().eq(0).hasClass("far fa-star")){
        $(this).children().eq(0).attr("class","fas fa-star").css("color","yellow");
    }
    else{
        if(!confirm("북마크를 해지하시겠습니까?")){
            return false;
        }
        $(this).children().eq(0).attr("class","far fa-star").css("color","white");
    }
    return false; // 이벤트 버블링 (전파) 방지
});

$("#album").on("click",".album",function () {
    $(".playingMusic").removeClass("playingMusic");
    $(this).addClass("playingMusic");
    location.href="/album_detail_page.jsp";
});

$("#albumList").on("click",".play",function () {
    if($(this).children().hasClass("fas fa-play-circle")){
        $(".play i").attr("class","fas fa-play-circle");
        $(this).children().attr("class","fas fa-pause-circle");
    }else{
        $(this).children().attr("class","fas fa-play-circle");
    }
    return false; // 이벤트 버블링 (전파) 방지
});
	
 // 언더스코어 템플릿
var tmp = _.template($("#albumTmp").html());

 
    for(var i=0; i<10; i++){
	    $("#albumList").append(tmp());
	}
    
    
$(window).scroll(function () {
    // 스크롤탑
    var sTop=$(this).scrollTop();

    // 브라우저의 높이
    var wTop=$(window).height();

    // 문서의 높이
    var dTop = $(document).height();

    if((dTop-50)<=wTop+sTop){
        // 언더스코어 템플릿 이용해서 추가
        for(var i=0; i<20; i++){
            $("#albumList").append(tmp());
            var height=$("#album").css("height");
            $("#album").css("height",height+200);
        }
    }//if end
    console.log("스크롤탑:"+sTop+"/브라우저 높이:"+wTop+"/문서의 높이:"+dTop);
}); //scroll() end
    
    </script>
</body>
</html>