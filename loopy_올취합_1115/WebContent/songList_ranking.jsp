<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ranking</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="/css/songList_ranking.css"/>
<link rel="stylesheet" href="/css/art.css"/>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<% int type = 2; %>
<%@ include file="/WEB-INF/template/art_header.jsp" %>
<div class="songListWrap">
    <div class="rankingHeader">
        <ul class="rankingTap">
            <li>
                <select class="rankingFilter">
                    <option>추천수 순</option>
                    <option>전문가 평점 순</option>
                    <option>일반유저 평점 순</option>
                </select>
            </li>
            <li class="touch"><a href="" title="주간 랭킹">주간</a></li>
            <li><a href="" title="월간 랭킹">월간</a></li>
            <li><a href="" title="연간 랭킹">연간</a></li>
        </ul><!--ul end-->
        <div class="rankingMusicPlay">
            <a href=""><i class="fas fa-play-circle"></i>전체 듣기</a>
        </div>
    </div><!--div end-->

    <div class="rankingIndex">
        <ul>
            <li>플레이</li>
            <li>추천수</li>
            <li>전문가 평점</li>
            <li>일반인 평점</li>
            <li>업로드</li>
        </ul>
    </div>

    <div class="rankingContents">
        <div class="rankingWeekend dateTab touch">
            <ul class="weekRank">
                <script type="text/template" id="weeklyTmp">
                <li class="showed01">
                    <div class="rankingNo">1</div>
                    <div class="rankingSongCover"><a href=""><img src="img/high_hopes.jpg" width="60" height="60"></a></div>
                    <div class="rankingNickName"><a href="">Kodaline</a></div>
                    <div class="rankingSongName"><a href="">HighHopes</a></div>
                    <div class="rankingAlbumName"><a href="">In A Perfect World</a></div>
                    <div class="rankingPlayCount">510,000</div>
                    <div class="rankingLike">922</div>
                    <div class="rankingProfGrading">3.87</div>
                    <div class="rankingUserGrading">4.74</div>
                    <div class="rankingUploadDate">2017-10-15</div>
                    <div class="tag">#커버 #사랑 #후애</div>
                    <div class="rankingPutInPlayer"><a href="">플레이어에 담기</a></div>
                    <div class="rankingPutInCollection"><a href="">컬렉션에 담기</a></div>
                </li>
                </script>
            </ul>
        </div><!--div end-->

        <div class="rankingMonth dateTab">
            <ul class="monthRank">
                    <li>
                        <div class="rankingNo">1</div>
                        <div class="rankingSongCover"><a href=""><img src="img/high_hopes.jpg" width="60" height="60"></a></div>
                        <div class="rankingNickName"><a href="">Kodaline</a></div>
                        <div class="rankingSongName"><a href="">One Day</a></div>
                        <div class="rankingAlbumName"><a href="">In A Perfect World</a></div>
                        <div class="rankingPlayCount">12,510,000</div>
                        <div class="rankingLike">15,000</div>
                        <div class="rankingProfGrading">4.15</div>
                        <div class="rankingUserGrading">4.74</div>
                        <div class="rankingUploadDate">2017-11-17</div>
                        <div class="tag">#사랑 #후애</div>
                        <div class="rankingPutInPlayer"><a href="">플레이어에 담기</a></div>
                        <div class="rankingPutInCollection"><a href="">컬렉션에 담기</a></div>
                    </li>
            </ul>
        </div><!--div end-->

        <div class="rankingYear dateTab">
            <ul class="yearRank">
                    <li>
                        <div class="rankingNo">1</div>
                        <div class="rankingSongCover"><a href=""><img src="img/Inside_Llewyn_Davis.jpg" width="60" height="60"></a></div>
                        <div class="rankingNickName"><a href="">Oscar Isaac</a></div>
                        <div class="rankingSongName"><a href="">Fare Thee Well</a></div>
                        <div class="rankingAlbumName"><a href="">Inside_Llewyn_Davis OST</a></div>
                        <div class="rankingPlayCount">111,510,000</div>
                        <div class="rankingLike">98,312</div>
                        <div class="rankingProfGrading">4.5</div>
                        <div class="rankingUserGrading">4.77</div>
                        <div class="rankingUploadDate">2017-11-15</div>
                        <div class="tag">#OST #잔잔함</div>
                        <div class="rankingPutInPlayer"><a href="">플레이어에 담기</a></div>
                        <div class="rankingPutInCollection"><a href="">컬렉션에 담기</a></div>
                    </li>
            </ul>
        </div><!--div end-->

    </div><!--//div end-->

</div><!--div end-->

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>
    $(".rankingTap li").on("click",function (e) {
        e.preventDefault();
        var idx = $(this).index();
        $(".touch").removeClass("touch");
        $(".dateTab").eq(idx-1).addClass("touch");
        $(this).addClass("touch");
    }); //rankingTap li end

    var tmp = _.template($("#weeklyTmp").html());

    for(var i = 0; i<100; i++){
        $(".weekRank").append(tmp());
    }
</script>
</body>
</html>