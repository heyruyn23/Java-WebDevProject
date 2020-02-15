<%@page import="org.bjd.loopy.vo.Song"%>
<%@page import="org.bjd.loopy.dao.SongsDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.dao.BLKTagDAO"%>
<%@page import="org.bjd.loopy.dao.PlaylistsDAO"%>
<%@page import="org.bjd.loopy.vo.Playlist"%>
<%@page import="org.bjd.loopy.vo.BLKTag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    String collectionNoStr = request.getParameter("collectionNo");
	int collectionNo = Integer.parseInt(collectionNoStr); 
	
	Playlist playlist = PlaylistsDAO.selectPlaylist(collectionNo);
	
	BLKTag blkTag = new BLKTag(playlist.getNo(),"collection");
	List<String> blkTags = BLKTagDAO.selectList(blkTag);
    
	List<Song> songList = SongsDAO.selectList(collectionNo);
    
    
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>collection페이지</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <style>

        html {
            overflow-y: scroll;
        }



        #collectionWarp{
              width: 1200px;
            margin: auto;
            margin-top: 50px;
          /*   border: solid 1px white; */
            height:500px;
        }
        
       #collectionName{
            font-size: 18px;
            width: 1200px;
            height: 30px;

        } 
        .collectionInfor{
            position: absolute;
            width: 1200px;
            height: 380px;

        }
        .collectionCover{
            width: 260px;
            height: 260px;
            margin-top: 10px;

        }
        .collectionTag{
            width:200px;
            height: 40px;
            position: absolute;
            top:280px;
            left:30px;


        }
        .collectionArtist{
            width: 200px;
            height: 40px;
            position: absolute;
            top:10px;
            left:300px;

        }

        .collectionTitle{
            width: 200px;
            height: 40px;
            position: absolute;
            top:60px;
            left:300px;


        }
        .collectionDate {

            width: 200px;
            height: 40px;
            position: absolute;
            top:110px;
            left:300px;


        }

        .collectionPlayTime{
            width: 200px;
            height: 40px;
            position: absolute;
            top:160px;
            left:300px;

        }



        #trackWarp{
            width: 1200px;
            margin: auto;
            margin-top: 50px;

        }

        #track{
            width: 1200px;
            height: 30px;
            font-size: 18px;

        }
        .trackButton{
            width: 1200px;
            height: 30px;
            margin-top: 30px;
        }
        .btn{
            border-radius: 6px;
            margin-right: 10px;
            padding: 5px 35px;
            font-size: 16px;
            cursor: pointer;
            line-height: 20px;
        }
        #totalPlayTime{
            width: 1200px;
            height: 25px;


        }
        #totalPlayTime a{
            margin-left: 1120px;
            line-height: 22px;
        }

        .trackBar{
            border-bottom: solid 1px white;
            background-color: #383838;
            width: 1200px;
            height: 30px;

        }

        .trackBarListBox{
            width: 1200px;

        }


        .trackBarList{
            background-color: rgba(255,255,255, 0.9);
            width: 1200px;
            height: 40px;
            border-bottom: solid 1px white;
        }

        .cover img{
            height: 40px;

        }


        .trackBar a{
            font-size: 15px;
            line-height: 30px;
            font-weight: bold;
        }

        .trackBar li{
            float: left;
        }

        .trackBar li:nth-child(1){
               width: 510px;
    		text-align: center;
            transform: translateX(50px);

        }
        .trackBar li:nth-child(2){
              text-align: center;
   			width: 250px;
    		margin-left: 60px;

        }
        .trackBar li:nth-child(3){
             width: 40px;
            margin-right: 6px;
            transform: translateX(90px);

        }
        .trackBar li:nth-child(4){
           margin-left: 110px;
            margin-right: 20px;

        }
        .trackBar li:nth-child(5){
            margin-left: 25px;
            margin-right: 25px;

        }


        .cover{
            width: 40px;
            height: 40px;
        }
        .title{
             width: 510px;
            height: 40px;

        }
        .artist{
             width: 250px;
            height: 40px;

        }
       
        .trackPlay{
            width: 40px;
            height: 40px;
            margin-left: 85px;

        }
        .trackList{
            width: 40px;
            height: 40px;
            margin-left: 45px;

        }
        .trackInsert{
            width: 40px;
            height: 40px;
            margin-left: 50px;

        }
        .trackDelete{
            width: 40px;
            height: 40px;
            margin-left: 35px;

        }

        .element{
            text-align: center;
            line-height: 40px;
            float: left;
            font-weight: bold;
            color: black;
        }

     
        
        .far{
             color: black;
            font-size: 20px;
            text-align: center;
            line-height: 40px;
            cursor: pointer;

        }
        .fa-star{
            transform: translateX(-5px);
        }







        #addSongPopup
        {
            width: 800px;
            height: 500px;
            background-color: #d8dfec;
            overflow: hidden;
            border:solid 1px black;
            box-shadow: 0 16px 28px 0 rgba(0, 0, 0, 0.22), 0 25px 55px 0 rgba(0, 0, 0, 0.21);
            position: absolute;
            top:50%;
            left: 50%;
            margin-left: -400px;
            margin-top: -250px;
            z-index: 2;
            display: none;

        }

        #addSongPopupBack{
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            z-index: 1;

        }

        .addSongSearchBox{
            width: 250px;
            height: 40px;
            margin: auto;
            margin-top: 10px;

        }

        .addSongSearch{
            width: 200px;
            height: 25px;


        }

       

        .recommend{
            width: 750px;
            height: 110px;
            margin: auto;
            margin-top: 20px;
            border-bottom:solid 1px black ;
            background-color: #d8dfec;
            position: relative;
        }

        .smallCard{
            width: 100px;
            height: 100px;
            background-color: black;

        }

        .addSongContents{
            display: block;
            position: absolute;
            width: 550px;
            height: 100px;

            top: 0px;
            left: 100px;
        }
        .addSongContents li{
            position: absolute;
            height: 40px;
            font-size: 20px;
            line-height: 40px;
            color: #311b92;
            font-weight: bold;
        }
        .addSongContents li:nth-child(1){

            left: 10px;

        }
        .addSongContents li:nth-child(2){
            bottom: 0px;
            left: 10px;


        }
        .addSongContents li:nth-child(3){
            right: 170px;
            top:0px;

        }
        .addSongContents li:nth-child(4){
            bottom: 0px;
            right: 135px

        }
        .addSongContents li:nth-child(5){
            right: 25px;
            top:0px;
        }
        .addSongContents li:nth-child(6){
            right: 30px;
            bottom: 0px;
        }
        .addSongBox{
            position: absolute;
            width: 100px;
            height: 100px;
            background-color: #383838;
            right: 0px;
            top:0px;
            border-radius: 100px;
            cursor: pointer;
        }
        .far{
            font-size: 20px;
        }
        
        .fas.fa-plus{

            font-size: 40px;
            margin-left:32.5px;
            margin-top: 32.5px;

        }

        .check{
            vertical-align: middle;
        }

        .check1{
            margin-top: 15px;
        }
        span{      
            vertical-align: -15px;

        }
        h3{
            font-weight: bold;
        }
        .fas{
        	cursor: pointer;
        }
      
        
        

    </style>

