<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>종료된 이벤트 | GiftGuideService</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/event.css">
	<link rel="stylesheet" href="/css/default.css">
    <style>
       .event_item_wrap a.link_txt {
           margin-right:5px;
           text-decoration: none;
       }
    </style>
</head>
<body>

<%@ include file="/WEB-INF/template/header.jsp" %>
<div class="event_contents">

    <div class="event_contents_header">
        <h1 class="event_contents_titleName">종료된 이벤트</h1>
        <p class="event_contents_notice">종료된 이벤트를 확인 해보세요.
            <a href="/eventMain" class="event_btn_event">진행중인 이벤트<i class="fas fa-chevron-right"></i></a>
        </p><!--.event_contents_notice-->
    </div><!--.event_contents_header end-->

    <div class="event_contents_body">
        <ul class="event_contentsList">
        <c:forEach items="${content }" var="event">
            <li>
                <div class="event_item_wrap">
                    <span class="event_eventImg_endEvent">
                        <a href="/eventDetail/${event.no}">
                            <img src="/eventImg/${event.content }" width= "250" height= "210" alt=""/>
                        </a>
                    </span>
                    <dl>
                        <dt>
                            <a href="/eventDetail/${event.no }">${event.title }</a>
                        </dt>
                        <dd>
                        <a href="/eventWinners/${event.no }" class="link_txt"><span class="arr">당첨자 확인</span></a>
                            <ul>
                                <li>
                                    <span>발표</span>${event.endDate }
                                </li>
                                <li>
                                    <span>응모</span>${event.startDate } ~ ${event.endDate } 
                                </li>
                            </ul>
                        </dd>
                    </dl>
                </div><!--event_item_wrap end-->
            </li><!--li end-->
            </c:forEach>
        </ul><!--.event_contentList end-->
    </div><!--.event_contents_body end-->

		${paginate }
 
    <a class="event_btn_scrollTop" href="">
        <i class="fas fa-chevron-up"></i>
        <br/>
        <span>맨 위로</span>
    </a><!--.event_btn_scrollTop end-->

</div><!--.event_contents end-->


<%@ include file="/WEB-INF/template/footer.jsp" %>
<!--//footer-->
<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.js"></script>
<script>
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