<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Loopy - Let's loop!</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/default.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    <style>
        html {
            overflow-y: scroll;
        }
        body {
            font-family: 'Nanum Gothic', sans-serif;
        }
        #content {
            width: 1200px;
            height: 900px;
            margin: auto;
            position: relative;
        }
        #content #edge {
            width: 1200px;
            height: 900px;
            border-radius: 30px;
            background-image: radial-gradient(farthest-corner at 10% 10%, #383838, #383838, #ddd, #ddd, #585858, #383838, #ddd, #383838, #383838, #ddd, #383838);
        }
        #loopStation {
            width: 1170px;
            height: 870px;
            margin: 15px;
            border-radius: 20px;
            background-color: #121212;
            background-image: url("/img/glare.png");
            background-size: contain;
            position: absolute;
        }
        #loopHeader {
            height: 230px;
            position: relative;
        }
        .btn {
            width: 100px;
            height: 100px;
            position: absolute;
            text-align: center;
            background-size: contain;
            border-radius: 50px;
            background-color: #585858;
            cursor: pointer;
        }
        #recBtn, #stopBtn {
            top: 65px;
            transition: .2s ease;
        }
        #recBtn {
            left: 50px;
            background-image: url("/img/rec_btn.png");
        }
        #loopHeader .recording {
            animation: recording 1s ease infinite;
            background-image: url("/img/save_btn.png");
        }
        @keyframes recording {
            0% {
                background-color: #585858;
                box-shadow: none;
            }
            50% {
                background-color: red;
                box-shadow: 0 0 1px #fff, 0 0 5px red, 0 0 15px red, 0 0 25px red;
            }
            100% {
                background-color: #585858;
                box-shadow: none;
            }
        }
        #stopBtn {
            left: 160px;
            background-image: url("/img/stop_btn.png");
        }
        .active {
            background-color: #B6FF00;
            animation: breathing 1.5s alternate infinite;
        }
        @keyframes breathing {
            from {
                box-shadow: 0 0 1px #fff, 0 0 5px #B6FF00;
            }
            to {
                box-shadow: 0 0 1px #fff, 0 0 5px #B6FF00, 0 0 15px #B6FF00, 0 0 25px #B6FF00;
            }
        }
        #uploadBtn {
            left: 290px;
            background-image: url("/img/mp3_btn.png");
            width: 60px;
            height: 60px;
            top: 85px;
        }
        #beatBox {
            position: absolute;
            top: 50px;
            left: 390px;
            width: 190px;
            height: 120px;
        }
        .txtBox {
            text-align: center;
            font-weight: bold;
            height: 25px;
        }
        .beatCon {
            position: absolute;
            width: 40px;
            height: 40px;
            line-height: 40px;
            color: #121212;
            top: 35px;
        }
        .nextBtn {
            right: 0;
        }
        #showBeat {
            width: 100px;
            height: 60px;
            background-color: #000;
            position: absolute;
            left: 45px;
        }
        #beatWindow {
            width: 55px;
            height: 50px;
            margin: 5px auto;
            background-image: url("/img/digitals.png");
            background-repeat: no-repeat;
            background-position: 0 0;
            background-size: cover;
        }
        .conWrap {
            width: 190px;
            height: 30px;
            position: absolute;
            bottom: 0;
        }
        .conWrap button {
            width: 90px;
            height: 30px;
            border-radius: 20px;
            cursor: pointer;
            outline: none;
            background-color: #585858;
            color: #121212;
        }
        .conWrap .stopBtn {
            margin-left: 10px;
        }
        #looperArea {
            height: 300px;
            position: relative;
        }
        #loopFooter {
            height: 340px;
        }
        .looper {
            width: 300px;
            height: 300px;
            position: absolute;
        }
        .looper .micPanel {
            top: 0;
            right: -12px;
        }
        #looper1 {
            left: 105px;
        }
        #looper2 {
            left: 435px;
        }
        #looperArea canvas {
            position: absolute;
            top: 22.5px;
            left: 22.5px;
            transform: rotateZ(135deg);
        }
        #looper3 {
            left: 765px;
        }
        .looperHead {
            text-align: center;
            font-size: 15px;
            font-weight: bold;
            width: 50px;
            height: 15px;
            line-height: 15px;
            margin: auto;
            color: #fff;
        }
        .looperBack {
            width: 250px;
            height: 250px;
            margin: 17.5px 25px;
            background-image: url("/img/looper.png");
            background-size: contain;
            position: absolute;
        }
        .looperBack div {
            position: absolute;
        }
        #loopStation .btnWrap {
            width: 100px;
            height: 100px;
            border-radius: 100px;
            margin: 75px;
            background-color: #585858;
        }
        .loopBtn {
            width: 90px;
            height: 90px;
            border-radius: 90px;
            margin: 5px;
            background-color: #121212;
            cursor: pointer;
        }
        .prog {
            display: none;
        }
        .progressing {
            display: block;
        }
        .recImg {
            width: 50px;
            height: 50px;
            background-color: #585858;
            border-radius: 50px;
        }
        .dif {
            margin: 20px;
        }
        .playing {
            width: 50px;
            height: 50px;
            border-radius: 50px;
            text-align: center;
            color: #585858;
            font-size: 50px;
            line-height: 50px;
            margin: 20px 20px 20px 25px;
            animation: neonPlay1 1s ease infinite alternate;
        }
        #looper2 .btnWrap {
            animation: neonPlay2 1s alternate infinite;
        }
        @keyframes neonPlay1 {
            from {
                text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 20px #B6FF00, 0 0 35px #B6FF00;
                color: #585858;
            }
            to {
                text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 40px #B6FF00, 0 0 70px #B6FF00, 0 0 80px #B6FF00, 0 0 100px #B6FF00, 0 0 150px #B6FF00;
                color: #B6FF00;
            }
        }
        @keyframes neonPlay2 {
            from {
                background-color: #585858;
            }
            to {
                background-color: #B6FF00;
            }
        }
        #looperArea .recording {
            animation: neonRec1 1s ease infinite alternate;
            width: 50px;
            height: 50px;
            border-radius: 50px;
            margin: 20px;
        }
        #looper3 .recImg {
            animation: neonRec2 1s alternate infinite;
        }
        #looper3 .btnWrap {
            animation: neonRec3 1s ease infinite alternate;
        }
        @keyframes neonRec1 {
            from {
                box-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 20px red, 0 0 35px red;
            }
            to {
                box-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 40px red, 0 0 70px red, 0 0 80px red, 0 0 100px red, 0 0 150px red;
            }
        }
        @keyframes neonRec2 {
            from {
                background-color: #585858;
            }
            to {
                background-color: red;
            }
        }
        @keyframes neonRec3 {
            from {
                background-color: #585858;
            }
            to {
                background-color: red;
            }
        }
        #soundSourceArea {
            height: 70px;
            position: relative;
        }
        #soundSourceArea .btn {
            width: 70px;
            height: 70px;
        }
        #soundGridArea {
            height: 240px;
        }
        #looperGridArea {
            height: 200px;
            position: relative;
        }
        #recentSources {
            width: 240px;
            height: 85px;
            background-color: #000;
            position: absolute;
            right: 180px;
            top: -10px;
            box-shadow: inset 0 0 1px #585858, inset 0 0 5px #585858;
            border-radius: 5px;
        }
        .recentSource1, .recentSource2, .recentSource3 {
            width: 70px;
            height: 70px;
            position: absolute;
        }
        .recentSource1 {
            left: 5px;
        }
        .recentSource2 {
            left: 85px;
        }
        .recentSource3 {
            right: 5px;
        }
        #showSourcesBtn {
            position: absolute;
            right: 20px;
            background-image: url("/img/source_list.png");
            background-size: contain;
            border-radius: 100px;
            background-color: #fff;
        }
        #sourceRecBtn {
            position: absolute;
            right: 100px;
            background-image: url("/img/rec_source.png");
            background-size: contain;
            border-radius: 50px;
            background-color: red;
        }
        #soundGridArea .sourceGridWrap {
            width: 1200px;
            height: 65px;
            position: relative;
        }
        .sourceGridWrap .gridTxt {
            width: 100px;
            height: 60px;
            line-height: 60px;
            font-size: 20px;
            position: absolute;
            left: 50px;
            top: 5px;
        }
        #sourceGrid {
            width: 1000px;
            height: 60px;
            top: 5px;
            right: 50px;
            position: absolute;
            background-color: #000;
        }
        .gridWrap {
            width: 1200px;
            height: 60px;
            font-size: 20px;
            line-height: 60px;
            position: relative;
        }
        .gridWrap .looperGrid {
            position: absolute;
            width: 1000px;
            right: 50px;
            height: 50px;
            top: 5px;
            background-color: #000;
        }
        .gridWrap .gridTxt {
            width: 80px;
            height: 60px;
            position: absolute;
            left:50px;
            top:0;
            text-align: right;
        }
        #looperGridArea .playBtn {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -100px;
            margin-left: -50px;
            background-color: transparent;
            color: #311B92;
            font-size: 100px;
            opacity: .4;
            transition: .2s ease;
        }
        #looperGridArea .playBtn:hover {
            opacity: .7;
            text-shadow: 0 0 1px #fff, 0 0 5px #fff, 0 0 10px #311b92,
                         0 0 20px #311b92, 0 0 50px #311b92, 0 0 80px #311b92, 0 0 150px #311B92;
        }
        #volumeControllers {
            width: 517px;
            height: 200px;
            position: absolute;
            left: 620px;
            top: 15px;
        }
        #tempoPanel, #volPanel {
            width: 200px;
            height: 200px;
            position: absolute;
            border-radius: 100px;
            background-image: url("/img/volume_panel.png");
            background-size: contain;
            box-shadow: 0 0 1px #585858, 0 0 5px #585858, 0 0 10px #383838, 0 0 15px #383838, 0 0 20px #121212, 0 0 30px #121212;
        }
        #volPanel {
            position: absolute;
            left: 220px;
            top: 0;
        }
        .bigControl {
            margin: 35px;
            position: absolute;
            width: 128px;
            height: 128px;
            background-image: url("/img/volume_ctrl.png");
            background-size: contain;
            border-radius: 70px;
            border: 1px solid #fff;
        }
        .barWrap {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -1.5px;
            width: 3px;
            height: 92px;
            transform-origin: 50% 0;
        }
        .micControl .barWrap {
            width: 1px;
            height: 35px;
            margin-left: -0.5px;
        }
        .bar {
            width: 3px;
            height: 20px;
            border-radius: 3px;
            background-color: #228DFF;
            position: absolute;
            bottom: 0;
            box-shadow: 0 0 1px #fff, 0 0 3px #fff, 0 0 10px #228DFF, 0 0 20px #228DFF;
        }
        .micControl .bar {
            width: 1px;
            height: 7px;
        }
        .micPanel {
            width: 77px;
            height: 77px;
            border-radius: 77px;
            position: absolute;
            bottom: 0;
            right: 0;
            background-image: url("/img/volume_panel.png");
            background-size: contain;
        }
        .micControl {
            width: 48px;
            height: 48px;
            border: 1px solid #fff;
            border-radius: 25px;
            position: absolute;
            margin: 13.5px;
            background-image: url("/img/volume_ctrl.png");
            background-size: contain;
        }
        .loopStop, .loopReset {
            width: 70px;
            height: 70px;
            position: absolute;
            border-radius: 70px;
            background-image: radial-gradient(farthest-corner at 90% 20%, #121212, #121212, #242424, #242424, #242424, silver, #585858);
            box-shadow: inset 0 0 1px #585858, inset 0 0 3px #000, inset 0 0 5px #000;
        }
        .loopStop {
            right: -50px;
            top: 120px;
        }
        .loopReset {
            right: -30px;
            top: 200px;
        }
        .looper .btnAux {
            width: 50px;
            height: 50px;
            background-color: #121212;
            border-radius: 25px;
            position: absolute;
            margin: 10px;
        }
        .looper .btnAux>button {
            width: 50px;
            height: 50px;
            border-radius: 25px;
            outline: none;
            background-color: #121212;
            font-size: 20px;
            color: #585858;
            cursor: pointer;
        }
        .looper .btnAux .resetBtn {
            font-size: 16px;
            font-weight: bold;
        }
        #volumeControllers .guideTxt {
            position: absolute;
            width: 50px;
            height: 20px;
            line-height: 20px;
            left: 75px;
            bottom: 8px;
            background-color: #121212;
            text-align: center;
            box-shadow: inset 0 0 1px #585858, inset 0 0 3px #383838, inset 0 0 5px #383838;
            font-size: 12px;
            font-weight: bold;
        }
        #volumeControllers .micPanel .guideTxt {
            left: 13.5px;
            top: -20px;
        }
