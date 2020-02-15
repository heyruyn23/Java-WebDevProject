<%@page import="org.bjd.loopy.dao.BLKTagDAO"%>
<%@page import="org.bjd.loopy.vo.BLKTag"%>
<%@page import="org.bjd.loopy.util.PaginateUtil"%>
<%@page import="org.bjd.loopy.vo.PageVO"%>
<%@page import="org.bjd.loopy.dao.PlaylistsDAO"%>
<%@page import="org.bjd.loopy.vo.Playlist"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%


String pageStr = request.getParameter("page");
int pageNo = 1;
int numPage = 15;


if(pageStr!=null) {
	
	try {
		pageNo = Integer.valueOf(pageStr);
	}catch(Exception e) {
		System.out.println("숫자아님");			
	}//try~catch end
	
}//if end

PageVO pageVO = new PageVO(pageNo,numPage,"album");

List<Playlist> list = PlaylistsDAO.selectArtList(pageVO);

int total = PlaylistsDAO.selectTotal("album");	
			
int numBlock = 5;
			
String url = "/art_page_album.jsp";
String param = "page=";				
			
String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);				
			




   
    

    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>작품앨범</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
     <link rel="styleSheet" href="/css/art.css"/>
     <link rel="styleSheet" href="/css/paginate.css"/>
    <style>
        
        #album{
            width: 1200px;
            min-height:660px;
            padding: 10px 25px;
            margin: auto;
        }
        
        .album{
            width: 210px;
            height: 210px;
            position: relative;
            display:inline-block;
            margin:25px 10px;
            border: 2px solid transparent;
        }

        .album:hover{
            border: 2px solid #424242;
        }
        .play{
            position:absolute;
            width:120px;
            height:120px;
            text-align: center;
            line-height:120px;
            font-size: 50px;
            opacity: .6;
            z-index: 1;
            color: #fff;
        }
        .play:hover{
            cursor: pointer;
            opacity: 1;
        }
        .albumImg{
            width: 210px;
            height: 120px;
            background-image: url("img/view.jpg");
            float:left;
        }
        .albumIcon{
            position:absolute;
            right:0;
            width:90px;
            height:120px;
            background-color: rgba(0,0,0,.5);
            color: #fff;
            font-weight: 900;
        }
        .albumIcon>div{
            position:absolute;
        }
        .albumIcon>div:nth-child(1){
            right:35px;
            top:15px;
            font-size: 20px;
        }
        .albumIcon>div:nth-child(2) {
            font-size: 40px;
            left:25px;
            top: 45px;
        }
        .albumIcon>div:nth-child(3){
            right:0;
            bottom:0;
        }
        .albumIcon>div:nth-child(4){
            top:2px;
            right:2px;
            z-index:2;
        }

        .albumInfo{
            position: relative;
            top:120px;
            width:210px;
            height:90px;
            color: #fff;
        }

        .albumInfo>div{
            position:absolute;
            top:10px;
            left:10px;
            width: 190px;
        	height: 17px;
        }
        .albumInfo>div:nth-child(2){
            top:30px;
        }
        .albumInfo>div:nth-child(3){
            top:50px;
        }
        .albumInfo>div:nth-child(4){
            top:70px;
        }
        .collectionInfo>div:nth-child(2){
            top:30px;
            z-index:1;
        }
        .collectionInfo>div:nth-child(3){
            top:50px;
        }
        .collectionInfo>div:nth-child(4){
            top:70px;
        }
        .playingMusic{
        border: 2px solid #424242;
    	}
    	.bookmark:hover{
        animation: rotate ease 1s;
   		}
    	@keyframes rotate { /* 북마크 별 돌리기 */
	        0%{transform: scale(1.2) rotate(0deg)}
	        25%{transform: scale(1.2) rotate(90deg)}
	        50%{transform: scale(1.2) rotate(180deg)}
	        75%{transform: scale(1.2) rotate(270deg)}
	        100%{transform: scale(1.2) rotate(360deg)}
  		 }
        
        

    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<% int type = 4; %>
