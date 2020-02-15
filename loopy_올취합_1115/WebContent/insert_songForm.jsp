<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Loopy - 작품 업로드</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="/css/default.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <style>
        html {
            overflow-y: scroll;
        }
        body {
            font-family: 'Nanum Gothic', sans-serif;
        }
        #insertPopup {
            width: 1200px;
            height: 850px;
            margin: 20px auto;
            position: relative;
        }
        #playTest {
            width:1200px;
            height: 70px;
            position: relative;
        }
        #playTest .btn {
            background-size: contain;
            width: 40px;
            height: 40px;
            position: absolute;
            background-color: #121212;
            top: 5px;
            left: 5px;
        }
        .stopBtnWrap {
            left: 50px;
        }
        .volumeBtnWrap {
            right: 0;
        }
        #insertPopup .playBtn {
            background-image: url("img/play.png");
        }
        .stopBtn {
            background-image: url("img/stop.png");
        }
        .volumeBtn {
            background-image: url("img/volume.png");
        }
        #insertPopup .btnWrap {
            width: 50px;
            height: 50px;
            position: absolute;
            top: 10px;
        }
        .waveBox {
            width: 1100px;
            height: 70px;
            position: absolute;
            left: 100px;
        }
        .wave {
            width: 1000px;
            height: 50px;
            position: absolute;
            top: 10px;
            left: 30px;
            background-color: #fff;
        }
        #insertSongForm {
            width: 1100px;
            height: 700px;
            padding-top: 30px;
            position: absolute;
            right: 0;
        }
        #insertSongForm div {
            height: 50px;
            line-height: 50px;
        }
        #insertSongForm #setInfo {
            width: 1100px;
            height: 240px;
            line-height: 240px;
        }
        #insertSongForm button {
            padding: 12px 20px;
            border-radius: 5px;
            margin: 0 10px;
        }
        #insertSongForm select {
            height: 25px;
        }
        .btnBox {
            width: auto;
            position: absolute;
            right: -10px;
        }
        #insertSongForm .txt {
            height: 35px;
            border-radius: 5px;
            text-indent: 10px;
        }
        .insertTitle {
            width: 500px;
        }
        .insertTheme {
            width: 1096px;
        }
        #txtAboutSong {
            width: 1098px;
            height: 160px;
            padding: 20px;
            resize: none;
            border-radius: 20px;
            margin-top: 20px;
            box-shadow: 0 8px 17px 0 rgba(200, 200, 200, 0.2), 0 6px 20px 0 rgba(200, 200, 200, 0.19);
        }
        .length {
            position: absolute;
            right: 0px;
            bottom: -20px;
            width: 100px;
            height: 20px;
            z-index: 10;
        }
        .volBar {
            position: absolute;
            left:0;
            top:0;
            background-color: white;
            width: 50px;
            height: 100px;
            display: none;
        }
        .show .volBar {
            display: block;
        }
        .playTest {
            background-image: url("img/pause.png");
        }
        #coverAlert {
            color: #383838;
        }
    </style>
