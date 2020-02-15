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
        /*.nameEditPopup{*/
            /*position:absolute;*/
            /*top:173px;*/
            /*left: 165px;*/
            /*display: none;*/
        /*}*/
        /*.nameEditPopup>input{*/
            /*width: 80px;*/
        /*}*/
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
    <span class="on2"><a href="mypage_soundsource1.jsp?userNo=<%=userNo %>>">내가 만든 소리 소스</a></span>
    <span><a href="mypage_soundsource2.jsp?userNo=<%=userNo %>">퍼온 소리 소스</a> </span>
    <div id="fontsize">(총 <span id="numOfSoundsource">20</span>개)</div>
        <ul id="sourceList">
            <li data-value="add" id="addFolder" class="size"><i class="fas fa-folder-plus"></i></li><!--
            --><li data-value="folder" class="ui-state-default size folder droppable"><input class="editName" type="hidden"/><p class="name">기본폴더</p></li><!--
            --><li data-value="soundSource" class="ui-state-default size soundSource"><input class="editName" type="hidden"/><p class="name">기본소스 1</p></li><!--
            --><li data-value="soundSource" class="ui-state-default size soundSource"><input class="editName" type="hidden"/><p class="name">기본소스 2</p></li><!--
            --><li data-value="soundSource" class="ui-state-default size soundSource"><input class="editName" type="hidden"/><p class="name">기본소스 3</p></li><!--
            --><li data-value="soundSource" class="ui-state-default size soundSource"><input class="editName" type="hidden"/><p class="name">기본소스 4</p></li><!--
            --><li data-value="add" id="addSoundSource" class="size"><i class="fas fa-plus-circle"></i></li><!--
        --></ul><!--//#sourceList-->

    <div class="folderPopup">
        <div>folder name</div>
        <ul class="droppable">
            </ul><!--//.droppable-->
    </div><!--//.folderPopup-->

</div><!--//.box-->
<%@ include file="/WEB-INF/template/mypage_footer.jsp" %>
<script src="/js/soundsource.js"></script>

<script>
var backgroundImage = "<%=user.getCoverArt()%>";
</script>
<script src="/js/mypage.js"></script>
<script>
    
</script>

</body>
</html>