/* soundSources popup */
        #popup {
            width: 800px;
            height: 580px;
            border-radius: 30px;
            background-color: #fff;
            color: #000;
            position: absolute;
            z-index: 100;
            right: 10px;
            top: 20px;
            display: none;
        }
        #closeBtn {
            font-size: 40px;
            text-align: right;
            height: 60px;
            line-height: 60px;
            width: 785px;
            padding-right: 15px;
        }
        #closeBtn a {
            color: #424242;
        }
        .sourceArea {
            width: 770px;
            height: 85px;
            background-color: #aaa;
            margin: auto;
        }
        .source {
            width: 60px;
            height: 75px;
            padding: 5px;
        }
        .searchedSources .source {
            height: 90px;
        }
        .searchedSources .sourceArea {
            height: 100px;
            background-color: #777;
        }
        .paginationArea {
            height: 30px;
        }
        .info {
            width: 60px;
            height: 15px;
            background-color: #fff;
        }
        .sourceName {
            font-size: 13px;
            line-height: 15px;
            font-weight: bold;
        }
        .usedTime {
            font-size: 12px;
            line-height: 15px;
        }
        .sourceIcon {
            width: 60px;
            height: 60px;
            background-color: red;
        }
        .searchWrap {
            text-align: right;
            width: 785px;
            padding-right: 15px;
            height: 30px;
            line-height: 30px;
        }
        .paginator {
            width: 400px;
            height: 30px;
            margin: auto;
            background-color: blue;
        }
