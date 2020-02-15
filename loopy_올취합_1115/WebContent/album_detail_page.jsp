<%@page import="org.bjd.loopy.vo.Song"%>
<%@page import="org.bjd.loopy.dao.SongsDAO"%>
<%@page import="org.bjd.loopy.dao.BLKTagDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.vo.BLKTag"%>
<%@page import="org.bjd.loopy.dao.PlaylistsDAO"%>
<%@page import="org.bjd.loopy.vo.Playlist"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	
	String albumNoStr = request.getParameter("albumNo");
	int albumNo = Integer.parseInt(albumNoStr); 
	
	Playlist playlist = PlaylistsDAO.selectPlaylist(albumNo);
	
	BLKTag blkTag = new BLKTag(playlist.getNo(),"album");
	List<String> blkTags = BLKTagDAO.selectList(blkTag);
	
	
	
	/* Playlist playlist  =new Playlist(playlist.getNo(),"album"); */
	
	List<Song> songList = SongsDAO.selectList(albumNo);
	
	System.out.println(songList.size());


%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>album상세페이지</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <style>
        html {
            overflow-y: scroll;
        }

        #albumWrap{
            width: 1200px;
            margin: auto;
            margin-top: 50px;
          /*   border: solid 1px white; */
            height:500px;
        }
        
        #album{
            width: 1200px;
            height: 30px;
            font-size: 18px;
        }
        .albumInfor{
            position: absolute;
            width: 1200px;
            height: 380px;
            

        }
        .albumCover{
            width: 260px;
            height: 260px;
            margin-top: 10px;

        }
        .albumTag{
            width:200px;
            height: 40px;
            position: absolute;
            top:280px;
            left:30px;


        }
        .albumArtist{
            width: 200px;
            height: 40px;
            position: absolute;
            top:10px;
            left:300px;

        }

        .albumTitle{
            width: 200px;
            height: 40px;
            position: absolute;
            top:60px;
            left:300px;


        }

        .albumDate {
            width: 200px;
            height: 40px;
            position: absolute;
            top:110px;
            left:300px;


        }

        .albumPlayTime{
            width: 200px;
            height: 40px;
            position: absolute;
            top:160px;
            left:300px;

        }
        .albumIntroduction{
            width: 600px;
            height: 160px;
            border-radius: 5px;
            position: absolute;
            top:220px;
            left:300px;
            background: #181818;

        }

        .textarea{
            position: absolute;
            width:595px;
            height:154px;
            resize:none;
            border-radius: 5px;
            display: none;
            z-index: 1;

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
            background-color: #383838;
            width: 1200px;
            height: 30px;
            border-bottom: 1px solid white;

        }
        .trackBarListBox{
            width: 1200px;

        }

        .trackBarList{
            width: 1200px;
            height: 40px;
            border-bottom: solid 1px white;
            background-color: rgba(255, 255 ,255, 0.9);
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
            color: black;
            font-weight: bold;
        }

        .totalSearch button {
            color: white;
            font-size: 13px;
            text-align: center;
            cursor: pointer;
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

        #addSongPopup{
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
            z-index: 1;
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

        .smallCard img{
            border-radius: 5px;
        }

        .addSongContents{
            position: relative;
            width: 550px;
            height: 100px;
            top: -100px;
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
            right: 135px;

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

   /*   .albumInfor>span{
            font-size: 17px;
            vertical-align: -15px;

        }  */
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
<!-- 곡추가 리스트 스크립트-->


 
  
<!-- 곡추가 리스트 스크립트 end-->

<!--곡 추가 팝업 스크립트 -->
<script type="text/template" id="addSongTmp">
    <@ _.each(addSongForm,function(addSong){ @>
    <div class="recommend">
    <a href=""><div class="smallCard"><img src="img/<@=addSong.coverName@>" width="100" height="100"/></div></a>
    <ul class="addSongContents">
        <li class="addSongArtist"><@=addSong.nickKo@></li>
        <li class="addSongTitle"><@=addSong.title@></li>
        <li class="addSongTime">10:10</li>
    <li><i class="fas fa-play"></i> <@=addSong.hit@></li>
    <li><i class="far fa-star"></i>2.5</li>
    <li><i class="far fa-heart"></i> 10</li>
    </ul>
    <a href=""><div class="addSongBox"><i class="fas fa-plus"></i></div></a>
    </div>
    <@ }); @>
</script>
<!--곡 추가 팝업 스크립트 end-->






<div id="albumWrap">
<%if(playlist.getAcType().equals("album")){ %>
    <div id="album"><h3>앨범</h3></div>
    <%} %>
    <div class="albumInfor">
        <div class="albumCover"><img src="/cover/<%=playlist.getCoverName()%>" width="260" height="260"/></div>
        <div class="albumTag"> <%for(String tag : blkTags ) {%>
            <span id="tag"><%=tag %></span>
            <% } %></div>
        <div class="albumArtist"><span><%=playlist.getNickKo() %></span></div>
        <div class="albumTitle"><span><%=playlist.getName()%></span></div>
        <div class="albumDate"><span><%=playlist.getRegdate() %></span></div>
        <div class="albumPlayTime"><span>05:40:17</span></div>
        <div class="albumIntroduction"><form action="" method="post"><textarea class="textarea"></textarea><p><%=playlist.getContent() %></p></form></div></div><!--albumInfor end-->
    </div><!--albumInfor end-->
</div><!-- albumWrap end-->

<div id="trackWarp">
    <div id="track"><h3>수록곡</h3></div><!--track-->
    <div class="trackButton">
       
            <input type="checkbox" class="check">
            <button class="btn listen"><input type="hidden" class="songNo" value=""/>듣기</button>
            <button class="btn addSong">곡 추가</button>
            <button class="btn addPlayer">플레이어 추가</button>
           <!--  <button class="btn move">이동</button> -->
            <button class="btn copy">복사</button>
            <button class="btn delete">삭제</button>
            <button class="btn listenAll"><input type="hidden" class="songNo" value=""/>전체 듣기</button>
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


<!--곡 추가 팝업창-->
<div id =addSongPopupBack></div><!--addSongPopupBack end(팝업시 배경불투명)-->

<div id="addSongPopup" style="overflow:scroll">
    <div class="addSongSearchBox"><input type="text"placeholder="검색어 입력" name="" class="addSongSearch" /> <i class="fas fa-search"></i></div>
    <div class="recommendBox">
        <!--<div class="recommend">-->
        <!--<a href=""><div class="smallCard"><img src="img/car.jpg" width="100" height="100"></div></a>-->
        <!--<ul class="addSongContents">-->
        <!--<li>피스타치오</li>-->
        <!--<li>데스파시토</li>-->
        <!--<li>3:45</li>-->
        <!--<li><i class="fas fa-play"></i> 3,607</li>-->
        <!--<li><i class="far fa-star"></i> 3.7</li>-->
        <!--<li><i class="far fa-heart"></i> 20</li>-->
        <!--</ul>-->
        <!--<div class="addSongBox"><i class="fas fa-plus"></i></div>-->
        <!--</div>&lt;!&ndash;recommend end&ndash;&gt;-->
    </div>
</div><!--addSongPopup end-->
<!-- 곡 추가 팝업창 end-->

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
		
		
//앨범 소개글
var cnt=0;
var $textarea = $(".albumIntroduction textarea");
$(".albumIntroduction").click(function (event) {
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
}); // editname keyup end


$textarea.on("keyup",function (e) {
    if (e.ctrlKey && e.keyCode == 13) {
        var value= $(this).val();
        $(this).next().text(value);
        $(this).css("display","none");
    }
}); // editname keyup end
//앨범 소개글 end



    //앨범 곡 추가 리스트 템플릿
  /*   var tmp = _.template($("#albumListTmp").html());

    $.ajax({
        url: "ajax/albumListForm.json",
        type: "get",
        dataType: "json",

        error:function () {


        },

        success:function (json) {


            $(".albumList").append(tmp({albumListForm:json}));

        }

    }); */
    //앨범 곡 추가 리스트 템플릿end




    //곡 팝업 템플릿
    var tmp1 = _.template($("#addSongTmp").html());
    
    
    var q= "";
    
	function getSongs() {
    $.ajax({
        url: "ajax/addSong.jsp",
        type: "get",
        dataType: "json",
        data:{"q":q},
        error:function () {

        },
        success:function (json) {

            $("#addSongPopup").append(tmp1({addSongForm:json}))

        }

    });
    //곡 팝업 템플릿 end

	}//getSongs() end
	
	getSongs();
	
	


    //곡 히든
    $(".addSong").click(function (e) {
        e.preventDefault();

        $("#addSongPopup").show();
        $("#addSongPopupBack").show();

    });

    $("#addSongPopupBack").click(function () {

        $("#addSongPopup").hide();
        $("#addSongPopupBack").hide();

    });
    //곡 히든end



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