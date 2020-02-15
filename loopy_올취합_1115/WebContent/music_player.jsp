<%@page import="org.bjd.loopy.dao.PlaylistsDAO"%>
<%@page import="org.bjd.loopy.vo.Playlist"%>
<%@page import="org.bjd.loopy.vo.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//User loginUser = (User)session.getAttribute("loginUser");

	//int userNo = loginUser.getNo();
	
	int userNo = 1;

	List<Playlist> albumList = PlaylistsDAO.selectAlbums(userNo);
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Loopy - 음악 감상</title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="/css/default.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

    <style>
        html {
            overflow-y: hidden;
        }
        html, body {
            width: 100%;
            height: 100%;
        }
        body {
            font-family: 'Nanum Gothic', sans-serif;
            font-size: 13px;
            font-weight: 400;
        }
        .verBar {
            width: 1px;
            height: 7px;
            font-size: 0;
            margin: 0 10px;
            display: inline-block;
            vertical-align: center;
            background-color: #424242;
        }
        #playerHeader {
            height: 40px;
            position: fixed;
            left:0;
            top: 0;
        }
        .logo {
            width: 100px;
            height: 50px;
        }
        .logo a {
            width: 100px;
            height: 40px;
            margin-top: 5px;
            background-image: url("img/logo_em.png");
            background-size: contain;
        }
        #control {
            height: 170px;
            position: fixed;
            top: 40px;
            width: 100%;
        }
        #listTab {
            height: 30px;
            position: fixed;
            top: 210px;
        }
        .tab {
            float: left;
            padding: 0 12px;
            height: 30px;
            background: #595959;
            line-height: 30px;
            border-radius: 5px 5px 0 0;
            border-left: 1px solid #121212;
            border-right: 1px solid #121212;
            cursor: pointer;
        }
        #footer {
            width: 100%;
            min-width: 170px;
            height: 30px;
            line-height: 30px;
            position: fixed;
            bottom: 0;
            z-index: 10;
            background-color: #121212;
        }
        #blocker {
            width: 100%;
            height: 30px;
            position: absolute;
            background-color: rgba(0,0,0,.8);
            left: 0;
            top: 0;
            display: none;
        }
        #footer .disable {
            display: block;
        }
        .entireLength {
            height: 30px;
            line-height: 30px;
            position: fixed;
            bottom: 0;
            right: 20px;
            z-index: 100;
        }
        .ajaxWrap:hover {
            background-color: #383838;
            cursor: pointer;
        }
        .songWrap {
            position: absolute;
            top: 240px;
            width: 100%;
            height: 300px;
            overflow-y: scroll;
            background-color: #252525;
        }
        .ajaxWrap {
            position: relative;
            height: 20px;
            line-height: 20px;
        }
        .albumList .ajaxWrap span:first-child ,.collectionList .ajaxWrap span:first-child {
            margin-left: 20px;
        }
        .song {
            height: 20px;
            line-height: 20px;
            position: absolute;
            top: 0;
            left: 20px;
        }
        #footer button {
            padding: 2px 5px;
            vertical-align: middle;
        }
        #footer input {
            vertical-align: middle;
        }
        .playing {
            color: red;
        }
        .clicked {
            background-color: #383838;
        }
        .controller {
            width: 240px;
            height: 40px;
            position: absolute;
            top: 75px;
            left: 120px;
        }
        .controller .btn {
            background-size: contain;
            background-color: #121212;
            width: 30px;
            height: 30px;
            position: absolute;
            cursor: pointer;
        }
        .prevBtn {
            background-image: url("img/prev.png");
        }
        #control .controller .playBtn {
            background-image: url("img/play.png");
            left: 40px;
            top: -5px;
            width: 40px;
            height: 40px;
            border-radius: 20px;
        }
        .nextBtn {
            background-image: url("img/next.png");
            left: 90px;
        }
        .repeatBtn {
            background-image: url("img/repeat.png");
            left: 130px;
        }
        .shuffleBtn {
            background-image: url("img/shuffle.png");
            left: 170px;
        }
        .muteBtn {
            background-image: url("img/volume.png");
            left: 210px;
        }
        #control .likeBtn {
            background-image: url("img/like.png");
            position: fixed;
            top: 50px;
            right: 10px;
        }
        .cover {
            width: 100px;
            height: 100px;
        }
        .songInfo {
            margin-left: 10px;
            margin-top: 10px;
            min-width: 390px;
            position: relative;
        }
        .infoTable {
            position: absolute;
            left: 105px;
            top: 0;
        }
        .infoTable dt, dd {
            margin: 5px 0;
        }
        .songInfo .infoTable dt {
            margin-top: 0;
        }
        .titleTxt {
            font-size: 14px;
            font-weight: bold;
        }
        #progBar {
            width: 358px;
            height: 38px;
            margin-left: 10px;
            border: 1px solid #424242;
        }
        .wholeLength {
            width: 360px;
            height: 20px;
            line-height: 20px;
            text-align: right;
        }
        #wrap #control .controller .on {
            background-image: url("img/pause.png");
        }
        #wrap #control .controller .liked {
            background-image: url("img/liked.png");
        }
        .tabPage {
            display: none;
        }
        .songWrap .view {
            display: block;
        }
        .songNum {
            color: #aaa;
            font-size: 10px;
        }
        .length {
            display: none;
        }
        .songLength {
            width: 360px;
            text-align: right;
        }
        .btnWrap {
            display: none;
            position: absolute;
            right: 20px;
            top: 0;
        }
        .btnWrap button {
            cursor: pointer;
            background-color: #252525;
        }
        .btnWrap button:hover {
            color: yellow;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <div id="playerHeader">
            <h1 class="logo">
                <a class="screen_out" href="">Loopy</a>
            </h1>
            <h2 class="screen_out">뮤직플레이어</h2>
        </div><!-- #playerHeader -->
        <div id="control">
            <div class="songInfo">
                <div class="cover"><img src="/profile/yum.jpg" width="100" height="100" title="노래제목"/></div>
            	<dl class="infoTable">
	                <dt><span class="titleTxt">노래제목</span></dt>
	                <dd><span class="albumTxt">앨범명</span></dd>
	                <dd><span class="artistTxt">윰댕</span></dd>
                </dl>
                <div class="songLength"><span class="lengthTxt">3:45</span></div>
            </div>
            <div class="controller">
                <button class="prevBtn screen_out btn">이전</button>
                <button class="playBtn screen_out btn">재생</button>
                <button class="nextBtn screen_out btn">다음</button>
                <button class="repeatBtn screen_out btn">반복</button>
                <button class="shuffleBtn screen_out btn">셔플</button>
                <button class="muteBtn screen_out btn">음소거</button>
                <div class="volumeCtl">음량</div>
                <button class="likeBtn screen_out btn">추천</button>
            </div>
            <div id="progBar"></div>
        </div><!-- #control -->
        <div id="list">
            <div id="listTab">
                <div class="tab playerList clicked" data-tabIdx="0"><a href="">재생목록</a></div>
                <%-- <% if(loginUser != null) { %> --%>
                <div class="tab myAlbum" data-tabIdx="1"><a href="">내 앨범</a></div>
                <div class="tab myCollection" data-tabIdx="2"><a href="">내 컬렉션</a></div>
                <%-- <% } %> --%>
            </div><!-- #listTab -->
            <div class="songWrap">
                <div class="songList tabPage view"></div>
                <div class="albumList tabPage">
                	<% for(Playlist album : albumList) { int i = 0; %>
                	<div class="ajaxWrap">
				        <div class="album">
				            <span class="listName"><%= album.getName() %></span>
				            <span class="verBar"></span>
				            <span class="listProducer"><%--<%= loginUser.getNickKo() %> --%>피스타치오</span>
				            <span class="songNum">(<%= album.getWholeNum() %>곡)</span>
				            <span class="length"><%= album.getWholeDuration() %></span>
				            <span class="btnWrap" data-idx="<%= i%>">
				                <button class="colBtn">전체듣기</button>
				                <button class="addBtn">재생목록에 추가</button>
				            </span>
				        </div><!-- //.album -->
	    			</div><!--//#ajaxWrap-->
	    			<% i++; } %>
                </div>
                <div class="collectionList tabPage"></div>
            </div><!-- .songWrap -->
        </div><!-- #list -->
        <div id="footer">
            <input type="checkbox" class="selectAll" />
            <button class="moveBtn" data-dir="up"><i class="fas fa-angle-up"></i><span class="screen_out">위로</span></button>
            <button class="moveBtn" data-dir="down"><i class="fas fa-angle-down"></i><span class="screen_out">아래로</span></button>
            <button class="takeBtn">담기</button>
            <button class="delBtn">삭제</button>
            <div class="entireLength">총 <span class="wholeLength">00:00:00</span></div>
            <div id="blocker"></div>
        </div><!-- #footer -->
    </div><!-- #wrap -->
<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/moment-with-locales.js"></script>
<script src="js/wavesurfer.js"></script>
<script>
	
	jQuery.ajaxSettings.traditional = true;
	
	var idx = 0;
	var wholeDur = 0;
	var datas = [];
	var newToPage = 0;
	
	function createSongList() {
		var flag = localStorage.getItem("flag");
		if(flag=="false") {
			$(opener.document).find(".selectSong").each(function() {
				
				if($(this).prop("checked")) {
					
					var nums = $(this).next().attr("value");
					datas.push(nums);
					
				}//if end
			});//opener .selectSong.each() end
		}//if end
		flag = localStorage.setItem("flag",true);
		getSongs();
	}//createSongList() end
	
	createSongList();	
	
	function getSongs() {
		
			var songs = localStorage.getItem("songs");
			var tmp = [];
			var startIdx = 0;
			
			if(songs) {
				songs = JSON.parse(songs);
				$(songs).each(function() {
					var $that = $(this);
					$(datas).each(function() {
						if($that.no != this) {
							tmp.push(this);
						}//if end
					});//$(datas).each() end
				});//$(songs).each() end
				
				$(songs).each(function (idx) {
					startIdx++;
					if(idx==0) {
                    	var $ajaxWrap = $("<div>").attr("class","ajaxWrap playing");
					}else {
						var $ajaxWrap = $("<div>").attr("class","ajaxWrap");
					}
                    var $checkBox = $("<input>").attr({
                                                        "type": "checkbox",
                                                        "class": "checks"
                                                        });
                    var $song = $("<div>").attr("class", "song");
                    var $title = $("<span>").attr("class", "listTitle").text(this.title);
                    var $bar = $("<span>").attr("class", "verBar");
                    var $artist = $("<span>").attr("class","listArtist").text(this.nickKo);
                    var $hiddenNo = $("<input>").attr({
                    	"type":"hidden",
                    	"value":this.no,
                    	"class":"songNo"
                    });
                    var $hiddenMp3 = $("<input>").attr({
                    	"type":"hidden",
                    	"value":this.mp3Name,
                    	"class":"mp3Name"
                    });
                    var $hiddenCover = $("<input>").attr({
                    	"type":"hidden",
                    	"value":this.coverName,
                    	"class":"cover"
                    });
                    var $hiddenProfile = $("<input>").attr({
                    	"type":"hidden",
                    	"value":this.profile,
                    	"class":"profile"
                    });
                    var $hiddenAlbum = $("<input>").attr({
                    	"type":"hidden",
                    	"value":this.album,
                    	"class":"album"
                    });
                    var $hiddenDuration = $("<input>").attr({
                    	"type":"hidden",
                    	"value":this.duration,
                    	"class":"duration"
                    });
                    $ajaxWrap.attr("data-idx",idx)
                    .append($checkBox,$song.append($title, $bar, $artist, $hiddenNo,
                    		$hiddenMp3, $hiddenCover, $hiddenProfile, $hiddenAlbum, $hiddenDuration))
                    .appendTo(".songList");
                    
                })//$(json).each() end
				
			}else {
				tmp = datas;
			}//if~else end
			
		if(tmp.length>0) {
			
			$.ajax({
				url: "ajax/playSong.jsp",
				dataType: "json",
				type: "get",
				data: {"songNo": tmp},
				error: function() {
					alert("ajax 업데이트 중 에러");
				}, success: function(json) {
					datas = [];
					var songs = localStorage.getItem("songs");
					var shield = 0;
					if(!songs) {
						songs = JSON.stringify(json);
						localStorage.setItem("songs",songs);
						shield = 1;
					}//if end
					
					songs = JSON.parse(songs);
					
					$(json).each(function (idx) {
						idx = idx + startIdx;
						if(shield != 1) {
							songs.push(this);
						}
						if(idx==0) {
	                    	var $ajaxWrap = $("<div>").attr("class","ajaxWrap playing");
						}else {
							var $ajaxWrap = $("<div>").attr("class","ajaxWrap");
						}
	                    var $checkBox = $("<input>").attr({
	                                                        "type": "checkbox",
	                                                        "class": "checks"
	                                                        });
	                    var $song = $("<div>").attr("class", "song");
	                    var $title = $("<span>").attr("class", "listTitle").text(this.title);
	                    var $bar = $("<span>").attr("class", "verBar");
	                    var $artist = $("<span>").attr("class","listArtist").text(this.nickKo);
	                    var $hiddenNo = $("<input>").attr({
	                    	"type":"hidden",
	                    	"value":this.no,
	                    	"class":"songNo"
	                    });
	                    var $hiddenMp3 = $("<input>").attr({
	                    	"type":"hidden",
	                    	"value":this.mp3Name,
	                    	"class":"mp3Name"
	                    });
	                    var $hiddenCover = $("<input>").attr({
	                    	"type":"hidden",
	                    	"value":this.coverName,
	                    	"class":"cover"
	                    });
	                    var $hiddenProfile = $("<input>").attr({
	                    	"type":"hidden",
	                    	"value":this.profile,
	                    	"class":"profile"
	                    });
	                    var $hiddenAlbum = $("<input>").attr({
	                    	"type":"hidden",
	                    	"value":this.album,
	                    	"class":"album"
	                    });
	                    var $hiddenDuration = $("<input>").attr({
	                    	"type":"hidden",
	                    	"value":this.duration,
	                    	"class":"duration"
	                    });
	                    $ajaxWrap.attr("data-idx",idx)
	                    .append($checkBox,$song.append($title, $bar, $artist, $hiddenNo,
	                    		$hiddenMp3, $hiddenCover, $hiddenProfile, $hiddenAlbum, $hiddenDuration))
	                    .appendTo(".songList");
	                    
	                })//$(json).each() end
	                
	                songs = JSON.stringify(songs);
	                localStorage.setItem("songs",songs);
	                
	                changeInfo();
				}//success() end
			});//$.ajax() end
		}else {
			changeInfo();
		}
		
		setWholeLength();
	}//getSongs() end
	
	var wavesurfer;
	var tmpLength = 0;
	
	function initAudio(mp3) {
        
		wavesurfer = WaveSurfer.create({
			container: "#progBar",
            waveColor: '#585858',
            progressColor: '#fff',
            height:38,
            barWidth:1,
            closeAudioContext: true
		});
		wavesurfer.load(mp3);
		wavesurfer.on('ready', function() {
			wavesurfer.play();
			$(".playBtn").addClass("on");
			tmpLength = wavesurfer.getDuration();
		});
        wavesurfer.on('finish', function() {
        	var $nextSong = $(".playing").next();
        	$(".ajaxWrap").removeClass("playing");
        	$nextSong.addClass("playing");
        	changeInfo();
        });
	}//initAudio() end
	
	function changeInfo() {
		
		if(newToPage != 0) {
			wavesurfer.destroy();
		}//if end
		
		var cover = $(".playing .cover").attr("value");
		var title = $(".playing .listTitle").text();
		var album = $(".playing .album").attr("value");
		var artist = $(".playing .listArtist").text();
		var mp3 = $(".playing .mp3Name").attr("value");
		var duration = $(".playing .duration").attr("value");
		var profile = $(".playing .profile").attr("value");
		
		if(profile == undefined) {
			profile = "/profile/default_user.png"
		}
		if(cover == undefined) {
			cover = profile;
		}//if end
		
		if(album == undefined) {
			album = "";
		}
		duration = msToMAS(duration);
		
		mp3 = "/audio/" + mp3;
		//console.log("커버 : " + cover + " / 타이틀 : " + title + " / 앨범 : " + album + " / 아티스트 : "
		//		+ artist + " / mp3 : " + mp3 + " / 길이 : " + duration + " / 프로필 : " + profile)
		
		$(".cover>img").attr("src",cover);
		$(".titleTxt").text(title);
		$(".albumTxt").text(album);
		$(".artistTxt").text(artist);
		$(".lengthTxt").text(duration);
		initAudio(mp3);
		newToPage++;
	}//changeInfo() end
	
	function setWholeLength() {
		var num = 0;
		var tmpArr = []; 
		
		$(".duration").each(function() {
			var tmpNum = $(this).attr("value");
			tmpArr.push(tmpNum);
		});
		var arrSize = tmpArr.length;
		
		for(var i = 0 ; i < arrSize ; i++) {
			num = num + parseInt(tmpArr[i]);
		}
		
		$(".wholeLength").text(msToHMAS(num));
		
	}//setWholeLength() end
	
	function msToMAS(millis) {
		  var minutes = Math.floor(millis / 60000).toFixed(0);
		  var seconds = ((millis % 60000) / 1000).toFixed(0);
		  return minutes + ":" + (seconds < 10 ? '0' : '') + seconds;
	}//msToMAS() end
	
	function msToHMAS(millis) {
		var hours = Math.floor(millis / 3600000).toFixed(0);
		var minutes = Math.floor((millis % 3600000) / 60000).toFixed(0);
		var seconds = (((millis % 3600000) % 60000) / 1000).toFixed(0);
		
		if(hours==0) {
			hours = "00";
		}else if(hours < 10) {
			hours = '0' + hours;
		}else {
		}//if~else if~else end
		
		return hours + ":" + (minutes < 10 ? '0' : '') + minutes + ":"
				+ (seconds < 10 ? '0' : '') + seconds;
	}//msToHMAS() end
	
    function getAlbums() {
        $.ajax({
            url:"data/albums.json",
            type:"get",
            dataType:"json",
            <%-- data:"userNo":"<%= loginUser.getNo() %>" --%>
            error: function() {
                alert("서버점검중");
            }, success: function(data) {
                $(data).each(function (idx) {
                    var $ajaxWrap = $("<div>").attr("class","ajaxWrap");
                    var $album = $("<div>").attr("class", "album");
                    var $name = $("<span>").attr("class", "listName").text(this.name);
                    var $bar = $("<span>").attr("class", "verBar");
                    var $producer = $("<span>").attr("class","listProducer").text(this.producer);
                    var $songNum = $("<span>").attr("class","songNum").text(" (" + this.contain + "곡)");
                    var $length = $("<span>").attr("class","length").text(this.length);
                    var $btnWrap = $("<span>").attr({
                                                    "class": "btnWrap",
                                                    "data-idx": idx
                                                    });
                    var $collapseBtn = $("<button>").attr("class","colBtn").text("전체듣기");
                    var $addBtn = $("<button>").attr("class","addBtn").text("현재 재생목록에 추가");
                    $ajaxWrap.append($album.append($name, $bar, $producer,
                        $songNum, $length, $btnWrap.append($collapseBtn, $addBtn)
                        )).appendTo(".albumList");
                })//$(data).each() end
            }//success: function() end
        });//$.ajax() end
    }//getAlbums() end

    function getCollections() {
        $.ajax({
            url:"data/collections.json",
            type:"get",
            dataType:"json",
            error: function() {
                alert("서버점검중");
            }, success: function(data) {
                $(data).each(function (idx) {
                    var $ajaxWrap = $("<div>").attr("class","ajaxWrap");
                    var $collection = $("<div>").attr("class", "collection");
                    var $name = $("<span>").attr("class", "listName").text(this.name);
                    var $bar = $("<span>").attr("class", "verBar");
                    var $producer = $("<span>").attr("class","listProducer").text(this.producer);
                    var $songNum = $("<span>").attr("class","songNum").text(" (" + this.contain + "곡)")
                    var $length = $("<span>").attr("class","length").text(this.length)
                    var $btnWrap = $("<span>").attr({
                        "class": "btnWrap",
                        "data-idx": idx
                    });
                    var $collapseBtn = $("<button>").attr("class","colBtn").text("전체듣기");
                    var $addBtn = $("<button>").attr("class","addBtn").text("현재 재생목록에 추가");
                    $ajaxWrap.append($collection.append($name, $bar, $producer,
                        $songNum, $length, $btnWrap.append($collapseBtn, $addBtn)
                        )).appendTo(".collectionList");
                })//$(data).each() end
            }//success: function() end
        });//$.ajax() end
    }//getCollections() end

    $(".songList").on("click", ".song", function () {
        var idx = $(this).parent().index();
        $(".ajaxWrap").removeClass("playing");
        $(this).parent().toggleClass("playing");
        playFlag();
        changeInfo();
    })//.song.onclick() end
    
    $(window).resize(function () {
        var winHeight = $(document).height()-270;
        $(".songWrap").css("height",winHeight);
    })
    
    function playFlag() {
        if($(".playBtn").hasClass("on")) {
            $(".playBtn").text("일시정지");
        }else {
            $(".playBtn").text("재생");
        }//if~else end
    }//playFlag() end
    
    $(".playBtn").click(function() {
        $(this).toggleClass("on");
        playFlag();
        wavesurfer.playPause();
    })

    function likeFlag() {
        if($(".likeBtn").hasClass("liked")) {
            $(".likeBtn").text("추천취소");
        }else {
            $(".likeBtn").text("추천");
        }//if~else end
    }//playFlag() end

    $(".likeBtn").click(function() {
        $(this).toggleClass("liked");
        likeFlag();
    })
    
    $(".tab").click(function(evt) {
        evt.preventDefault();
        $(".tab").removeClass("clicked");
        $(this).toggleClass("clicked");
        var idx = $(this).attr("data-tabIdx");
        $(".songWrap .view").removeClass("view");
        $(".tabPage").eq(idx).addClass("view");
        
        if(idx == 0) {
            $("#blocker").removeClass("disable");
            setWholeLength();
        }
        <%-- <% if(loginUser != null) { %> --%>
        else if(idx == 1) {
            //getAlbums();
        }else {
            getCollections();
        }//if~else if~else end
        <%-- <% } %> --%>
        if(idx != 0) {
            $("#blocker").removeClass("disable");
            $("#blocker").toggleClass("disable");
            $(".wholeLength").text("00:00:00");
        }//if end
    });//.tab.click() end
    
    $(".selectAll").change(function() {
        if($(this).prop("checked")) {
            $(".checks").prop("checked",true).parent().addClass("target");
        }else {
            $(".checks").prop("checked",false).parent().removeClass("target");
        }//if~else end
    })//.selectAll.change() end
    
    $(".songList").on("change",".checks", function() {
        $(this).parent().toggleClass("target");
    })
    
    $(".moveBtn").click(function() {
        var direction = $(this).data("dir");
        var idx = $(".target").index()-1;
//        var $before = $(".ajaxWrap").index(idx-1);
        var $before = $(".target").prev().first();
        var $after = $(".target").next().last();
        if(direction == "up") {
            $(".target").remove().insertBefore($before);
        }else {
            $(".target").remove().insertAfter($after);
        }//if~else end
    })//.moveBtn.click() end

    $(".takeBtn").click(function () {
        alert("컬렉션에 담기 insert/update")
    })//.takeBtn.click() end

    $(".delBtn").click(function () {
        $(".target").remove();
    })//.delBtn.click() end
    
    $(".songWrap").on("click",".albumList .album, .collectionList .collection", function () {
        $(".album, .collection").removeClass("playing");
        $(this).toggleClass("playing");
        var length = $(this).children().eq(4).text();
        $(".wholeLength").text(msToHMAS(length));
        $(".btnWrap").removeClass("view");
        $(this).children().eq(5).toggleClass("view");
    })
    
    window.onbeforeunload = function() {
    	var storage = [];
    	$(".song").each(function() {
    		
    		var no = $(this).children(".songNo").attr("value");
    		var title = $(this).children(".listTitle").text();
    		var nickKo = $(this).children(".listArtist").text();
    		var mp3Name = $(this).children(".mp3Name").attr("value");
    		var coverName = $(this).children(".cover").attr("value");
    		var profile = $(this).children(".profile").attr("value");
    		var album = $(this).children(".album").attr("value");
    		var duration = $(this).children(".duration").attr("value");
    		
    		var obj = {
    				"no":no,
    				"title":title,
    				"nickKo":nickKo,
    				"mp3Name":mp3Name,
    				"coverName":coverName,
    				"profile":profile,
    				"album":album,
    				"duration":duration
    		};
    		storage.push(obj);
    	});//.ajaxWrap.each() end
    	
    	localStorage.removeItem("songs");
    	
    	storage = JSON.stringify(storage);
    	
    	localStorage.setItem("songs",storage);
    	
    }//window.onbeforeunload() end
    
</script>
</body>
</html>