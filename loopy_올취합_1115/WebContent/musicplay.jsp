<%@page import="org.bjd.loopy.vo.Source"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.dao.SourcesDAO"%>
<%@page import="org.bjd.loopy.dao.BLKSourcesDAO"%>
<%@page import="org.bjd.loopy.dao.UserMGMTDAO"%>
<%@page import="org.bjd.loopy.vo.Song"%>
<%@page import="org.bjd.loopy.dao.SongsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="/css/musicplay.css" />
<%
	String no = request.getParameter("songNo");
	Song song = SongsDAO.selectSong(Integer.parseInt(no));
%>
<head>
    <meta charset="UTF-8">
    <title>musicplay</title>
    <style></style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
    <div id="musicPlayPage">
        <div class="musicPlayingForm">
            <div class="playBtn">
                <button><i class="far fa-play-circle"></i><span class="screen_out">재생</span></button>
            </div>
            <div><span class="artist"><a href="/mypage.jsp?userNo=<%=song.getUserNo()%>"><%=song.getNickKo() %></a></span></div>
            <div>
                <span id="songTitle"><%=song.getTitle() %></span> /
                <span><%=song.getGenre() %></span>
            </div>
            <div id="waveAPI">

            </div>
            <div id="songInfo">
                플레이수 <span id="totalNumOfPlay">15,200</span> /
                추천수 <span id="totalNumOfLike">324</span> /
                전문가 <i id="firststarEX" class="far fa-star"><i id="secondstarEX" class="fas fa-star"></i></i> X<span id="expertRatingAvg">4.00</span> /
                유저 <i id="firststarUR" class="far fa-star"><i id="secondstarUR" class="fas fa-star"></i></i> X<span id='userRatingAvg'>2.45</span>
                /
                <span id="uploadDate"><%=song.getRegdate() %></span>
            </div>
            <div id="coverPic"></div>
        </div><!--//#musicPlayingForm-->
        <div id="leftBar">
            <div id="artistProfile">
                <div id="profilePic"><img src="<%=song.getProfile()%>"/></div>
                <div id="profileInfo">
                    <a href="/mypage.jsp?userNo=<%=song.getUserNo()%>"> <%=song.getNickKo() %></a> <img id="rank" src="/img/topaz.png"/>
                    </br></br>
                    보유 작품 수 <span><%=SongsDAO.selectSongCnt(song.getUserNo()) %></span>
                    </br></br>
                    구독자 수 <span><%=UserMGMTDAO.selectFollowerCnt(song.getUserNo()) %></span>
                    </br>
                    </p>
                </div><!--//#profileInfo-->
            </div><!--//#artistProfile-->
            <div id="musicResourceInfo">
                <p>사용한 소리소스 <span><%=BLKSourcesDAO.selectSourceCnt(song.getNo()) %></span>개</p>
                <ul>
                <% List<Source> sourceList = SourcesDAO.selectSources(song.getNo());
                	if(sourceList.size()==0){ %>
                    <li class="soundSource">
                        사용한 소리소스가 없습니다.
                    </li>
                    <%}else{ %>
                    <%for(Source source: sourceList){ %>
	                    <li class="soundSource">
	                        <%=source.getMp3Name() %>
	                    </li>
                    <%}} %>
                </ul>
            </div><!--//#musicResourceInfo-->
        </div><!--//#leftBar-->
        <div id="centerBar">
            <div id="buttons">
                <button id="like" class="btn">추천</button> |
                <button id="rating" class="btn">
                    <div>

                        <div id="userRating">
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                        </div>
                        </div>
                </button>  |
                <button id="addToPlayerList" class="btn">플레이어추가</button> |
                <button id="addToCollection" class="btn">컬렉션담기</button> |
                <button id="copyLink" class="btn">퍼가기</button> |
                <button id="report" class="btn">신고</button>
                <div id="rateThisSong">
                    <div id="songDescription">
                        내가 아는 사랑의 환상과 고독 [<span id="genre">로맨스</span>]
                    </div>
                    <div>
                        <span class="tag">#로맨스</span>
                        <span class="tag">#사랑</span>
                        <span class="tag">#성장이야기</span>
                    </div>
                </div>
            </div>
            <div id="expertRating">
                <p>전문가 평점</p>
                <div>
                    <form>
                    <span>
                        <i class="fas fa-star star"></i>
                        <i class="fas fa-star star"></i>
                        <i class="fas fa-star star"></i>
                        <i class="fas fa-star star"></i>
                        <i class="fas fa-star star"></i>
                    </span>
                    <input placeholder="내용을 입력해주세요(300자)"/>
                    <button>입력</button>
                    </form>
                    <ol>

                        <li class="commentArea">
                            <div class="commentProfilePic"></div>
                            <div class="commenterName">장정일
                                <div class="commenterStar">
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class="far fa-star star"></i>
                                </div>
                            </div>
                            <div class="commentContents">김사월이 항상 옳은 것은 아니다. 하지만 무엇인가, 진실이라고 할만한 것이 그녀에겐 있다</div>
                            <div class="commentRegdate">2018.09.21</div>
                        </li>
                    </ol>

                </div>

            </div>
            <div id="comment">
                댓글
            </div>
        </div>

        <div id="rightBar">
            <div>
                추천음악
            </div>
        </div>
    </div>
<script src="/js/jquery.js"></script>
<script src="/js/wave.js"></script>
<script src="/js/wavesurfer.js"></script>
<script>
    $(".playBtn button").click(function () {
        if($(".playBtn button i").hasClass("far fa-play-circle")){
            $(".playBtn button i").attr("class","far fa-pause-circle");
        }else{
            $(".playBtn button i").attr("class","far fa-play-circle");
        }
    });

    $("#expertRating i").click(function () {
        $(this).parent().children().removeClass('before');
        $(this).addClass('before').prevAll().addClass('before');
        return false;
    });
    $("#userRating i").click(function () {
        $(this).parent().children().removeClass('before');
        $(this).addClass('before').prevAll().addClass('before');
    });
    /*
    $("#userRating i").click(function () {
        $(this).parent().children().removeClass('before');
        $(this).addClass('before').prevAll().addClass('before');

        setTimeout(function () {
            $("#userRating").children().css("display","none");
            $("#userRated").css("display","inline-block");
        },500)

        return false;
    });

    $("#userRated").click(function () {
        $("#userRated").css("display","none");
        $("#userRating").children().css("display","inline-block");
    });
    */
    
    useWave("#waveAPI","/audio/Im Yours.mp3",".playBtn");
    
</script>
</body>
</html>