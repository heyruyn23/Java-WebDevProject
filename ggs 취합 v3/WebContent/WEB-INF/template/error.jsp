<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>페이지를 찾지 못하였습니다.</title>
<%@include file="/WEB-INF/template/link.jsp" %>
    <style>
        body {
            height: 100%;
        }
        html {
            height: 100%;
        }
        #errorWrap {
            position: relative;
            width: 100%;
            min-height: 850px;
            background-image: url("/img/back.jpg");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        #errorImg {
            width: 1000px;
            height: 600px;
            display: block;
            position: relative;
            margin: auto;
            top: 100px;
        }
        #errorBtn {
            width: 200px;
            height: 60px;
            display: block;
            background: #FF6060;
            position: relative;
            text-align: center;
            top:130px;
            line-height: 60px;
            margin: auto;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
            color: #FFF;
            border-radius: 5px;
        }
        #allIndexFooter {
            float:left;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/template/header.jsp" %>

<div id="errorWrap">
    <img id="errorImg" src="/img/errorPage.jpg">
    <a id="errorBtn" href="/index">메인으로 돌아가기</a>
</div>

<%@include file="/WEB-INF/template/footer.jsp" %>
<script src="/js/jquery.js"></script>
<script src="/js/fix-footer.js"></script>
<script>

</script>
</body>
</html>