</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>

<!--컬렉션 곡 목록-->

<!--컬렉션 곡 목록 end-->


<!--컬렉션 곡추가 팝업 리스트-->
<script type="text/template" id="addSongTmp">
    <@ _.each(addSongForm,function(addSong){ @>
        <div class="recommend">
            <a href=""><div class="smallCard"><img src="img/car.jpg" width="100" height="100"/></div></a>
            <ul class="addSongContents">
                <li class="addSongArtist"><@=addSong.addSongArtist@></li>
                <li class="addSongTitle"><@=addSong.addSongTitle@></li>
                <li class="addSongTime"><@=addSong.addSongTime@></li>
                <li><i class="fas fa-play"></i><@=addSong.play@></li>
                <li><i class="far fa-star"></i><@=addSong.star@></li>
                <li><i class="far fa-heart"></i> <@=addSong.point@></li>
            </ul>
            <a href=""><div class="addSongBox"><i class="fas fa-plus"></i></div></a>
        </div>
    <@ }) @>
</script>
<!--컬렉션 곡추가 팝업 리스트 end-->



<div id="collectionWarp">
<%if(playlist.getAcType().equals("collection")) {%>
    <div id="collectionName"><h3>컬렉션</h3></div>
    <%} %>
    <div class="collectionInfor">
        <div class="collectionCover"><img src="/cover/<%=playlist.getCoverName()%>" width="260" height="260" /></div>
        <div class="collectionTag">
        <%for(String tag : blkTags ) {%>
            <span id="tag"><%=tag %></span>
            <% } %></div>
            <div id="collection">
                <div class="collectionArtist"><span><%=playlist.getNickKo() %></span></div>
                <div class="collectionTitle"><span><%=playlist.getName()%></span></div>
                <div class="collectionDate"><span><%=playlist.getRegdate() %></span></div>
                <div class="collectionPlayTime"><span>03:27:20</span></div>
            </div><!--collection-->
    </div><!--collectionInfo end-->
</div><!-- collectionWarp end-->




