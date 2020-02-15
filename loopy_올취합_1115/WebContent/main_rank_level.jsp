<%@page import="org.bjd.loopy.dao.UsersDAO"%>
<%@page import="org.bjd.loopy.vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<User> LevelRank = UsersDAO.selectListLevel();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>rank_level</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/main_rank.css"/>
    <style></style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div id="ranking">
    <div id="rankingTab">
        <div><a href="main_rank_rp.jsp">RP</a></div>
        <div><a href="main_rank_db.jsp">dB</a></div>
        <div class="on"><a href="main_rank_level.jsp">level</a></div>
    </div><!--//#rankingTab-->

    <div>
        <form id="searchForm">
            <button id="search" type="button"><i class="fas fa-search"></i></button><!--
                --><label for="userName" class="screen_out">이름</label><!--
                --><input id="userName" autofocus placeholder="유저 검색"/>
        </form><!--// button #search-->
    </div><!--//#searchForm-->

    <div id="rankingContent">
        <div id="rankingColumn">
            <div>순위</div>
            <div>레벨</div>
            <div>아이디</div>
            <div>EXP</div>
        </div>
        <%if(loginUser!=null) {%>
        <div id="myRank" class="rankingList">
            <div><span id="rank">20</span></div>
            <div><span class='level'><%=UsersDAO.selectLevel(loginUser.getNo())%></span></div>
            <div><a href=""><span id="id"><%=loginUser.getNickKo() %></span></a></div>
            <div><%=UsersDAO.selectExp(loginUser.getNo())%></div>
        </div><%} else{%>
        <div id="myRank" class="rankingList">
            <div></div>
            <div></div>
            <div>로그인하여주세요</div>
            <div></div>
        </div>
        <%} %>
        <%int cnt=1; 
            for(User user : LevelRank) {%>
	        <div class='rankingList'>
		        <div><%=cnt++ %></div>
		        <div><span class='level'><%=UsersDAO.selectLevel(user.getNo())%></span></div>
		        <div><a href="/mypage.jsp?userNo=<%=user.getNo() %>"><%=user.getNickKo() %></a></div>
		        <div><span class="expScore"><%=user.getExps() %></span></div>
	        </div>
    	<%}%>
    <!--//#rankingContent-->
    <div class="full">
        <div id="rankingPopup">
            <div id="searchedName">
                <em>검색된 유저 이름</em>
            </div><!--//#searchedName-->
            </br>
            </br>
            <div id="totalRanking">
                <div>
                    RP &nbsp;&nbsp;&nbsp;<span id="RP">2</span>등
                    </br>
                    </br>
                    dB &nbsp;&nbsp;&nbsp;<span id="dB">25</span>등
                    </br>
                    </br>
                    level <span id="level">300</span>등
                </div>
            </div><!--//#totalRanking-->
        </div><!--//#rankingPopup-->
    </div><!--//.full-->
</div><!--//#ranking-->
<script src="js/jquery.js"></script>
<script>

    // 메뉴 탭 이동 on클래스 뗐다 붙이기
    $("#rankingTab>div").click(function (e) {
        $("#rankingTab>div").removeClass("on");
        $(this).addClass("on");
    });

    // 팝업창을 클릭하면 없어지는 기능
    $(".full").click(function () {
        $(this).css("display","none");
    });

    var $name = $('#userName');
    function displayName() { // 이름 보여주기
        // 지역변수 name을 선언한 뒤,
        // id가 #name인 input요소의 값을 얻어온 후
        // name에 대입후
        // 빈공백 제거 (trim() )
        var name = $name.val().trim();
        // 만약 name의 값이 없다면
        if(name==""){
            alert("유저명을 입력해주세요");
        }else{
            $("#searchedName em").text(name);
            $(".full").show();
        } // if~else end
        $name.val("").focus();
    } // displayName() end


    // button #search를 누르면 이름 검색
    $("#search").click(function () {
        displayName();
    });
    // * 해결책 form에 submit을 주게 되면 버튼을 누르던 엔터를 누르던 동작이 되게 한다.
    $("#searchForm").submit(function (e) {

        displayName();

        e.preventDefault();
    });

    $(".level").addClass("levelCol");

    $(".levelCol").each(function () {
        var lvl = parseInt($(this).text());
		if(lvl<10 && lvl>0){
            $(this).css({"border":"1px solid #B71C1C",
                "box-shadow":"0px 0px 3px #B71C1C"});
		}else if(lvl<20 && lvl>9){
            $(this).css({"border":"1px solid blue",
                "box-shadow":"0px 0px 3px blue"});
        }else if(lvl<30 && lvl>19){
            $(this).css({"border":"1px solid blue",
                "box-shadow":"0px 0px 3px blue"});
        }else if(lvl<40 && lvl>29){
            $(this).css({"border":"1px solid blue",
                "box-shadow":"0px 0px 3px blue"});
        }else if(lvl<50 && lvl>39){
            $(this).css({"border":"1px solid blue",
                "box-shadow":"0px 0px 3px blue"});
        }else if(lvl<60 && lvl>49){
            $(this).css({"border":"1px solid blue",
                "box-shadow":"0px 0px 3px blue"});
        }else if(lvl<70 && lvl>59){
            $(this).css({"border":"1px solid blue",
                "box-shadow":"0px 0px 3px blue"});
        }else if(lvl<80 && lvl>69){
            $(this).css({"border":"1px solid blue",
                "box-shadow":"0px 0px 3px blue"});
        }else if(lvl<90 && lvl>79){
            $(this).css({"border":"1px solid blue",
                "box-shadow":"0px 0px 3px blue"});
        }else if(lvl<100 && lvl>89){
            $(this).css({"border":"1px solid #B71C1C",
                "box-shadow":"0px 0px 3px #B71C1C"});
        }

        console.log(lvl);
    });

</script>
</body>
</html>