</head>
<body>
    <div id="insertPopup">
        <div id="playTest">
            <div class="playBtnWrap btnWrap">
                <button type="button" class="playBtn btn screen_out">재생</button>
            </div>
            <div class="stopBtnWrap btnWrap">
                <button type="button" class="stopBtn btn screen_out">정지</button>
            </div>
            <div class="waveBox">
                <div class="wave"></div>
                <div class="volumeBtnWrap btnWrap">
                    <button type="button" class="volumeBtn btn screen_out">볼륨</button>
                    <div class="volBar"></div>
                </div>
                <div class="length" data-duration="">0:00</div>
            </div>
        </div><!-- #playTest -->
        <div id="insertSongForm">
            <form id="insertSong" action="/insert_song.jsp" method="get">
                <fieldset>
                    <legend class="screen_out">곡 업로드 폼</legend>
                    <div id="setTitle" >
                        <input placeholder="곡 타이틀 입력" class="txt insertTitle" name="title" />
                        <input type="hidden" value="" name="duration"/>
                    </div>
                    <div id="setInfo">
                        <textarea name="info" id="txtAboutSong"
                                  placeholder="곡에 대한 정보를 입력해주세요."></textarea>
                    </div>
                    <div id="setGenre">
                        <select name="genre">
                            <option value="null">장르 선택</option>
                            <option>Alternative</option>
                            <option>Blues</option>
                            <option>Country</option>
                            <option>Dance</option>
                            <option>Electronic</option>
                            <option>Folk</option>
                            <option>Hip-Hop/Rap</option>
                            <option>Christian & Gospel</option>
                            <option>Jazz</option>
                            <option>Pop</option>
                            <option>R&B/Soul</option>
                            <option>Reggae</option>
                            <option>Rock</option>
                            <option>World</option>
                        </select>
                    </div>
                    <div id="setTheme">
                        <input class="txt insertTheme" name="themes"
                               placeholder="#테마입력 스페이스바로 구분됩니다." />
                    </div>
                    <div id="setCover">
                        <label for="coverImg">커버 이미지 업로드</label>
                        <input name="cover" type="file" id="coverImg" />
                        <span id="coverAlert">커버이미지 미지정 시 자신의 프로필 사진으로 커버로 적용됩니다.</span>
                    </div>
                    <div id="setPublication">
                        <label for="pubInfo">이 곡을</label>
                        <select name="pubVeri" id="pubInfo">
                            <option value="1" selected="selected">공개</option>
                            <option value="0">비공개</option>
                        </select>
                    </div>
                    <div id="setAlbum">
                        <select name="album">
                            <option value="default">앨범 선택</option>
                        </select>
                    </div>
                    <div class="lineDivider">
                        <label>
                            <input name="comVeri" type="checkbox" checked="checked"/>
                            댓글을 허용합니다.
                        </label>
                    </div>
                    <div class="lineDivider">
                        <label>
                            <input name="statVeri" type="checkbox" checked="checked" />
                            본 작품을 통계에 포함시킵니다.
                        </label>
                    </div>
                    <div class="lineDivider">
                        <label>
                            <input name="srcVeri" type="checkbox" checked="checked" />
                            본 작품을 만드는데 사용한 소리소스를 공개합니다.
                        </label>
                    </div>
                </fieldset>
            </form>
            <div class="btnBox">
                <button type="button" class="downloadBtn">다운로드</button>
                <button type="submit" class="uploadBtn">올리기</button>
                <button type="button" class="cancelBtn">취소</button>
            </div>
        </div><!-- #insertSongForm -->
    </div><!-- #insertPopup -->
<script src="js/jquery.js"></script>
<script>
    var $body = $("body");
    $(".volumeBtn").click(function () {
        $body.toggleClass("show");
    })//.volumeBtn.click() end

    $body.click(function (e) {
        if($body.hasClass("show")){
            //console.log($(".volumeBtn").get(0)==e.target);

            if($(".volumeBtn").get(0)!=e.target){
                 $body.removeClass("show");
             }
        }
    });//$body.click() end

    $(".downloadBtn").click(function () {
        alert("곡 다운로드")
    })

    $("#insertPopup .playBtn").click(function () {
        $(this).toggleClass("playTest");
    })//#insertPopup .playBtn.click() end
    $(".uploadBtn").click(function () {
        $("#insertSong").submit();
    })//.uploadBtn.click() end
    $(".cancelBtn").click(function () {
        alert("이전 페이지로 돌아가기")
    })

    $("#coverImg").change(function () {
        $("#coverAlert").hide();
        var file = this.files[0];
        if(!file.type.startsWith("image/")) {
            alert("이미지 외의 파일을 업로드할 수 없습니다.");
            $(this).val(defaultStatus);
        }//if end
    });//#coverImg.change() end
</script>
</body>
</html>