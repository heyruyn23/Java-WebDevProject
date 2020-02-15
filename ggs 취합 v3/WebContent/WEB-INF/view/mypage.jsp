<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage | GiftGuideService</title>
 	<%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/mypage.css">
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div class="mypage_main_img">마이페이지</div>
<div id="mypageContentSize">
    <div class="mypage_content_size" id="mypageFreeTitles">
        <span>자유게시판</span>
        <div>
            <ul>
                <li> <a href="">명절에 어떤 선물을 사죠..?</a></li>
                <li> <a href=""> 남친이 제가 준 선물 넘 좋아함</a></li>
            </ul>
        </div>
        <em><1/2/3/4></em>
    </div>
    <div class="mypage_content_size">
        <span>나도 산타다</span>
        <div>
            <ul>
                <li> 아직 게시글이 없습니다 </li>
            </ul>
        </div>
        <em><1/2/3/4></em>
    </div>
    <div class="mypage_content_size" id="mypageGiftgramImgsize">
        <span>선물스타그램</span>
        <div>
            <ul>
                <li><a href=""> <img src="/img/candy.jpg"/> </a></li>
                <li><a href=""> <img src="/img/bear.jpg"/> </a></li>
                <li><a href=""> <img src="/img/flower.jpg"/></a> </li>
            </ul>
        </div>
        <em><1/2/3/4></em>
    </div>
    <div class="mypage_recommendation_size">
        <div>추천선물</div>
        <ul>
            <li><img src="/img/doll.jpg"/><span>인형</span></li>
            <li><img src="/img/mug.jpg"/><span>머그컵</span></li>
            <li><img src="/img/photoframe.jpg"/><span>액자</span></li>
        </ul>
    </div>
</div>
<%@ include file="/WEB-INF/template/footer.jsp" %>
<script src="/js/jquery.js"></script>
<script>

    $(window).on("scroll",function () {
        //현재 스크롤탑을 얻어옴
        // alert("hi");
        var sTop = $(window).scrollTop();

        // 콘솔에 출력
        console.log(sTop);

        if(sTop>0) {
                $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(100,100,100,0.5),rgba(200,200,200,0.5), rgba(192,192,192,0.8))");
        }else {
            $("#allIndexHeader").css("background","transparent")
        }//if~else end
    });//scroll() end
    // header scroll end
</script>
</body>
</html>