<%@ include file="/WEB-INF/template/art_header.jsp" %>
  

<div id="album">
    <ul id="albumList">
    <%for(Playlist playlist : list) {
    
    	BLKTag blkTag = new BLKTag(playlist.getNo(),"album");
    	List<String> blkTags = BLKTagDAO.selectList(blkTag);
    
    
    %>
    <li class="album">
        <div class="play">
            <i class="fas fa-play-circle"></i>
        </div>
        <div class="albumImg"></div>
        <a href="/album_detail_page.jsp?albumNo=<%=playlist.getNo() %>">
        <div class="albumIcon">
            <div class="totalNumOfSongs"><span id="numOfSongs">20</span></div>
            <div><i class="fas fa-list-ul"></i></div>
            <div class="albumPlayTime"><span id="playingTime">02:47:35</span></div>
            <div class="bookmark"><i class="far fa-star"></i></div>
        </div></a>
        <div class="albumInfo">
            <div class="albumTitle"><span id="coverImg"><%=playlist.getName() %></span></div>
            <div class="albumArtist"><span id="artist"><%=playlist.getNickKo() %></span></div>
            <div class="albumTags">
            <%for(String tag : blkTags ) {%>
            <span id="tag"><%=tag %></span>
            <% } %>
            </div>
            <div class="albumNotes"><i class="fas fa-music"></i>X<span id="totalPlayedTime">10</span></div>
        </div>
    </li>
    <%} %>
    </ul>
    <%=paginate %>
</div><!--//#album-->

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>


$("#albumList").on("click",".bookmark",function () {
    if($(this).children().eq(0).hasClass("far fa-star")){
        $(this).children().eq(0).attr("class","fas fa-star").css("color","yellow");
    }
    else{
        if(!confirm("북마크를 해지하시겠습니까?")){
            return false;
        }
        $(this).children().eq(0).attr("class","far fa-star").css("color","white");
    }
    return false; // 이벤트 버블링 (전파) 방지
});

$("#albumList").on("click",".album",function () {
    $(".playingMusic").removeClass("playingMusic");
    $(this).addClass("playingMusic");
});



// 언더스코어 템플릿
var tmp = _.template($("#albumTmp").html());

for(var i=0; i<8; i++){
    $("#albumList").append(tmp());

   
};

$("#albumList").on("click",".play",function () {
    if($(this).children().hasClass("fas fa-play-circle")){
        $(".play i").attr("class","fas fa-play-circle");
        $(this).children().attr("class","fas fa-pause-circle");
    }else{
        $(this).children().attr("class","fas fa-play-circle");
    }
    return false; // 이벤트 버블링 (전파) 방지
});

$("#albumList").on("click",".play i",function () {

});

$(window).scroll(function () {
    // 스크롤탑
    var sTop=$(this).scrollTop();

    // 브라우저의 높이
    var wTop=$(window).height();

    // 문서의 높이
    var dTop = $(document).height();

    if((dTop-50)<=wTop+sTop){
        // 언더스코어 템플릿 이용해서 추가
    	getAlbum();
    }//if end
    console.log("스크롤탑:"+sTop+"/브라우저 높이:"+wTop+"/문서의 높이:"+dTop);
}); //scroll() end


    function getAlbum() {
    	
  	  for(var i=0; i<20; i++){
            $("#albumList").append(tmp());
            var height=$("#album").css("height");
            $("#album").css("height",height+200);
        }
		
	}
  
  getAlbum(); 






    //상단 탭 이동
    $("#tab>.tab").click(function () {
        $(".on").removeClass("on").before();
        $(this).addClass("on");

    });
    //상단 탭 이동 end



$(".select").change(function () {

    location.href="art_page_upload.html";
});

</script>
</body>
</html>