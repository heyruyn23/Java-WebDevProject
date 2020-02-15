<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>이벤트 당첨자 확인 | GiftGuideService</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/event.css">

    <style>

    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>

    <div class="event_winners_wrap">
        <div class="event_winners_header">
            <h1 class="event_winners_title">
                ${content.title } 당첨자 발표
            </h1>
        </div>

        <div class="event_winners_body">
            <ul class="event_winners_contents">
                <li class="event_contents_name">
                    <div class="event_name_title"><span>이벤트 내용</span></div>
                    <div class="event_name_contents">
                        ${content.title }에서 설문 참여하면 추천을 통해 선물
                        <a href="/eventDetail/${content.no}" class="event_btn_returnDetail">
                            <span>이벤트 보기<i class="fas fa-angle-right"></i></span>
                        </a>
                    </div>
                </li>
                <li class="event_contents_period">
                    <div class="event_period_title"><span>이벤트 기간</span></div>
                    <div class="event_period_contents">${content.startDate } ~ ${content.endDate }</div>
                </li>
                <li class="event_contents_publishingDate">
                    <div class="event_publishingDate_title"><span>당첨자 발표일</span></div>
                    <div class="event_publishingDate_contents">${content.endDate }</div>
                </li>
                <li class="event_contents_detail">
                    <div class="event_detail_title"><span>상세 내용</span></div>
                    <div class="event_detail_contents"><a href="/eventDetail/${content.no}" class="event_detail_link">해당 페이지로 이동</a></div>
                </li>
            </ul>
        </div>

        <div class="event_winners_foot">
            <div class="event_foot_wrap">
                <div class="event_foot_tabName">
                    <span>당첨자 전체 보기</span>
                </div>
                <div class="event_foot_contentsWrap">
                    <div class="event_foot_contents">
                        <div class="event_foot_title">
                            이메일로 당첨 여부를 확인하세요.
                        </div>

                        <div class="event_foot_listWrap">
                            <dl class="event_foot_winnerList">
                                <dt>${countW}명 </dt>
                                <c:forEach items="${list}" var="winner">
                                <dd>${winner.email }</dd>
                                </c:forEach>
                            </dl><!--event_foot_winnerList end-->
                            <div class="event_btnFoot_center">
                                <button type="button" class="event_btnFoot_more">
                                <c:choose>
                                <c:when test="${countW >100}">
                                    <span>더보기(100/${countW })</span>
                                </c:when>
                                <c:otherwise>
                                    <span>더보기(${countW }/${countW })</span>
                                </c:otherwise>
                                </c:choose>
                                </button>
                            </div><!--.event_btnFoot_center end-->
                        </div><!--.event_foot_listWrap end-->
                    </div><!--event_foot_contentsWrap end-->
                </div><!--.event_foot_tabName end-->
            </div><!--.event_foot_wrap end-->
        </div><!--.event_winners_foot end-->

        <div class="event_btn_box">
            <a href="/eventEnded" class="event_btn_return"><span>목록</span></a>
        </div><!--.event_btn_return end-->

        <a class="event_btn_scrollTop" href="#">
            <i class="fas fa-chevron-up"></i>
            <br/>
            <span>맨 위로</span>
        </a>

    </div>
<%@ include file="/WEB-INF/template/footer.jsp" %>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
    $window = $(window);
    $event_foot_contentsWrap=$(".event_foot_contentsWrap");

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

    $(".event_foot_tabName").click(function () {
        if($event_foot_contentsWrap.hasClass('on')){
            $event_foot_contentsWrap.removeClass('on');
        }else{
            $event_foot_contentsWrap.addClass('on');
        }
    })




</script>
</body>
</html>