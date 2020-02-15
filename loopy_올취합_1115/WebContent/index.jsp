<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="/css/index.css" />
<%@ include file="/WEB-INF/template/link.jsp" %>
<style>
.list {
	width: 210px;
	height: 210px;
	background-color: #00AAB4;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div id="contentsHeader">
    <div class="loopPage">
        <a href="">루프 만들러 가기</a>
    </div><!--div end-->
    <div class="loopLearning">
        <a href="">루프 배우기</a>
    </div><!--div end-->
    <div class="countingBox">
        <div class="BTUploadCount counting">
            <a href="">배팅신청 현황</a>
            <div class="participant">
                <span class="ptcCount">3</span>
                /20
            </div><!--participant end-->
        </div><!--div end-->
        <div class="BTDDay counting">
            <a href="">배팅 시작일</a>
            <div class="dDay">D-2</div><!--DDay end-->
            <div class="timer"></div><!--timer end-->
        </div><!--BTDDay end-->
        <h4 class="bettingNum">10월 21일 4회차</h4>

    </div><!--countingBox end-->
</div><!--contents end-->
<div class="contentsBox">
        <ul class="contents">
            <h3 class="contentsSongName"><a href="art_page_artist.jsp">내가 구독한 아티스트 최신곡</a></h3>
            <li class="mainContentsSong first"></li>
            <li class="mainContentsSong"></li>
            <li class="mainContentsSong"></li>
            <li class="mainContentsSong"></li>
            <li class="mainContentsSong"></li>
        </ul>
    <div class="contents">
        <h3 class="contentsSongName"><a href="songList_ranking.jsp">이 달의 랭킹 곡</a></h3>
        <div class="slideBox">
            <div class="imgHidden">
                <ul class="songs">

                </ul>
            </div>
            <div class="sContinue"><i class="fas fa-angle-double-right"></i></div>
            <button class="leftBtn"><i class="fas fa-step-backward"></i></button>
            <button class="rightBtn"><i class="fas fa-step-forward"></i></button>
        </div>
    </div>
</div>

<script type="text/template" id="contentsTmp">
    <ul class="contents">
        <h3 class="contentsSongName"><a href="">태그</a></h3>
        <li class="mainContentsSong first"></li>
        <li class="mainContentsSong"></li>
        <li class="mainContentsSong"></li>
        <li class="mainContentsSong"></li>
        <li class="mainContentsSong"></li>
    </ul>
</script>

<script type = "text/template" id="songsTmp">
    <li class="song"></li>
</script>

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/moment-with-locales.js"></script>
<script>
    // 언더스코어 템플릿
    var tmp01 = _.template($("#contentsTmp").html());
    var tmp02 = _.template($("#songsTmp").html());
    var x = 0;


    $(window).scroll(function () {
// 스크롤탑
        var sTop=$(this).scrollTop();

// 브라우저의 높이
        var wTop=$(window).height();

// 문서의 높이
        var dTop = $(document).height();

        if((dTop-500)<=wTop+sTop){
// 언더스코어 템플릿 이용해서 추가
            for(var i=0; i<3; i++){
                $(".contentsBox").append(tmp01());
                var height=$(".contentsBox").css("height");
                $(".contentsBox").css("height",height+260);
                }// for end
            }// if end
        console.log("스크롤탑:"+sTop+"/브라우저 높이:"+wTop+"/문서의 높이:"+dTop);
    }); //scroll() end

    $(".rightBtn").click(function () {
            x -= 220;
            console.log(x);
            $(".songs").css("left", x);
        /*.songs의 width 값 끝에 다다랐을 때 멈춤
        * div 요소 개수를 확인하는 것은 어떤가*/
    }); // rightBtn end

    $(".leftBtn").click(function () {
            x += 220;
            console.log(x);
            if(x == 220){
                x = 0;
            }
            $(".songs").css("left", x);
    });// leftBtn end
    /* 흰 칸 안 뜨게 설정*/

    for(var i = 0; i<100; i++){
        $(".songs").append(tmp02());
    }

    function displayTime(){
        var now = moment();
        var startBet = moment([2018, 10, 1, 15, 15, 15]);
        /* 서버에서 시간단위까지 받아서 타이머 측정*/

        var time = startBet.diff(now);
        //
        // var currSec = 1000; // 밀리세컨
        // var currMin = 60 * 1000; // 초 * 밀리세컨
        // var currHour = 60 * 60 * 1000; // 분 * 초 * 밀리세컨
        //
        // var hour = parseInt(time/currHour); //d-day 시
        // var min = parseInt(time/currMin); //d-day 분
        // var sec = parseInt(time/currSec); //d-day 초
        // $(".countingBox .timer").text(hour+":"+min+":"+sec);

        var hour = Math.floor(time/(3600*1000));
        var min = Math.floor(time/(60*1000)) - hour*60;
        var sec = Math.floor(time/1000)-min*60-hour*3600;

        $(".countingBox .timer").text(hour+":"+min+":"+sec);
    }

    setInterval(displayTime, 1000);

</script>
</body>
</html>