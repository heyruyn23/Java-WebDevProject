<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="tab">
	
    <a href="/art_page_artist.jsp" ><div<%if(type==1) { %> class="tab tabSong on"<% }%> class="tab tabSong">구독한 아티스트의 곡</div></a><!--tabSong end-->
    <a href="/songList_ranking.jsp"><div<%if(type==2) { %> class="tab tabRank on"<% }%> class="tab tabRank">랭킹</div></a><!--tabRank end-->
    <a href=""><div<%if(type==3) { %> class="tab tabTotalPost on"<% }%> class="tab tabTotalPost">전체글보기</div></a><!--tabTotalPost end-->
    <a href="/art_page_album.jsp"><div<%if(type==4) { %> class="tab tabAlbum on"<% }%> class="tab tabAlbum">앨범 목록</div></a><!--tabAlbum end-->
    <a href="/art_page_collection.jsp"><div<%if(type==5) { %> class="tab tabCollection on"<% }%> class="tab tabCollection">컬렉션 목록</div></a><!--tabCollection end-->
    <a href="/art_page_source.jsp"><div<%if(type==6) { %> class="tab tabSorce on"<% }%> class="tab tabSorce">소리소스 목록</div></a><!--tabSorce end-->
</div><!--tab end-->
<div id="workSearchBox">
        <div class="searchBox">
            <input type="text" value="" name="" class="search" placeholder="검색"/><a class="searchBtn" href=""><i class="fas fa-search"></i></a>
        </div><!--searchBox end-->
        <div class="selectBox">
            <select class="select" title="">
                <option >아티스트 순 </option>
                <option >업로드 순 </option>
            </select><!--select end-->
        </div><!--selectBox-->
        <div class="filter">
            <label class="label"><input type="radio" name="order">오름차순</label>
            <label class="label"><input type="radio" name="order" checked>내림차순</label>
        </div><!--filter up-->
</div><!-- workSearchBox end-->