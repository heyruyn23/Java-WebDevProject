<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--컬렉션 템플릿을 만듦-->
    <script type="text/template" id="collectionTmp">
        <li class="collection">
            <div class="play">
                <i class="fas fa-play-circle"></i>
            </div>
            <div class="collectionImg"></div>
            <div class="collectionIcon">
                <div class="totalNumOfSongs"><span id="numOfSongs">20</span></div>
                <div><i class="fas fa-list-ul"></i></div>
                <div class="collectionPlayTime"><span id="playingTime">02:47:35</span></div>
                <div class="bookmark"><i class="far fa-star"></i></div>
            </div>
            <div class="collectionInfo">
                <div class="collectionTitle"><span id="coverImg">커버 프로젝트</span></div>
                <div class="collectionArtist"><span id="artist">피스타치오</span></div>
                <div class="collectionTags"><span id="tag">#태그</span></div>
                <div class="collectionNotes"><i class="fas fa-music"></i>X<span id="totalPlayedTime">10</span></div>
            </div>
        </li>
    </script>