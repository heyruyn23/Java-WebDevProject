<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>신고하기</title>
    <link rel="stylesheet" href="/css/reset.css"/>
    <style>
        #allWarnBox {
            width: 500px;
            height: 400px;
            position: absolute;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            top:50%;
            left: 50%;
            margin: -200px 0 0 -250px;
        }
        h1 {
            font-size: 35px;
            text-align: center;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        #smallWrap {
            padding: 25px;
            text-align: center;
            margin-right: 30px;
        }

        textarea {
            display: block;
            margin-top: 50px;
            margin-left: 40px;
            width: 350px;
            height: 100px;
            resize: none;
            border-radius: 10px;
        }
        select {
            width: 250px;
            height: 25px;
        }
        #btnWrap {
            width: 300px;
            height: 50px;
            margin: auto;
            text-align: center;
        }
        .warnbb {
            width:100px;
            height: 40px;
            font-weight: bold;
            border: none;
            background: #40BEED;
            color: #fff;
            border-radius: 10px;

        }
        .dit {
            padding-left: 40px;
            text-align: left;
            font-size: 12px;
            color: silver;
        }
    </style>
</head>
<body>
    <div id="allWarnBox">
        <h1>신고하기</h1>
        <div id="smallWrap">
        <span>신고 사유 : </span>
        <select name="cause">
            <option>게시판의 취지와 맞지 않는 내용</option>
            <option>욕설 및 부적절한 단어 선택</option>
            <option>사행성 / 광고, 홍보 목적 이용</option>
            <option>선정적인 내용</option>
            <option>기타 사유</option>
        </select>
        <textarea placeholder="기타 사유를 적어주세요" ></textarea>
            <div class="dit">주의 ! </div>
            <div class="dit">부적절한 신고 및 무분별한 신고는 사용자의 제제가 있을 수 있습니다.</div>
        </div>
        <div id="btnWrap">
        <button id="warnBtn" class="warnbb">제출하기</button>
        <button id="cancleBtn" class="warnbb">취소</button>
        </div>
    </div>
<script src="js/jquery.js"></script>
<script>
    $("#warnBtn").click(function () {
        alert("신고가 접수 되었습니다.");
        window.close();
    });
    $("#cancleBtn").click(function () {
        window.close();
    });
</script>
</body>
</html>