/* insertPopup */
		#insertPopup {
            width: 1200px;
            height: 850px;
            background-color: #121212;
            border: 10px solid #fff;
            position: fixed;
            top: 50%;
            left: 50%;
            margin: -435px 0 0 -610px;
            box-shadow: 0 0 5px #fff, 0 0 25px #fff, 0 0 70px #fff, 0 0 150px #fff;
            display: none;
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
            right: 10px;
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
            width: 1036px;
        }
        #txtAboutSong {
            width: 998px;
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
    <div id="content">
        <div id="edge">
            <div id="loopStation">
                <div id="loopHeader">
                    <div id="recBtn" class="btn"></div>
                    <div id="stopBtn" class="btn"></div>
                    <div id="uploadBtn" class="btn"></div>
                    <div id="beatBox">
                        <div class="txtBox">비트</div>
                        <div class="prevBtn btn beatCon" data-dir="prev">
                            <i class="fas fa-step-backward"></i>
                            <a href="#" class="screen_out">이전</a>
                        </div>
                        <div id="showBeat">
                            <div id="beatWindow"></div>
                        </div>
                        <div class="nextBtn btn beatCon" data-dir="next">
                            <i class="fas fa-step-forward"></i>
                            <a href="#" class="screen_out">다음</a>
                        </div>
                        <div class="conWrap">
                            <button class="playBtn">
                                <span class="screen_out">재생/일시정지</span>
                                <i class="fas fa-play"></i>
                            </button><!--
                            --><button class="stopBtn">
                                <span class="screen_out">정지</span>
                                <i class="fas fa-stop"></i>
                            </button>
                        </div>
                    </div><!-- #beatBox -->
                    <div id="volumeControllers">
                        <div id="tempoPanel">
                            <div id="tempoControl" class="bigControl"></div>
                            <span class="guideTxt">템포</span>
                        </div>
                        <div id="volPanel">
                            <div id="volumeControl" class="bigControl"></div>
                            <span class="guideTxt">볼륨</span>
                        </div>
                        <div class="micPanel">
                            <div class="micControl"></div>
                            <span class="guideTxt">마이크</span>
                        </div>
                    </div><!-- #volumeControllers -->
                </div><!-- #loopHeader -->
                <div id="looperArea">
                    <div id="looper1" class="looper">
                        <div class="micPanel">
                            <div class="micControl"></div>
                        </div>
                        <div class="loopStop">
                            <div class="btnAux">
                                <button class="stopBtn">
                                    <span class="screen_out">정지</span>
                                    <i class="fas fa-stop"></i>
                                </button>
                            </div>
                        </div>
                        <div class="loopReset">
                            <div class="btnAux">
                                <button class="resetBtn">리셋</button>
                            </div>
                        </div>
                        <div class="looperHead">루퍼1</div>
                        <div class="looperBack">
                            <canvas id="loop1" width="205" height="205"></canvas>
                            <div class="btnWrap">
                                <div class="loopBtn idle" data-num="1">
                                    <div class="dif waiting prog progressing">
                                        <div class="recImg"></div>
                                    </div>
                                    <div class="recording prog">
                                        <div class="recImg"></div>
                                    </div>
                                    <div class="playing prog"><i class="fas fa-play"></i></div>
                                </div>
                            </div><!-- .btnWrap -->
                        </div><!-- .looperBack -->
                    </div><!-- #looper1 -->
                    <div id="looper2" class="looper">
                        <div class="micPanel">
                            <div class="micControl"></div>
                        </div>
                        <div class="loopStop">
                            <div class="btnAux">
                                <button class="stopBtn">
                                    <span class="screen_out">정지</span>
                                    <i class="fas fa-stop"></i>
                                </button>
                            </div>
                        </div>
                        <div class="loopReset">
                            <div class="btnAux">
                                <button class="resetBtn">리셋</button>
                            </div>
                        </div>
                        <div class="looperHead">루퍼2</div>
                        <div class="looperBack">
                            <canvas id="loop2" width="205" height="205"></canvas>
                            <div class="btnWrap">
                                <div class="loopBtn idle" data-num="2">
                                    <div class="waiting prog">
                                        <div class="recImg"></div>
                                    </div>
                                    <div class="recording prog">
                                        <div class="recImg"></div>
                                    </div>
                                    <div class="playing prog progressing"><i class="fas fa-play"></i></div>
                                </div>
                            </div><!-- .btnWrap -->
                        </div><!-- .looperBack -->
                    </div><!-- #looper2 -->
                    <div id="looper3" class="looper">
                        <div class="micPanel">
                            <div class="micControl"></div>
                        </div>
                        <div class="loopStop">
                            <div class="btnAux">
                                <button class="stopBtn">
                                    <span class="screen_out">정지</span>
                                    <i class="fas fa-stop"></i>
                                </button>
                            </div>
                        </div>
                        <div class="loopReset">
                            <div class="btnAux">
                                <button class="resetBtn">리셋</button>
                            </div>
                        </div>
                        <div class="looperHead">루퍼3</div>
                        <div class="looperBack">
                            <canvas id="loop3" width="205" height="205"></canvas>
                            <div class="btnWrap">
                                <div class="loopBtn idle" data-num="3">
                                    <div class="waiting prog">
                                        <div class="recImg"></div>
                                    </div>
                                    <div class="recording prog progressing">
                                        <div class="recImg"></div>
                                    </div>
                                    <div class="playing prog"><i class="fas fa-play"></i></div>
                                </div>
                            </div><!-- .btnWrap -->
                        </div><!-- .looperBack -->
                    </div><!-- #looper3 -->
                </div><!-- #looperArea -->
                <div id="loopFooter">
                    <div id="soundSourceArea">
                        <div id="recentSources">
                            <div class="recentSource1 btn"></div>
                            <div class="recentSource2 btn"></div>
                            <div class="recentSource3 btn"></div>
                        </div><!-- #recentSources -->
                        <div id="sourceRecBtn" class="btn"></div>
                        <div id="showSourcesBtn" class="btn"></div>
                    </div><!-- #soundSourceArea -->
                    <div id="soundGridArea">
                        <div class="sourceGridWrap">
                            <div class="gridTxt">소리 소스</div>
                            <div id="sourceGrid"></div>
                        </div>
                        <div id="looperGridArea">
                            <div class="gridWrap">
                                <div class="gridTxt">루프1</div>
                                <div id="looper1Grid" class="looperGrid"></div>
                            </div>
                            <div class="gridWrap">
                                <div class="gridTxt">루프2</div>
                                <div id="looper2Grid" class="looperGrid"></div>
                            </div>
                            <div class="gridWrap">
                                <div class="gridTxt">루프3</div>
                                <div id="looper3Grid" class="looperGrid"></div>
                            </div>
                            <div class="playBtn btn">
                                <i class="fas fa-play-circle"></i>
                                <span class="screen_out">재생/일시정지</span>
                            </div>
                        </div><!-- #looperGridArea -->
                    </div><!-- #soundgridArea -->
                </div><!-- #loopFooter -->
                <div id="popup">
                    <div id="closeBtn" title="닫기">
                        <a href="#">
                            <i class="far fa-times-circle"></i>
                            <span class="screen_out">닫기</span>
                        </a>
                    </div>
                    <div class="defaultSources">
                        <div class="sourceArea">
                            <div class="source">
                                <div class="sourceIcon info"></div>
                                <div class="sourceName info">소스이름</div>
                            </div>
                        </div>
                        <div class="paginationArea">
                            <div class="paginator">페이지네이트 영역</div>
                        </div>
                    </div><!-- .defaultSources -->
                    <div class="mySources">
                        <div class="sourceArea">
                            <div class="source">
                                <div class="sourceIcon info"></div>
                                <div class="sourceName info">소스이름</div>
                            </div>
                        </div>
                        <div class="paginationArea">
                            <div class="paginator">페이지네이트 영역</div>
                        </div>
                    </div><!-- .mySources -->
                    <div class="takenSources">
                        <div class="sourceArea">
                            <div class="source">
                                <div class="sourceIcon info"></div>
                                <div class="sourceName info">소스이름</div>
                            </div>
                        </div>
                        <div class="paginationArea">
                            <div class="paginator">페이지네이트 영역</div>
                        </div>
                    </div><!-- .takenSources -->
                    <div id="searchForm">
                        <div class="searchWrap">
                            <form action="" method="get">
                                <input name="keyword" placeholder="검색어 입력" id="searchSource"/>
                                <button class="searchBtn">검색</button>
                            </form>
                        </div>
                        <div class="searchedSources">
                            <div class="sourceArea">
                                <div class="source">
                                    <div class="sourceIcon info"></div>
                                    <div class="sourceName info">소스이름</div>
                                    <div class="usedTime info">17,321회</div>
                                </div>
                            </div><!-- .sourceArea -->
                            <div class="paginationArea">
                                <div class="paginator">페이지네이트 영역</div>
                            </div>
                        </div><!-- .searchedSources -->
                    </div><!-- #searchForm -->
                </div><!-- #popup -->
            </div><!-- #loopStation -->
        </div><!-- #edge -->
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
    </div><!-- #content -->
