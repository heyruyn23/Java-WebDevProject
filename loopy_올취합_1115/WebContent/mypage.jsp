<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <title>mypage</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/mypage.css"/>
    <style>
     	body{
            background-color: #121212;
            font-size: 15px;
        }
    	#myWork{
	    	width: 950px;
	        min-height:660px;
	        padding: 10px 25px;
	        color: #fff;
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
	        float: left;
	        margin:25px 10px;
            position: relative;
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
        }
        .playForm{
            width: 210px;
            height: 210px;
            text-align: center;
            line-height: 120px;
            font-size: 50px;
            opacity: .6;
            cursor: pointer;
        }
        .playForm:hover{
            transform: scale(1.05);
            color: red;
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
            font-size: 15px;
            font-weight: bold;
            color: #fff;
        }
        
        .nickName{
            top:5px;
            left: 5px;
            color: #fff;
            font-weight: bold;
            text-decoration: none;
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

        .fa-play-circle{
            opacity: 0.5;
        }
        
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<% int type = 1; %>
<%--
	<jsp:include page="/WEB-INF/template/mypage_header.jsp">
	<jsp:param value="1" name="type"/>
	</jsp:include>
 --%>
<%@ include file="/WEB-INF/template/mypage_header.jsp" %>
    
    
          <div id="myWork">
          	<ul id="myWorkList">
          	</ul>
		  </div><!-- // #myWork end-->
		  
		  
<%@ include file="/WEB-INF/template/mypage_footer.jsp" %>
    
          <!--아티스트 순 템플릿 스크립트-->
<script type="text/template" id="myWorkTmp">
    
<li class="list">
 <div class="cover">
 <a href="" >
 <div class="playForm">
 <i class="fas fa-play-circle"></i>
 </div></a>
 <span class="playTime">03:44</span>
 </div><!--cover end-->
 <div class="information">
 <a href="" class="nickName">하리보</a>
 <span class="title">좋아좋아</span>
 <span class="playNum"><i class="fas fa-play"></i>351</span>
 <span class="grade"><i class="far fa-star"></i>3.5</span>
 <span class="like"><i class="fas fa-thumbs-up"></i>7</span>
 </div><!--information end-->
</li><!--list-->
</script>
    <script src="/js/jquery.js"></script>
    <script src="/js/underscore-min.js"></script>
    <script>
    var backgroundImage = "<%=user.getCoverArt()%>";
    </script>
    <script src="/js/mypage.js"></script>
    <script>
    var tmp = _.template($("#myWorkTmp").html());
    for(var i=0; i<10; i++){
        $("#myWorkList").append(tmp());
    }
    

<%--   // 소개글 수정  ----------------------------------------%>
	var cnt=0;
    var $textarea = $(".introduction textarea");
    $(".introduction").click(function (event) {
        // $(this).off("click");
        // console.log(event.target==document.getElementsByClassName("editIntro"));
        var flag = $("textarea").hasFocus;
        cnt++
        console.log(cnt);
        var value=$(this).text();
        if(cnt==1){
            $textarea.text(value).show().focus();
        }else{
            $textarea.show().focus();
        }
    });

    $textarea.on("blur",function (e) {
        var value= $(this).val();
        $(this).next().text(value);
        $(this).css("display","none");
        // value값을 받아 여기에 써야함! UsersDAO.updateInfo()
    }); // editname keyup end


     $textarea.on("keyup",function (e) {
         if (e.ctrlKey && e.keyCode == 13) {
             var value= $(this).val();
             $(this).next().text(value);
             $(this).css("display","none");
         }
    }); // editname keyup end
<%--   // 소개글 완료  ----------------------------------------%>
    $("body").on("click",".follow",function(){
    	alert("구독하기!");
    });
    
    $('.emoticons a').click(function (e) {
        e.preventDefault();
        <%=EmotionsDAO.insertEmotion(userNo)%>
    });
    </script>
</body>
