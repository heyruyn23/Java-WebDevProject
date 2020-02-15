<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>이벤트 | GiftGuideService</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/event.css">

    <style>

    </style>
</head>
<body>

<%@ include file="/WEB-INF/template/header.jsp" %>

<!--//pageContents-->
<div class="event_contents">
    <div class="event_contents_header">
        <h1 class="event_contents_titleName">진행중인 이벤트</h1>
        <p class="event_contents_notice">회원만을 위한 멤버십 이벤트에 지금 참여하세요.
            <a href="/eventEnded" class="event_btn_endEvent">종료된 이벤트<i class="fas fa-chevron-right"></i></a>
        </p>
    </div>

    <div class="event_eventImg_list">
   		<c:forEach items="${list}" var="event">
        <div class="event_eventImg_Img">
            <a href="/eventDetail/${event.no}">
                <img src="/eventImg/${event.content}" width="1200" height="300" alt=""/>
            </a>
        </div><!--.event_eventImg_Img-->
        </c:forEach>
    </div><!--.event_eventImg_list-->

    <a class="event_btn_scrollTop" href="#">
        <i class="fas fa-chevron-up"></i>
        <br/>
        <span>맨 위로</span>
    </a>
</div>
<!--//pageContents-->


<%@ include file="/WEB-INF/template/footer.jsp" %>


<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.js"></script>
<script>
    var tmp = _.template($("#eventImgTmpl").html());
    $window = $(window);

    /*header*/
    $window.scroll(function () {
        var sTop = $window.scrollTop();//스크롤높이
        console.log("top: "+sTop);
        if(sTop>0) {
// 골드, 핑크골드
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(183,110,121,0.6))");
// 골드, 실버
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(192,192,192,0.6))");
        $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(100,100,100,0.5),rgba(200,200,200,0.5), rgba(192,192,192,0.8))");
// 골드
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(212,175,55,0.9))");
        }else {
        $("#allIndexHeader").css("background","transparent")
        }//if~else end
    });//scroll() end
    // header scroll end
    /*header*/



    $window.scroll(function () {
        var scrollTop = $(this).scrollTop();
        console.log(scrollTop);
        if(scrollTop < 500){
            $(".event_btn_scrollTop").hide();
        }else{
            $(".event_btn_scrollTop").show();
        }
    });

    $("body").on("click", ".event_btn_scrollTop", function(){
        $("html").scrollTop();
    });

</script>
</body>
</html>