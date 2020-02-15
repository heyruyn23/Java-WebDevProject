<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>자유게시판 | GiftGuideService</title>
    <link rel="stylesheet" href="/css/community.css">
    <link rel="stylesheet" href="/css/tui-editor-contents.min.css">
    <link rel="stylesheet" href="/css/tui-editor-contents.min.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/viewContent.css">
    <%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>
.like_btn >i {
	color: #fff;
}
	.like {
		color:#517be8;
		font-weight: bold;
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
    #viewerSection {
        width:880px;
        padding-left:20px;
        padding-top: 50px;
        min-height: 500px;
        margin: auto;
    }
    #categoryImg {
        margin: 20px auto;
        background-image: url("/img/com.jpg");
        background-size: cover;
        background-repeat: no-repeat;
        width: 200px;
        height: 100px;
    }
    #allIndexFooter {
        float: left;
    }
</style>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div id="communityBoardBanner">

</div>
<div id="communityBoardDetailWrap">
    <div class="detail_content">
        <p class="detail_title">
            <em></em>
            <span>${article.title }</span>
        </p>
        <span class="detail_id">${fn:substring(article.email,0,fn:indexOf(article.email,'@')) }</span>
        <div class="detail_info">
            <span class="span_margin"><i class="far fa-thumbs-up"></i> ${article.likesNum }</span>
            <span class="span_margin"><i class="fas fa-eye"></i> ${article.hit }</span>
            <span class="span_margin"><i class="far fa-clock"></i> ${article.regDate }</span>
            <button class="siren_btn" onclick="openPop()" type="button"><i style="color:#FF1744" class="far fa-angry"></i> 신고하기</button>
        </div>
        <div id="viewerSection">
		
        </div>
        <div class="like_and_count">
            <button class="like_btn like_wrap <c:if test="${likeFlag}">like</c:if>">
            <i class="far fa-thumbs-up <c:if test="${likeFlag}">like</c:if>" ></i> 추천하기</button>
            <span class="like_cnt like_wrap">${article.likesNum } 명</span>
        </div>
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
    <div id="communityBoardReply">
        <div id="marginDiv"></div>
        <a class="prev_btn" href="/freeBoard">이전으로</a>
        <div id="replyBox">
            <span>댓글 </span>
            <span style="color:#F6890A ;"> ${total }</span>
            <ul>
            <c:forEach items="${list }" var="comments">
                <li>
                    <span class="reply_id">${fn:substring(comments.email,0,fn:indexOf(comments.email,'@')) }</span>
                    <span class="reply_regDate">${comments.regDate }</span>
                    <button class="siren_btn" onclick="openPop()" type="button">신고하기</button>
                    <div class="reply_content">
                        ${comments.content }
                    </div>
                </li>
            </c:forEach>
            </ul>
            ${paginate }
            <div id="replyInput">
                <form action="/commentF" method="POST">
                <input type="hidden" name="postNum" value="${article.no }"/>	
				<input type="hidden" name="memberNo" value="${loginMember.no }"/>
                    <textarea id="replyInputBox" <c:if test="${loginMember==null }">placeholder="로그인 후 이용해 주세요"</c:if>
                    maxlength="200" name="content"></textarea>
                    <span id="replyRule">주제와 무관한 댓글과 욕설 또는 특정 대상을 비방하는 악플은 삭제될 수 있습니다. </span>
                    <c:if test="${loginMember!=null }">
                    <button id="replyInputBtn">등록하기</button>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/template/footer.jsp" %>

<script src="/js/jquery.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src='/js/markdown-it.js'></script>
<script src="/js/to-mark.min.js"></script>
<script src="/js/codemirror.js"></script>
<script src="/js/highlight.js"></script>
<script src="/js/squire-raw.js"></script>
<script src="/js/tui-editor-Editor.js"></script>
<script>
$(".like_btn").click(function() {
	
	<c:choose>
	<c:when test="${loginMember==null }">
		alert("로그인 해주세요!");
	</c:when>
	<c:otherwise>

		$.ajax({
			url:"/ajax/like",
			dataType:"json",
			type:"POST",
			data:{postNum:${no},type:"F", memberNo:${loginMember.no}},
			error:function() {
				alert("서버 점검중!");
			},
			success:function(json) {
				console.log(json);
				
				if(json.flag) {
					$(".like_btn").addClass("like");
					$(".like_btn i").addClass("like");
				}else {
					$(".like_btn").removeClass("like");
					$(".like_btn i").removeClass("like");
				}//if else end
				
				$(".like_cnt").text(json.count);
				
			}
		})
	</c:otherwise>
	</c:choose>
	});
	
$('#viewerSection').tuiEditor({
viewer: true,
    width : 900,
height: 600,
initialValue:`<img src="/img/freeRule.jpg">
${article.content }
`
});
var $window = $(window);
$window.scroll(function () {
    var sTop = $window.scrollTop();//스크롤높이
    console.log("top: "+sTop);
    if(sTop>0) {
//골드, 핑크골드
//$("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(183,110,121,0.6))");
//골드, 실버
//$("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(192,192,192,0.6))");
        $("#allIndexHeader").css("background","#f9f9f9");
//골드
//$("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(212,175,55,0.9))");
    }else {
        $("#allIndexHeader").css("background","transparent")
    }//if~else end
});//scroll() end
// header scroll end
function openPop(){

        //새 창을 가운데로 띄우기 위해 좌표계산.
        var left = Math.floor((screen.availWidth - 250) / 2);
        var top = Math.floor((screen.availHeight - 100) / 2);

        //창 옵션
        var winOpts = "width=600, height=500, left=" + left + ", top=" + top + ", scrollbars=no, resizable=yes";
        //창 오픈​
        window.open("/warn", "",winOpts);
    }
</script>
</body>
</html>