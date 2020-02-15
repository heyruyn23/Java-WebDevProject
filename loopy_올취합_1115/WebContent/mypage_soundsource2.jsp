<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>soundsource</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/mypage.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    
    <style>
        body{
            background-color: #121212;
            font-size: 15px;
        }
        html{
            user-select: none; /* to remove selected blue area css */
        }
        .size{
            width: 100px;
            height: 100px;
            display: inline-block;
            background-color: transparent;
            border: 1px solid #fff;
            border-radius: 10px;
            margin: 15px 10px;
            vertical-align: middle;
            color: #fff;
            text-align: center;
        }
        #addFolder{
            font-size: 30px;
            line-height: 100px;
        }
        #addSoundSource{
            font-size: 30px;
            line-height: 100px;
        }
        .box{
            width: 860px;
            min-height: 400px;
            background-color: #121212;
            padding: 20px;
            margin:15px auto;
        }
        body>div>span{
            font-size: 30px;
            font-weight: 900;
        }
        body>div:nth-child(2){
            clear: both;
        }
        .folderPopup{
            margin-top: 20px;
            width: 860px;
            min-height: 200px;
            background-color: purple;
            display: none;
            padding: 20px;
        }
        .folder{
            background-image: url("img/musicFolder.png");
            background-size: cover;
            position: relative;
        }
        .soundSource{
            background-image: url("img/soundSource.png");
            background-size: cover;
            border-radius: 50px;
            position: relative;
        }
        .soundSource>p{
            text-align:center;
            transform: translateY(110px);
        }
        .folder>p{
            text-align: center;
            transform: translateY(110px);
        }
        .folderPopup>div{
            font-weight: 900;
            font-size: 20px;
            color: #fff;
        }
        .folderPopup ul {
            min-height: 200px;
        }
        #sourceList{
            min-height: 200px;
        }
        .exit{
            width: 12px;
            height: 12px;
            display: block;
            position:absolute;
            top:0;
            right: 0px;
            z-index: 1;
            cursor: pointer;
            border-radius: 6px;
            background-size: cover;
            background-image: url("img/exit.png");
            background-repeat: no-repeat;
            background-position: center;
        }
        .name{
            width: 100px;
            min-height:0px;
        }
        .name:hover{
            box-shadow: 3px 3px 5px #424242;
            border-radius: 20px;
        }
        .editName{
            width: 100px;
            border-radius: 20px;
            border: none;
            transform: translateY(110px);
            outline:none;
        }
        #fontsize{
            color: #fff;
            font-weight: bold;
            font-size: 15px;
            display: inline-block;
            margin-bottom: 20px;
        }
        #fontsize>span{
            color: #311b92;
            text-shadow: 0px 0px 3px #fff;
            font-size: 18px;
        }
        .box>span>a{
            text-decoration: none;
            color: #fff;
            display: inline-block;
            min-width: 0px;
            padding: 5px 10px;
            border-bottom: 1px solid transparent;

        }
        .box>span{
            display: inline-block;
        }
        .on2{
            text-shadow: 0px 0px 5px #fff;
            border-bottom: 1px dotted #fff;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<% int type=6; %>
<%@ include file="/WEB-INF/template/mypage_header.jsp" %>
<div class="box">
    <span><a href="mypage_soundsource1.jsp?userNo=<%=userNo %>">내가 만든 소리 소스</a></span>
    <span class="on2"><a href="mypage_soundsource2.jsp?userNo=<%=userNo %>">퍼온 소리 소스</a> </span>
    <div id="fontsize">(총 <span id="numOfSoundsource">10</span>개)</div>
        <ul id="sourceList">
            <li data-value="add" id="addFolder" class="size"><i class="fas fa-folder-plus"></i></li><!--
            --><li data-value="folder" class="ui-state-default size folder droppable"><input class="editName" type="hidden"/><p class="name">폴더1</p></li><!--
            --><li data-value="soundSource" class="ui-state-default size soundSource"><input class="editName" type="hidden"/><p class="name">Item 1</p></li><!--
            --><li data-value="soundSource" class="ui-state-default size soundSource"><input class="editName" type="hidden"/><p class="name">Item 2</p></li><!--
            --><li data-value="soundSource" class="ui-state-default size soundSource"><input class="editName" type="hidden"/><p class="name">Item 3</p></li><!--
            --><li data-value="soundSource" class="ui-state-default size soundSource"><input class="editName" type="hidden"/><p class="name">Item 4</p></li><!--
            --><li data-value="add" id="addSoundSource" class="size"><i class="fas fa-plus-circle"></i></li><!--
        --></ul><!--//#sourceList-->

    <div class="folderPopup">
        <div>folder name</div>
        <ul class="droppable">
            <li data-value="soundSource" class="ui-state-default size soundSource"><p class="name">Item 1</p></li><!--
            --><li data-value="soundSource" class="ui-state-default size soundSource"><p class="name">Item 2</p></li>
        </ul><!--//.droppable-->
    </div><!--//.folderPopup-->

</div><!--//.box-->
<%@ include file="/WEB-INF/template/mypage_footer.jsp" %>

<script>
var backgroundImage = "<%=user.getCoverArt()%>";
</script>
<script src="/js/mypage.js"></script>
<script>
// ul #sourceList에 소트 기능과 드랍기능을 추가
$( "#sourceList" ).sortable().droppable({
    accept:'li[data-value="soundSource"]',
    drop: function( event, ui ) {
        $("#sourceList").append(ui.draggable.css({left:0,top:0}));
        console.log(ui.draggable);
    }
});

$(".folderPopup ul").sortable();
$(".soundSource").draggable();


$("#addSoundSource").click(function () {
    createSoundSource();
});

$("#addFolder").click(function () {
    createFolder();
});

// data-id 에 폴더 아이디 정보 넣기
function createSoundSource(){ //사운드소스 생성하기
    $("<li class='ui-state-default size soundSource draggable' " +
        "data-value='soundSource'>" +
        "<div class='exit'></div>" +
        " <input class=\"editName\" type=\"hidden\"/>" +
        "<p class=\"name\">소리소스</p> " +
        "</li>").draggable().appendTo($('#sourceList'));
}

function createFolder(){ // 폴더 생성하기
    $("<li class='ui-state-default size folder droppable' " +
        "data-value='folder'> " +
        "<input class=\"editName\" type=\"hidden\"/>" +
        "<p class=\"name\">폴더2</p> " +
        "<div class='exit'></div>" +
        "</li>").appendTo($('#sourceList'));
}

// 폴더가 추가만 되면 이동이 안되는 에러가 떴는데 그 이유는 appendTo에
// #sourceList에 droppable을 또 기능을 붙였어서, 기능이 이중중복되어서 안되었던 것이다.


// append를 하면 clone이 아닌 이상 복사가 안되고 이동이 되어야하는데
// 이동되어서 추가도 안됨
// droppable 클래스에 droppable 함수를 다 적용해주기
$( ".droppable" ).droppable({
    accept:'li[data-value="soundSource"]',
    drop: function( event, ui ) {
        $(".folderPopup ul").append(ui.draggable.css({left:0,top:0}));
      // ui.draggable.remove();
        console.log(ui.draggable);
    }
});

var ps=-1;
// 질문 구글 이미지 처럼 한번클릭하면 바뀌고, 두번 클릭하면 들어가도록
$("#sourceList").on("click",".folder",function () {
   var idx=$(this).index();
   console.log("idx: "+idx);
   if(idx == ps){
       $(".folderPopup").slideUp();
       $(".folderPopup>div").text($(this).text());
       ps = -1;
   }
   else{
       ps = idx;
       console.log("ps: "+ps);
       $(".folderPopup>div").text($(this).text());
        $(".folderPopup").slideDown();
   }
   //  $(".clicked").removeClass("clicked");
   //  $(".folderPopup").slideDown();
   //  $(this).addClass("clicked");
   //
   // // 클릭 된 것에 class 주고 hasclass 로 판별해서 click slideup();
   // $(this).click(function () {
   //     if($(this).hasClass("clicked")){
   //         $(".folderPopup").slideUp();
   //     }
   // });
});

// 폴더 및 사운드소스 삭제 버튼 추가
$("<div class='exit'></div>").appendTo($(".soundSource"));
$("<div class='exit'></div>").appendTo($(".folder"));

// 폴더 및 사운드소스 삭제 기능
$("body>div").on("click",".exit",function () {
    $(this).parent().remove();
    if($(this).attr("data-value")=="folder") {
        $(".folderPopup").css("display", "none");
    }
});

// 진짜 높이 받기 editname을 팝업으로 줬었을 때 지금은 이 팝업을삭제해서 더이상 필요 X
// $("body>div").on("click",".name",function () {
//     var et=$(this).offset().top;
//     var el=$(this).offset().left;
//     console.log("높이:"+et+" 너비:"+el);
//     $(".nameEditPopup").css({top:et,left:el+10}).show();
//     $(".folderPopup").css("display","none");
// });

// 이름 수정 기능
$("body>div").on("click",".name",function () {
    $(".editName").attr("type","hidden");
    $(this).prev().attr("type","text").focus();

    // 오토 포스커 되도록 질문 -> 오토포커스는 처음에 페이지가 떴을 바로 포커스가 되는것 계속 주려면 .focus()를 사용한다.
   //$(this).prev().attr({"type":"text","autofocus":"autofocus"});

    // 한 행동이 없으면 display none을 주지 말기
    $(this).css("display","none");
    
    if($(this).attr("data-value")=="folder"){
        $(".folderPopup").css("display","none");
    }
    $(this).prev().val($(this).text());
});


// input 포커스가 맞춰지지 않는다면 기능이 해제되는 event listener "blur"
$("body>div").on("blur",".editName",function (e) {
    var value= $(this).val();
    if(value.trim()==""){
        alert("폴더명을 입력해주세요");
    }else{
        $(this).attr("type","hidden");
       // console.log(idx+" "+value);
        $(this).next().text(value);
        $(this).next().show();
    }
}); // editname keyup end


//엔터를 누르면 이름 수정 완료
$("body>div").on("keyup",".editName",function (e) {
    var value= $(this).val();
    var idx=$(this).parent().index();
    if(e.keyCode==13){
        if(value.trim()==""){
            alert("폴더명을 입력해주세요");
        }else{
            $(this).attr("type","hidden");
            console.log(idx+" "+value);
            $(this).next().text(value);
            $(this).next().show();
        }
    } // if end
}); // editname keyup end


</script>

</body>
</html>