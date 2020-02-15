<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="fsvs" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>Index</title>


    <link href="/css/stylesheets.css?ver=0000000071" rel="stylesheet" type="text/css">

    <%@ include file="/WEB-INF/template/link.jsp" %>
    <style>
        #allIndexFooter{
            position: fixed;
            bottom: 0;
            background-color: #f9f9f9;
            color: #f9f9f9;
        }
        .slide.nth-class-1, .slide.nth-class-2,.slide.nth-class-3, .slide.nth-class-4 {
            background-color: #f9f9f9;
        }
        body.active-nth-slide-2 #fsvs-pagination li.active>span>span {
            background: pink;
        }
        body.active-nth-slide-4 #fsvs-pagination li.active>span>span {
            background: green;
        }
        /* main css */
        .slide>video{
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
        }

        .slide>.all_index_contents{
            width:1000px;
            height: 600px;
            position:absolute;
            left:50%;
            top:50%;
            margin:-300px 0 0 -500px;
            color: #f9f9f9;
        }

        .video{
            width: 400px;
            height: 600px;
            float: left;
        }

        .all_index_ment .index_ment{
            font-size: 30px;
            color: white;
            line-height: 1.5;
            font-family: 'Nanum Gothic', sans-serif;

        }
        #indexMentFirstBox{
            width: 400px;
            height: 400px;
            position:absolute;
            left:70%;
            top:50%;
            margin:-200px 0 0 -200px;
            float: left;
            font-family: 'Nanum Gothic', sans-serif;
        }

        #allIndexFirstBox::before {
            content: "";
            position: absolute;
            width: 500px;
            height: 500px;
            background-size: contain;
            background-repeat: no-repeat;
            background-image: url(img/firstBoxImg.png);
            /* transform: rotate(36deg); */
            top: 20%;
            left: 40%;
        }


        #allIndexFirstContent>.index_slide_num{
            color:#ff6168;
        }
        #allIndexFirstContent{
        	margin-top:50px;
        }
        #allIndexSecondBox::before{
            content:"";
            position: absolute;
            width: 550px;
            height: 550px;
            background-size: contain;
            background-repeat: no-repeat;
            background-image: url("/img/tBoxImg.png");
            top: 16%;
            left: 25%;
        }
        #indexMentSecondBox{

            width: 400px;
            height: 400px;
            padding-left: 120px;
            padding-top: 100px;
            float: left;
            line-height: 0.3em;
            font-family: 'Nanum Gothic', sans-serif;
        }
        #allIndexSecondContent>.index_slide_num{

            color:#8551f7;
        }
		#allIndexSecondContent{
			margin-top:50px;
		}
        /*#indexMentSecondBox>p{*/
            /*width: 600px;*/
            /*min-height: 400px;*/
            /*padding-left: 50px;*/
            /*text-align: right;*/
        /*}*/
        .index_slide_num{

            font-family: 'Ubuntu', sans-serif;
            font-size: 25px;
        }
        #allIndexThirdContent>.index_slide_num{
            color:#ffba00;
        }
        #allIndexThirdBox::before{
            content:"";
            position: absolute;
            width: 450px;
            height: 450px;
            background-size: contain;
            background-repeat: no-repeat;
            background-image: url("/img/thBoxImg.png");
            transform: rotate(-16deg);
            top: 16%;
            left: 45%;
        }
        #allIndexThirdContent{
            width: 400px;
            height: 400px;
            padding-left: 130px;
            padding-top: 100px;
            float: left;
            font-family: 'Nanum Gothic', sans-serif;
        }
        .all_index_ment>a{
            float: right;
            text-decoration: none;
            font-weight: bold;
            display: block;
            width: 180px;
            height: 45px;
            line-height: 45px;
            color: white;
            text-align: right;
            position: absolute;
            font-size: 14px;
            transform: translateY(-100px);
        }
        .all_index_ment>#IndexCustomLink{
            top:320px;
            right: 250px;
        }
        .all_index_ment>#IndexPickmeLink{
            bottom: -45px;
        }
        .all_index_ment>#IndexGramLink{
            top:350px;
            left:550px;

        }
        /*.all_index_ment>a::after{*/
            /*position: absolute;*/
            /*content: ">";*/
            /*top: -1px;*/
            /*right: -1px;*/
            /*width: 33px;*/
            /*height: 45px;*/
            /*background-color: silver;*/
            /*color: #f9f9f9;*/
            /*text-indent: 2px;*/
            /*border-radius: 0 20px 20px 0;*/
        /*}*/
        #allIndexVideoBox{
            position: absolute;
            z-index: 15;
            bottom:-9000px;
        }
        #allIndexFirstBox{
            background-image: url("/img/선물배경1.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
        #allIndexSecondBox{
            background-image: url("/img/선물배경2.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
        #allIndexThirdBox{
            background-image: url("img/선물배경3.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            position: relative;
        }
        #firstBottomMove {
        	width: 100%;
        	height: 150px;
        	background-color: rgba(0,0,0,.7);
        	position: absolute;
        	left: 0;
        	top: 85%;
        	z-index : 9999;
        }
        #firstImg, #secondImg, #thirdImg {
        	width:150px;
        	height: 150px;
        	float: left;
        	left:50%;
        	margin-left: 100px;
        }
        #firstImg {
        	background-image: url("/img/inp1-1.png");
        	background-repeat: no-repeat;
        	background-size: contain;
        }
        #secondImg {
        	background-image: url("/img/inp2-1.png");
        	background-repeat: no-repeat;
        	background-size: contain;
        }
        #thirdImg {
        	background-image: url("/img/inp3-1.png");
        	background-repeat: no-repeat;
        	background-size: contain;
        }
        .move_remote {
        	display: block;
        	float: left;
        	color : #fff;
        	font-size: 16px;
        	margin-top: 30px;
        	width: 150px;
        	height: 75px;
        	font-family: 'Ubuntu', sans-serif;
    		text-decoration: none;
    		border: 2px solid rgba(255,255,255,.5);
			box-shadow: -1px 2px 14px 6px rgba(255,255,255,0.88);
    		padding-top: 10px;
    		padding-left: 10px;g
        }
        #firstBoxRemote {
        	position: absolute;
        	left:50%;
        	margin-left:-700px;
        }
        #allIndexFooter {
        	opacity: .7;
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>

