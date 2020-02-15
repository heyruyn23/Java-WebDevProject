<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--앨범 템플릿을 만듦-->
    <script type="text/template" id="albumTmp">
        <li class="album">
            <div class="play">
                <i class="fas fa-play-circle"></i>
            </div>
            <div class="albumImg"></div>
            <div class="albumIcon">
                <div class="totalNumOfSongs"><span id="numOfSongs">20</span></div>
                <div><i class="fas fa-list-ul"></i></div>
                <div class="albumPlayTime"><span id="playingTime">02:47:35</span></div>
                <div class="bookmark"><i class="far fa-star"></i></div>
            </div>
            <div class="albumInfo">
                <div class="albumTitle"><span id="coverImg">커버 프로젝트</span></div>
                <div class="albumArtist"><span id="artist">피스타치오</span></div>
                <div class="albumTags"><span id="tag">#태그</span></div>
                <div class="albumNotes"><i class="fas fa-music"></i>X<span id="totalPlayedTime">10</span></div>
            </div>
        </li>
    </script>