<script src="js/jquery.js"></script>
<script>
    function panel() {
        for(var i = 45; i <= 315; i += 6) {
            var $barWrap = $("<div>").attr("class","barWrap");
            var $bar = $("<div>").attr("class","bar");
            $barWrap.css("transform","rotateZ(" + i + "deg)").append($bar).appendTo(".bigControl");
        }//for end
    }//panel() end
    panel();
    function smallPanel() {
        for(var i = 45 ; i <= 315 ; i += 6) {
            var $barWrap = $("<div>").attr("class","barWrap");
            var $bar = $("<div>").attr("class","bar");
            $barWrap.css("transform","rotateZ(" + i + "deg)").append($bar).appendTo(".micControl");
        }
    }
    smallPanel();
    $("#recBtn").click(function () {
        if($(this).hasClass("recording")) {
        }else {
            $(this).addClass("recording");
            $("#loopHeader #stopBtn").addClass("active");
        }//if~else end
    });//#recBtn.click() end

    $(".beatCon").click(function () {
        var curPos = $("#beatWindow").css("background-position");
        var num = parseInt(curPos.substring(0,curPos.indexOf("px")));
        var dir = $(this).data("dir");
        if(num != 0 && dir == "prev") {
            $("#beatWindow").css("background-position", num + 55 +"px 0");
        }else if(num != -275 && dir =="next") {
            $("#beatWindow").css("background-position", num - 55 +"px 0");
        }//if~else end
    });//.beatCon.click() end

    $("#stopBtn").click(function () {
        if($(this).hasClass("active")) {
            $(this).removeClass("active");
            $("#loopHeader #recBtn").removeClass("recording");
        }else {

        }//if~else end
    });//#stopBtn.click() end
	
   	var recDuration = 0;
   	var t1;
   	var t2;
   	var w = 0;
    
    $(".loopBtn").click(function () {
    	var d = new Date();
    	w++;
    	var loopNum = $(this).data("num");
        if($(this).hasClass("idle")) {
        	t1 = d.getTime();
        	$(this).removeClass("idle");
        	$(this).addClass("rec");
        	//레코드 시작
        }else if($(this).hasClass("rec")) {
        	if(w==2) {
        		t2 = d.getTime();
	        	recDuration = (t2 - t1)/1000;
	        	console.log(recDuration);
	        	initDrawProg(loopNum);
        	}
        	$(this).removeClass("rec");
        	$(this).addClass("play");
        	//루프 시작
        }else {
        	$(this).removeClass("play");
        	$(this).addClass("rec");
        	//중첩 레코드 시작
        }//if~else if~else end
        
    });//.loopBtn.click() end

    function initDrawProg(no) {
    	if(no == 1) {
	    	var $canves1 = $("#loop1");
	    	var canvas1 = $canves1.get(0);
	    	var ctx1 = canvas1.getContext("2d");
	    	var deg1 = 0;
	    	drawProg(recDuration,deg1,ctx1);
    	}else if(no == 2) {
    		var $canves2 = $("#loop2");
	    	var canvas2 = $canves2.get(0);
	    	var ctx2 = canvas2.getContext("2d");
	    	var deg2 = 0;
	    	drawProg(recDuration,deg2,ctx2);
    	}else {
    		var $canves3 = $("#loop3");
	    	var canvas3 = $canves3.get(0);
	    	var ctx3 = canvas3.getContext("2d");
	    	var deg3 = 0;
	    	drawProg(recDuration,deg3,ctx3);
    	}//if~else if~else end
    }//initDrawProg() end
    
    function drawProg(duration,deg,ctx) {
        var length = duration;
        setInterval(function () {

            deg += (Math.PI*3/2)/(10*length);
            if(deg>Math.PI*3/2) {
                deg = 0;
            }
            ctx.clearRect(0,0,205,205);

            ctx.beginPath();
            ctx.arc(102.5,102.5,95,Math.PI*3/2,deg,true);
            ctx.lineWidth=15;
            ctx.strokeStyle="red";
            ctx.stroke();
            ctx.closePath();
        },100);
    }//drawProg() end
    
    $("#showSourcesBtn").click(function () {
        $("#popup").show();
    });
    $("#closeBtn").click(function () {
        $("#popup").hide();
    });

    $("#looperGridArea .playBtn").click(function () {
        if($(this).find("i").hasClass("fa-play-circle")) {
            $(this).find("i").removeClass("fa-play-circle").addClass("fa-pause-circle");
        }else {
            $(this).find("i").removeClass("fa-pause-circle").addClass("fa-play-circle");
        }
    });//#looperGridArea .playBtn.click() end
    $("#beatBox .playBtn").click(function () {
        if($(this).find("i").hasClass("fa-play")) {
            $(this).find("i").removeClass("fa-play").addClass("fa-pause");
        }else {
            $(this).find("i").removeClass("fa-pause").addClass("fa-play");
        }
    });//#looperGridArea .playBtn.click() end
    $("#beatBox .stopBtn").click(function () {
        $("#beatBox i").removeClass("fa-pause").addClass("fa-play");
    });//#beatBox .stopBtn.click()end
    
/* insertPopup */
    
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
    