<div id="allIndexVideoBox">
    <video  width="600" height="500" poster="" autoplay loop muted="" >
        <source src="/video/6번문제.mp4">
    </video>
</div>



<div id="fsvs-body">
    <div class="slide">
        <video poster="" autoplay loop muted="">
            <source src="/video/video1.mp4">
        </video>
        <div id="firstBottomMove">
        	<div id="firstBoxRemote">
	        	<div id="firstImg"></div>
	        	<a href="#allIndexFirstBox" class="move_remote">나만의 선물 취향
	        	<br>알아보기!
	        	<br><span>&nbsp;&nbsp;->보러가기</span></a>
	        	<div id="secondImg"></div>
	        	<a href="#allIndexSecondBox" class="move_remote">사람들이 자랑하는
	        	<br>선물을 보아요!
	        	<br><span>&nbsp;&nbsp;->보러가기</span></a>
	        	<div id="thirdImg"></div>
	        	<a href="#allIndexThirdBox" class="move_remote">선물할때 고민하는
	        	<br>사람을 위해!
	        	<br><span>&nbsp;&nbsp;->보러가기</span></a>
        	</div>
        </div>
    </div>
    <div class="slide" id="allIndexFirstBox" data-page="1">
        <div class="all_index_contents">
            <div class="video" id="allFirstVideo">

            </div>
            <div class="all_index_ment" id="indexMentFirstBox">
                <h2 class="index_ment"id="allIndexFirstContent">
                    <strong class="index_slide_num">one.</strong>
                    <br>
                    선물 준비가<br>
                    쉬워진다 !
                </h2>
                <a href="/customGift" id="IndexCustomLink"> <i class="far fa-arrow-alt-circle-right"></i> Custom Gift</a>
            </div>
        </div>
    </div>
    <div class="slide" id="allIndexSecondBox" data-page="2">
        <div class="all_index_contents" id="indexMentSecondBox">
        <div class="all_index_ment">
            <h2 class="index_ment" id="allIndexSecondContent">
                <strong class="index_slide_num">two.</strong>
                <br>
                선물 취향을<br>
                알 수 있다 !
            </h2>
            <a href="/pickme" id="IndexPickmeLink"> <i class="far fa-arrow-alt-circle-right"></i> Pick me</a>
        </div>
        <div class="video" id="allSecondVideo">

        </div>
        </div>
    </div>
    <div class="slide" id="allIndexThirdBox" data-page="3">
        <div class="all_index_contents" id="indexMentThirdBox">
            <div class="video" id="allThirdVideo">

            </div>
            <div class="all_index_ment">
                <h2 class="index_ment" id="allIndexThirdContent">
                    <strong class="index_slide_num">three.</strong>
                    <br>
                    선물 후기를<br>
                    볼 수 있다 !
                </h2>
                <a href="/GiftGram" id="IndexGramLink"> <i class="far fa-arrow-alt-circle-right"></i> Gift Gram</a>
            </div>
        </div>


        <%@ include file="/WEB-INF/template/footer.jsp" %>

    </div>
</div> <!-- // #fsvs-body -->
<script src="/js/jquery.js"></script>
<script src="/js/bundle.js"></script>
<script src="/js/javascripts.js"></script>
<script>
$("html.fsvs #fsvs-pagination li>span>span").css("border","1px solid black");
$("html.fsvs #fsvs-pagination li>span").css("border","1px solid transparent");
$("html.fsvs #fsvs-pagination li.active>span").css("border","1px solid transparent");
$("#IndexCustomLink").on("click",function(e){
	
	if(${loginMember==null}){
		e.preventDefault();
		alert("로그인 후 이용해주세요");
	}3
});
//#IndexCustomLink click end

</script>
</body>
</html>