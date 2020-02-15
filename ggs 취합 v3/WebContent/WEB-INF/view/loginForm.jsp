<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인 | GiftGuideService</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/loginAndJoin.css">
    <link rel="icon" href="/img/ggb.png">
</head>
<body>
<div id="loginBodyImage">
    <div id="loginContents">
        <h1 class="login_title">GGS</h1> <!-- .login_title end -->
        <h6 class="login_title_detail">(Gift Guide Service)</h6> <!-- .login_title_detail -->
        <form action="/session" method="POST">
            <div>
                <input class="login_email_inp" type="email" name="email" placeholder="이메일"> <!-- .login_email -->
            </div> <!-- 이메일 div -->
            <div>
                <input class="login_password_inp" type="password" name="password" placeholder="비밀번호"> <!-- .login_password end -->
            </div> <!-- 비밀번호 div -->
                    <div>
            <button class="login_btn">로그인</button> <!-- .login_button end -->
            <button type="button" class="login_btn" onclick="location='/index'">이전으로</button> <!-- .login_button end -->
        </div> <!-- 버튼 묶기 -->
        </form> <!-- form end -->

        <div>
            <a class="login_id_find" href="#">아이디 찾기</a> <!-- .login_find_id end -->
            <a class="login_password_find" href="#">비밀번호 찾기</a> <!-- login_find_password end -->
            <a class="login_join_form" href="/join">회원가입</a> <!-- .login_join_form end -->
        </div> <!-- 메뉴 묶기 -->
    </div> <!-- #loginContents end -->
</div> <!-- #loginBodyImage end -->
</body>
</html>