<div id="trackWarp">
    <div id="track"><h3>수록곡</h3></div>
    <div class="trackButton">
    
            <input type="checkbox" class="check" />
            <button class="btn listen"><input type="hidden" value="" />듣기</button>
            <button class="btn addSong">곡 추가</button>
            <button class="btn addPlayer">플레이어 추가</button>
            <button class="btn move">이동</button>
            <button class="btn copy">복사</button>
            <button class="btn delete">삭제</button>
            <button class="btn listenAll"><input type="hidden" value="" />전체 듣기</button>
            <button class="btn addPlayerAll">전체 플레이어 추가</button>
        
    </div><!-- trackButton end-->


    <div id="totalPlayTime"><a>20:20:20</a></div><!-- totalPlatTime end-->

    <div id="trackBox">
        <div class="trackBar">
            <ul>
                <li><a>곡</a></li>
                <li><a>아티스트</a></li>          
                <li><a>듣기</a></li>
                <li><a>재생 목록</a></li>
                <li><a>컬렉션</a></li>
                <li><a>삭제</a></li>
            </ul>
        </div><!--trackBar-->
        <div class="trackBarListBox">
            <ul class="albumList">
     <%for(Song song : songList) {
 
 		if(song.getCoverName()!=null) {
 			
 			
 
 		%>
         <div class="trackBarList">     
            <li><input type="checkbox" class="element check1"/></li>
            <li class="element cover"><img src="coverArt/<%=song.getCoverName()%>" width="40" height="40"/></li>
            <li class="element title"><%=song.getTitle()%></li>
            <li class="element artist"><%=song.getNickKo()%></li>    
            <li class="element trackPlay"><i class="far fa-play-circle"></i></li>
            <li class="element trackList"><i class="fas fa-list-ul"></i></li>
            <li class="element trackInsert"><i class="fas fa-folder-plus"></i></li>
            <li class="element trackDelete"><i class="fas fa-times"></i></li>
        </div>
      		<%} else {%>
      		  
      		<div class="trackBarList">     
            <li><input type="checkbox" class="element check1"/></li>
            <li class="element cover"><img src="coverArt/defaultcover.jpg" width="40" height="40"/></li>
            <li class="element title"><%=song.getTitle()%></li>
            <li class="element artist"><%=song.getNickKo()%></li>    
            <li class="element trackPlay"><i class="far fa-play-circle"></i></li>
            <li class="element trackList"><i class="fas fa-list-ul"></i></li>
            <li class="element trackInsert"><i class="fas fa-folder-plus"></i></li>
            <li class="element trackDelete"><i class="fas fa-times"></i></li>
        </div>
      		<% } %>
      		
      <%} %>
            </ul>
        </div><!--trackBoxList end-->
    </div><!--trackBox end-->
</div><!-- trackWarp end-->



<!--곡 추가 팝업창 마크업-->
<div id =addSongPopupBack></div><!--팝업 배경 불투명-->

<div id="addSongPopup" style="overflow:scroll">
    <div class="addSongSearchBox"><input type="text"placeholder="검색어 입력" name="" class="addSongSearch" /> <i class="fas fa-search"></i></div>
    <div class="recommendBox">
      <!--    <div class="recommend">
        <a href=""><div class="smallCard"><img src="img/car.jpg" width="100" height="100"></div></a>
        <ul class="addSongContents">
        <li>피스타치오</li>
        <li>데스파시토</li>
        <li>3:45</li>
        <li><i class="fas fa-play"></i> 3,607</li>
        <li><i class="far fa-star"></i> 3.7</li>
        <li><i class="far fa-hand-point-right"></i> 20</li>
        </ul>
        <div class="addSongBox"><i class="fas fa-plus"></i></div>
        </div>&lt;!&ndash;recommend end&ndash;&gt;  -->
    </div><!--recommendBox end-->
</div><!--addSongPopup end-->
<!--곡 추가 팝업창 end-->

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@(.+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};

    //컬렉션 곡 추가 리스트 템플릿
/*     var tmp = _.template($("#collectionListTmp").html());

    $.ajax({
        url: "ajax/collectionListForm.json",
        type: "get",
        dataType: "json",

        error:function () {


        },

        success:function (json) {

            $("#collectionList").append(tmp({collectionListForm:json}))

        }

    }); */
    //컬렉션 곡 추가 리스트 템플릿 end


    //곡 추가 팝업
    $(".addSong").click(function () {
    

        $("#addSongPopup").show();
        $("#addSongPopupBack").show();

    });

    $("#addSongPopupBack").click(function () {

        $("#addSongPopup").hide();
        $("#addSongPopupBack").hide();

    });
    //곡 추가 팝업 end

    
    //흠...
    $(".check").click(function () {
    	
    	$(".check1").click();
		
	})
	
	$.(".delete").click(function() {
		
	});
    
    


    //곡 팝업 리스트 템플릿
    var tmp1 = _.template($("#addSongTmp").html());

    $.ajax({
        url: "ajax/addSongForm.json",
        type: "get",
        dataType: "json",

        error:function () {



        },

        success:function (json) {


            $("#addSongPopup").append(tmp1({addSongForm:json}))

        }

    });
    //곡 팝업 템플릿 end





    //곡 팝업 무한 스크롤링
    $("#addSongPopup").scroll(function () {
        var sTop = $(this).scrollTop();

        console.log("스크롤탑:"+sTop);

        //브라우저의 높이
        var wTop = $("#addSongPopup").height();

        console.log("스크롤탑:"+sTop+"/브라우저높이:"+wTop);

        //문서의 높이
        var dTop = $(".recommendBox").height();

        if((dTop-5)<=wTop+sTop) {

            $.ajax({
                url: "ajax/addSongForm.json",
                type: "get",
                dataType: "json",
                error:function () {

                },

                success:function (json) {
                    $("#addSongPopup").append(tmp1({addSongForm:json}))

                }

            });


        }
        console.log("스크롤탑:"+sTop+"/브라우저높이:"+wTop+"/문서높이:"+dTop);

    });
    //곡 팝업 무한 스크롤링 end
</script>
</body>
</html>