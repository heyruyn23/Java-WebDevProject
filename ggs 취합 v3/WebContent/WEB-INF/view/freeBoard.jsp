<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="f" uri="http://java.sun.com/jstl/fmt_rt" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/default.css" />
    <link rel="stylesheet" href="/css/community.css"/>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <title>자유게시판 | GiftGuideBook</title>
    <style>
        html{
            height: 100%;
        }
        body{
            height: 100%;
            background-color: #f9f9f9;
        }
        #communityBoardBanner {
            position: relative;
            width: 100%;
            height: 300px;
            background-image: url("/img/freeBoardBanner.jpg");
            background-repeat:no-repeat;
            background-position: center;
            background-color: #FF6060;
        }
        #categoryImg {
            margin: 20px auto;
            background-image: url("/img/com.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            width: 200px;
            height: 100px;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div id="communityBoardBanner">

</div>
<div id="communityBoardContent">
    <div id="communityBoardFilter">
        <div id="communityBoardFilterBtn">
            <button class="communityBoard_filter_btn" type="button" data-value="like"><i class="far fa-arrow-alt-circle-down"></i> 추천순</button>
            <button class="communityBoard_filter_btn fas" type="button" data-value="new"><i class="far fa-arrow-alt-circle-down"></i> 최신순</button>
        </div>
        <div id="communityBoardFilterDetail">
                <select name="choose" id="communityBoardFilterSelect">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                </select>
                <input id="communityBoardFilterSearchBar" type="text" name="searchResult">
                <button id="communityBoardSearchBtn" type="button"><i class="fas fa-search"></i></button>
        </div>
    </div>
    <div class="communityBoard_list_wrap">
        <ul>
    
        </ul>
        <c:choose>
	<c:when test="${loginMember==null }">
	<a id="writeCommunityBoardBtn" href="#" onclick="alert('로그인 후 이용해 주세요!')"><i class="fas fa-edit"></i>
            글 작성
        </a>
	</c:when>
	<c:otherwise>
	<a id="writeCommunityBoardBtn" href="/freeBoard/write"><i class="fas fa-edit"></i>
            글 작성
        </a>
	</c:otherwise>
	</c:choose>
	<div id="paging"></div>
       	<!-- ${paginate }-->
    </div>

    <div id="CommunityCategoryWrap">
        <div id="categoryImg"></div>
        <p id="CommunityCategory">커뮤니티
            <br/>(Community)</p>
        <ul>
            <li class="community_category_list"><a id="selectCategory" href="/freeBoard">
                <i class="far fa-comments" style="color: #ff6060"></i> 자유게시판
            </a></li>
            <li class="community_category_list"><a href="/giveBoard">
                <i class="far fa-handshake" style="color: #424242"></i> 나도 산타다
            </a></li>
        </ul>
    </div>
</div>
    <script type="text/template" id="freeBoardTmp">
        <@_.each(freeBoard, function(free) { @>
            <li class="communityBoard_contentList">
                <p class="communityBoard_contentList_title">
                    <a href="/viewArticle/<@=free.no@>/page/1 "><@=free.title@>
                        <em>(<@=free.commentsNum@>)</em></a>
                </p>
                <div class="communityBoard_contentList_info">
                    <dl class="communityBoard_contentList_dl communityBoard_contentList_info_dl">
                        <dd class="communityBoard_contentList_id"><@=(free.email).substr(0,(free.email).indexOf("@"))@></dd>
                        <dd><i class="fas fa-eye"></i></dd>
                        <dd><@=free.hit@></dd>
                    </dl>
                </div>
                <div class="communityBoard_contentList_heartAndDate">
                    <dl class="communityBoard_contentList_heartAndDate_dl">
                        <dt><i class="far fa-thumbs-up"></i></dt>
                        <dd><@=free.likesNum@></dd>
                    </dl>
                    <dl class="communityBoard_contentList_heartAndDate_dl">
                        <dt><i class="far fa-clock"></i></dt>
                        <dd class="communitiy_date" data-date="">
                        <@=moment(free.regDate).format("YYYY.MM.DD")@>
                        </dd>
                    </dl>
                </div>
            </li>
			<@})@>
        </script>


<%@ include file="/WEB-INF/template/footer.jsp" %>
<script src="/js/jquery.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
	
	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};
	var tmp = _.template($("#freeBoardTmp").html());
	
	
	function list(pageNo,order,select) {
		$.ajax({
			url:"/ajax/freeBoard/page/"+pageNo+"/"+order + "/" +select +"/" + wire,
			type : "GET",
			dataType : "json",
			error : function() {
				alert("점검중입니다.");
			},
			success:function(json) {
				$(".communityBoard_list_wrap>ul").html(tmp({freeBoard:json.content}));
				$("#paging").html(json.paginate);
			}
		});
	}
	list(1,"new",null);
	
	
	$("#paging").on("click","a",function(e){
		
		list($(this).attr("href").substr(($(this).attr("href").length)-1));
		
		e.preventDefault();
		
	});
	var order = "new";
	$(".communityBoard_filter_btn").click(function() {
		var order = this.dataset.value;
		list(1,order);
		if(order=="new") {
			$(".communityBoard_filter_btn").removeClass("fas");
			$(this).addClass("fas");
		}
		else if(order=="like") {
			$(".communityBoard_filter_btn").removeClass("fas");
			$(this).addClass("fas");
		}
	});
	
	var select = null;
	$("#communityBoardFilterSelect").change(function() {
		select = $(this).val();
	});
	var wire = null;
	$("#communityBoardSearchBtn").click(function() {
		select = $("#communityBoardFilterSelect").val();
		wire = $("#communityBoardFilterSearchBar").val();
		console.log("select : "+select + "/ wire : "+ wire);
		list(1,order,select,wire);
	});
	
	
    var $window = $(window);
    $window.scroll(function () {
        var sTop = $window.scrollTop();//스크롤높이
        console.log("top: "+sTop);
        if(sTop>0) {
// 골드, 핑크골드
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(183,110,121,0.6))");
// 골드, 실버
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(192,192,192,0.6))");
            $("#allIndexHeader").css("background","#f9f9f9");
// 골드
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(212,175,55,0.9))");
        }else {
            $("#allIndexHeader").css("background","transparent")
        }//if~else end
    });//scroll() end
    // header scroll end
</script>
</body>
</html>

