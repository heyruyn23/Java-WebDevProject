<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글작성 - 나도산타다 | Gift Guide Book</title>
    <link rel="stylesheet" href="/css/tui-editor.min.css">
    <link rel="stylesheet" href="/css/tui-editor-contents.min.css" />
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <style>
        #editSection {
            width:900px;
            position: relative;
            margin: auto;
            vertical-align: middle;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }

        #writeBoardBtnWrap {
            width: 320px;
            height: 100px;
            position: relative;
            margin: auto;
            text-align: center;
            line-height: 75px;
        }
        #writeBoardTitle {
            display: block;
            position: relative;
            margin: 30px auto 30px auto;
            width: 898px;
            height: 23px;
            border: 1px solid #eeeeee;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        .writeBoard_wrap_btn {
            text-decoration: none;
            color: #fff;
            width: 140px;
            height: 40px;
            font-family: "Nanum Gothic","sans-serif";
            font-size: 22px;
            margin: 5px;
            background-color: #455D9D;
            border-radius: 5px;
            outline: none;
            border: none;
            transition: .2s ease;
        }
        .writeBoard_wrap_btn:hover {
            cursor: pointer;
        }
        #communityBoardBanner {
            position: relative;
            width: 100%;
            height: 300px;
            background-image: url("/img/banner2.jpg");
            background-size: contain;
            background-repeat:no-repeat;
            background-position: center;
            background-color: #F3F2F0;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
    <div id="communityBoardBanner">
    </div>
<form id="writeForm" action="/viewArticleS" method="post">
     <input type="hidden" name="memberNo" value="${loginMember.no }">
    <input id="writeBoardTitle" type="text" name="title"/>
<div id="editSection"></div>
<input type="hidden" id="contents" name="content">
<div id="writeBoardBtnWrap">
<button id="getBtn" class="writeBoard_wrap_btn"><i class="fas fa-edit"></i> 작성하기</button>
<button id="prevCommunityBtn" class="writeBoard_wrap_btn" type="button"><i class="fas fa-reply"></i> 목록으로</button>
</div>
</form>
<%@ include file="/WEB-INF/template/footer.jsp" %>
<script src="/js/fix-footer.js"></script>
<script src="/js/jquery.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src='/js/markdown-it.js'></script>
<script src="/js/to-mark.min.js"></script>
<script src="/js/codemirror.js"></script>
<script src="/js/highlight.js"></script>
<script src="/js/squire-raw.js"></script>
<script src="/js/tui-editor-Editor.js"></script>
<script>
var editor = new tui.Editor({
	el: document.querySelector('#editSection'),
	initialEditType: 'wysiwyg',
	previewStyle: 'vertical',
	height: '600px',
	language:"ko_KR",
	toolbarItems: [
	'heading',
	'bold',
	'italic',
	'strike',
	'divider',
	'hr',
	'quote',
	'divider',
	'ul',
	'ol',
	'task',
	'divider',
	'table',
	'link',
	'divider'
	]
	});
    
$("#writeForm").submit(function(){
    
	//submit될때 에디터안의 내용을 얻어와서
	

	//에디터의 값을 얻어오고
	var value=editor.getValue();
	
	//console.log(value);
	
	//input type=hidden인 요소에 세팅
	$("#contents").val(value);
	
});//submit() end

    $("#prevCommunityBtn").click(function () {
       location.href="/giveBoard";
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