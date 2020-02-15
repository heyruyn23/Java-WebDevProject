<%@page import="org.bjd.loopy.vo.Bet"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.dao.BetsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 	
String seqStr = request.getParameter("seq");

	int seq = BetsDAO.selectMax();

	if(seqStr!=null) {
		seq = Integer.parseInt(seqStr);
	} 
*/
/* select에 change 이벤트 써서, location.href()... */

	List<Bet> list = BetsDAO.selectList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Betting</title>
<link rel="stylesheet" href="/css/betting.css"/>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div class="battingHeader">
<div class="battingCalendar">
	<select id="calObWrap">
		<option selected>3회차 2018.10.18~1018.10.24</option>
		<option>2회차 2018.6.18~1018.6.24</option>
		<option>1회차 2018.5.18~1018.5.24</option>
	</select>
</div><!--battingCalendar end-->
<div class="battingSongCount">
	<span>총</span>
	<span class="battingSongNum">7</span>
	<span>곡</span>
</div><!--battingSongCount end-->
<div class="sumDBAccumulation">
	<span>누적 dB:</span>
	<span class="dBAccumulation">1503000</span>
</div><!--sumDBAccumulation end-->
<div class="prevButton btn">
	<div class="innerPrevButton"><i class="fas fa-chevron-left"></i></div>
</div><!--prevButton end-->
	<div class="nextButton btn">
		<div class="innerNextButton">
			<i class="fas fa-chevron-right"></i>
		</div>
	</div><!--nextButton end-->
</div><!--battingHeader end-->

<form action="test_01.html" method="post" enctype="multipart/form-data" target="_blank">
    <fieldset>
        <legend class="screen_out">배팅하기</legend>
        <div class="battingContents">
            <div id="border"><div class="playIcon"><i class="fas fa-play"></i></div></div>
            <div class="contents">
                <ul>
                <%for(Bet bet:list) {%>
					<li>
		                <div class="playBtn" data-num="0">
		                    <div class="albumCover">
		                    	<%if(bet.getCoverName() != null){ %>
		                        <img src="<%=bet.getCoverName()%>" width="130" height="130"/>
		                       	<%} else{ %>
		                       	<img src="/profile/userDefault.jpg" width="130" height="130"/>
		                       	<%} %>
		                    </div><!--albumCover end-->
		                    <div class="songWriter">
		                        <%=bet.getNickKo() %>
		                    </div><!--songWriter end-->
		                    <div class="songName">
								<%=bet.getTitle() %>
		                    </div><!--songName end-->
		                    <div class="songWave">
		                    
		                    </div><!--songWave end-->
		                </div>
		                <div class="betInfo">
		                    <div class="dividedRate">
		                        x1.45
		                    </div><!--divineRate end-->
		                    <div class="holdDB">
		                        <!-- 보유 db:<@=bettingSong.holdDB@> -->
		                    </div><!--holdDB end-->
		                    <div class="inputArea">
		                        <input type="text" placeholder="배팅액 입력" name="dB" id="dB"/>
		                        <!--배팅액에 글자 안됨-->
		                        dB
		                    </div><!--inputArea end-->
		                    <div class="inputPlayer input">
		                        <button>플레이어에 담기</button>
		                    </div><!--inputPlayer end-->
		                    <div class="inputCollection input">
		                        <button>컬렉션에 담기</button>
		                    </div><!--inputCollection end-->
		                </div>
		            </li>
	            <%} %>
                </ul>
            </div><!--contents end-->
        </div><!--battingContents end-->

        <div class="battingBottom">
            <div>
                <button class="battingButton" type="button">배팅하기</button>
            </div>
        </div><!--battingBottom-->
        <!--battingBottom 을 가장 아래로 보내는 방법-->


        <div class="full">
            <div class="betPopUp">
                <div>배팅하시겠습니까?</div>
                <div>(배팅하신 금액은 무를 수 없습니다)</div>
                <div class="betBtn">
                    <button class="betAcc" type="submit">확인</button>
                    <button class="betRej" type="reset">취소</button>
                </div><!--betBtn end-->
            </div><!--betPopUp-->
        </div><!--full end-->
    </fieldset>
</form>



<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/wave.js"></script>
<script src="js/wavesurfer.js"></script>
<script>

	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@(.+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};
    var ps = -1;
/* 		
    var tmp = _.template($("#contentsTmp").html());

 

    $.ajax({
        url: "ajax/bettingSongs.json",
        type: "get",
        dataType: "json",
        error:function () {
            alert("test");
        },
        success:function (json) {
            $(".contents ul").append(tmp({"bettingSongs":json}));
        }
    });
 */

/*  	useWave(".songWave", "/audio/"+$(".songWave").text(), ".playIcon"); */

    $(".contents").on("click", ".playBtn",function () {
        var idx = $(this).parent().index();
        console.log("idx: "+idx);
        if(idx == ps){
            $(".playIcon").html("<i class=\"fas fa-play\"></i>");
            ps = -1;
        }
        else{
            ps = idx;
            console.log("ps: "+ps);
            $("#border").css("top", (idx)*150);
            $(".playIcon").html("<i class=\"fas fa-pause\"></i>");
        }
    });

    $(".battingButton").click(function () {
        $(".full").show();
    });/*click end*/

    $(".full").click(function () {
        $(".full").hide();
    });/*click end*/

    $(".full").on("click", ".betAcc", function () {
        // e.preventDefault();
        $(".full").hide();
    })// click end

    $(".full").on("click", ".betRej", function () {
        $(".full").hide();
    })// click end

    $(".innerPrevButton").on("click", function () {
    	if($(".battingCalendar option:selected").index() !=
    	document.getElementById("calObWrap").childElementCount - 1){
    	console.log($(".battingCalendar option:selected").index()
    	+ " / " + document.getElementById("calObWrap").childElementCount);
    	$(".battingCalendar option:selected").removeAttr("selected").
    	next().attr("selected","selected");
    	}
    	});

    	$(".innerNextButton").on("click", function () {
    	if($(".battingCalendar option:selected").index() != 0) {
    	$(".battingCalendar option:selected").removeAttr("selected")
    	.prev().attr("selected", "selected");
    	}
    	});



</script>
</body>
</html>