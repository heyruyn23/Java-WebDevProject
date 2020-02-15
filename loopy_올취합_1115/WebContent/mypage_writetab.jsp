<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글관리</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
   	<link rel="stylesheet" href="/css/mypage.css"/>
    <style>
        html {
            overflow-y: scroll;
        }
        body{
            background-color: #121212;
            font-size: 15px;
        }

        #wrap{
            position: relative;
            width: 1000px;
            height: 500px;
            top:50%;
            left: 50%;
            margin-left: -500px;
            margin-top: -200px;
        }
        
        #middleBox{

           
            width: 800px;
            margin: auto;
            margin-top: 200px;
            overflow: hidden;
        }
        #middle{
            position: relative;
        }
        .hor{
            width: 100px;
            height: 40px;
            background-color: #262626;
            font-size: 18px;
            line-height: 40px;
            text-align: center;
            float: left;
            cursor: pointer;

        }
        .userReply{
            margin-left: 0px;
            margin-top:-240px;

         }

        .userComment{
            margin-left: 100px;
            margin-top:-240px;

        }
        .commentary{
            margin-left: 200px;
            margin-top:-240px;
        }
        .post{
            margin-left: 200px;
            margin-top:-240px;
        }

        /*.hor:hover{*/
            /*background-color: #181818;*/
            /*transform: scale(1.20);*/

        /*}*/
        .ver{
            width: 40px;
            height: 100px;
            background-color: #262626;
            font-size: 18px;
            text-align: center;
            line-height: 40px;
            /*transform: translateX(-40px);*/
            margin-left: -40px;
            cursor: pointer;
        }

        /*.ver:hover{*/
            /*background-color: #181818;*/
            /*transform: scale(1.20);*/
        /*}*/

        .post{
            margin-left: -100px;
            display: none;
        }


        #middle{
            width:700px;
            height:500px;
            background-color: #262626;
            margin-left: 40px;
            margin-top:50px;

        }


        .userBox{
            width: 700px;
            height: 100px;
            background-color: #262626;
            float: left;
            transform: translateY(-240px);
            border-bottom: solid 1px white;


        }

        .profile{
            width: 50px;
            height: 100px;
            float: left;
        }

        .profile img{
            border-radius: 100px;
            transform: translateY(40px);
            margin-left: 5px;


        }
        .name{
            width: 100px;
            height: 100px;
            line-height: 140px;
            float: left;

        }
        .contentsBox{

            width: 310px;
            height: 100px;
            min-height: auto;
            line-height: 140px;
            float: left;

        }
        .btn{
            width: 65px;
            height: 25px;
            cursor: pointer;
            font-weight: bold;
            outline: none;
            float: left;
            margin-left: 5px;
            margin-right: 5px;
            border-radius: 3px;
            transform: translateY(60px);
        }
        .delete{
            right: 170px;


        }
        .warn{
            background: red;
            color: black;

        }

        .warnPopup{
            position: absolute;
            width: 350px;
            min-height: 250px;
            background-color: #bab9ba;
            border-radius: 5px;
            top:50%;
            left: 50%;
            margin-left: -175px;
            margin-top: -175px;
            z-index: 2;
            display: none;

        }
        .warnPopup span{
            display: block;
            padding: 10px;
            font-weight: bold;
            color: black;
        }
        .warnReason{
            position: relative;
            top:10px;
            left:10px;
            width: 325px;
            min-height: 150px;
            border-radius: 5px;
            resize: none;
            overflow: hidden;


        }

        .warnPopupBack{
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            z-index: 1;

        }

        .warnPopup button{
            position: relative;
            border-radius: 5px;
            left: 250px;
            top:15px;
            width: 80px;
            height: 30px;
            line-height: 30px;
            cursor: pointer;
        }

        .workProfile{
            margin-top: 10px;
            margin-left: 2px;
            cursor: pointer;
            float: left;

        }

        .onTab{

            background-color: #121212;
        }

        .imgRight{
            margin-left: 150px;
            margin-top: -26px;
        }

        .middleList{
            width: 700px; min-height: 200px;
            margin-top: 40px;
        }



    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>

<!--작품 달린댓글-->
<script type="text/template" id="replyTmp">
    <@ _.each(replyForm,function(reply){ @>
    <li>
        <div class="userBox">
            <div class=" profile">
               <a href=""><img src="img/<@=reply.profile@>" width="40" height="40" /></a>
            </div><!--profile end -->
            <div class="name">
                <@=reply.name@>
            </div><!-- name end-->
            <div class="contentsBox">
                <@=reply.contentsBox@>
            </div><!--contentsBox end-->
            <div class="button">
                <button class="btn delete">삭제</button>
                <button class="btn warn">신고</button>
            </div><!--btn end-->
            <div class="workProfile">
                <a href=""><img src="img/<@=reply.workProfile@>" width="80" height="80" /></a>
            </div><!-- workProfile-->
        </div><!--userBox end (유저)-->
    </li>
    <@ }) @>
</script>
<!--작품 달린댓글 end-->

<!-- 작품 쓴댓글-->
<script type="text/template" id="commentTmp">
    <@ _.each(commentForm,function(comment){ @>
    <li>
        <div class="userBox">
            <div class=" profile">
                <a href=""><img src="img/<@=comment.profile@>" width="40" height="40" /></a>
            </div><!--profile end -->
            <div class="name">
                <@=comment.name@>
            </div><!-- name end-->
            <div class="contentsBox">
                <@=comment.contentsBox@>
            </div><!--contentsBox end-->
            <div class="button">
                <button class="btn delete">삭제</button>

            </div><!--btn end-->
            <div class="workProfile">
                <a href=""><img src="img/<@=comment.workProfile@>" width="80" height="80" class="imgRight"/></a>
            </div><!-- workProfile-->
        </div><!--userBox end (유저)-->
    </li>
    <@ }) @>
</script>
<!-- 작품 쓴댓글 end-->


<!-- 작품 코멘토리-->
<script type="text/template" id="commentaryTmp">
    <@ _.each(commentaryForm,function(commentary){ @>
    <li>
        <div class="userBox">
            <div class=" profile">
                <a href=""><img src="img/<@=commentary.profile@>" width="40" height="40" /></a>
            </div><!--profile end -->
            <div class="name">
                <@=commentary.name@>
            </div><!-- name end-->
            <div class="contentsBox">
                <@=commentary.contentsBox@>
            </div><!--contentsBox end-->
            <div class="button">
                <button class="btn delete">삭제</button>
                <button class="btn warn">신고</button>
            </div><!--btn end-->
            <div class="workProfile">
                <a href=""><img src="img/<@=commentary.workProfile@>" width="80" height="80" /></a>
            </div><!-- workProfile-->
        </div><!--userBox end (유저)-->
    </li>
    <@ }) @>
</script>
<!-- 작품 코멘토리 end-->

<!-- 게시글 달린댓글-->
<script type="text/template" id="userReplyTmp">
    <@ _.each(userReplyForm,function(userReply){ @>
    <li>
        <div class="userBox">
            <div class=" profile">
                <a href=""><img src="img/<@=userReply.profile@>" width="40" height="40" /></a>
            </div><!--profile end -->
            <div class="name">
                <@=userReply.name@>
            </div><!-- name end-->
            <div class="contentsBox">
                <@=userReply.contentsBox@>
            </div><!--contentsBox end-->
            <div class="button">
                <button class="btn delete">삭제</button>
                <button class="btn warn">신고</button>
            </div><!--btn end-->
            <div class="workProfile">
                <a href=""><img src="img/<@=userReply.workProfile@>" width="80" height="80" /></a>
            </div><!-- workProfile-->
        </div><!--userBox end (유저)-->
    </li>
    <@ }) @>
</script>
<!-- 게시글 달린댓글 end-->

<!-- 게시글 쓴댓글-->
<script type="text/template" id="userCommentTmp">
    <@ _.each(userCommentForm,function(userComment){ @>
    <li>
        <div class="userBox">
            <div class=" profile">
                <a href=""><img src="img/<@=userComment.profile@>" width="40" height="40" /></a>
            </div><!--profile end -->
            <div class="name">
                <@=userComment.name@>
            </div><!-- name end-->
            <div class="contentsBox">
                <@=userComment.contentsBox@>
            </div><!--contentsBox end-->
            <div class="button">
                <button class="btn delete">삭제</button>
            </div><!--btn end-->
            <div class="workProfile">
                <a href=""><img src="img/<@=userComment.workProfile@>" width="80" height="80" class="imgRight"/></a>
            </div><!-- workProfile-->
        </div><!--userBox end (유저)-->
    </li>
    <@ }) @>
</script>
<!-- 게시글 쓴댓글 end-->


<!-- 게시글 쓴 게시글-->
<script type="text/template" id="postTmp">
    <@ _.each(postForm,function(post){ @>
    <li>
        <div class="userBox">
            <div class=" profile">
                <a href=""><img src="img/<@=post.profile@>" width="40" height="40" /></a>
            </div><!--profile end -->
            <div class="name">
                <@=post.name@>
            </div><!-- name end-->
            <div class="contentsBox">
                <@=post.contentsBox@>
            </div><!--contentsBox end-->
            <div class="button">
                <button class="btn delete">삭제</button>
            </div><!--btn end-->
            <div class="workProfile">
                <a href=""><img src="img/<@=post.workProfile@>" width="80" height="80" class="imgRight" /></a>
            </div><!-- workProfile-->
        </div><!--userBox end (유저)-->
    </li>
    <@ }) @>
</script>
<!-- 게시글 쓴 게시글 end-->
<% int type=5; %>
<%@ include file="/WEB-INF/template/mypage_header.jsp" %>




<div id = wrap>
    <div class="warnPopupBack"></div><!--팝업시 배경 불툼명-->
    <div class="warnPopup"><span>신고 사유</span><textarea class="warnReason" placeholder="내용을 입력해주세요" name=""></textarea><a href=""><button>완료</button></a></div><!--경고 창 팝업-->
    <div id="middleBox">
        <div id="middle">
                <div class="tab ver work onTab" style="writing-mode:tb-rl;" >작 품</div><!--work end(작품)-->
                <div class="tab ver community" style="writing-mode:tb-rl;">커뮤니티</div><!--community end(커뮤니티)-->
                <div class="tab hor userReply onTab">달린 댓글</div><!--reply end (달린댓글)-->
                <div class="tab hor userComment">쓴 댓글</div><!--comment end (쓴댓글)-->
                <div class="tab hor commentary">코멘터리</div><!--commentary end(해설)-->
                <div class="tab hor post">내가 쓴 글</div><!--post end(글작성)-->

                <ul class="middleList"></ul><!--템플릿 스크립트 부모 -->
        </div><!--middle-->
    </div><!--middleBox-->
</div> <!--wrap end-->
<%@ include file="/WEB-INF/template/mypage_footer.jsp" %>
<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
    <script>
    var backgroundImage = "<%=user.getCoverArt()%>";
    </script>
<script src="/js/mypage.js"></script>
<script>

	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@(.+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};

            //삭제버튼클릭시
            $("#middle").on("click",".delete",function () {

                if(!confirm("정말 삭제하시겠습니까?")){
                    return false;
                }

                $(this).parent().parent().parent().remove();

            });
            //삭제버튼클릭시 end



            //가로 탭 이동
            $(".hor").click(function (e) {
                e.preventDefault();


                $(".onTab").removeClass("onTab").before();
                $(".work").addClass("onTab");
                $(this).addClass("onTab");

            });
            //가로 탭 이동 end



            //작품일때  가로 탭 코맨토리 나옴
            $(".work").click(function () {

                $("#middle div").removeClass("onTab");
                $(".commentary").show();
                $(".post").hide();
                $(".work").css("background-color","#121212")
                $(".community").css("background-color","#262626");
                $(".userReply").addClass("onTab");


            });
            //작품일때 가로 탭 코맨토리 나옴 end


            // 커뮤일때 가로 탭 내가쓴글 나옴
            $(".community").click(function () {

                $("#middle div").removeClass("onTab");
                $(".userReply").addClass("onTab");
                $(".community").css("background-color","#121212");
                $(".work").css("background-color","#262626");
                $(".post").show().css("transform","translate(300px, 0px)");
            });
            // 커뮤일때 가로 탭 내가쓴글 나옴 end



        //템플릿 작품 달린댓글 함수선언
        function tmpf() {

            var tmp = _.template($("#replyTmp").html());

            $.ajax({
                url: "ajax/replyForm.json",
                type: "get",
                dataType: "json",

                error:function () {


                },

                success:function (json) {

                    $("#middle .middleList").append(tmp({replyForm:json}))

                }

            });

            }//tmpf() end
        //템플릿 작품 달린댓글 end



        //템플릿  작품 쓴댓글 함수선언
        function tmp1f() {


            var tmp1 = _.template($("#commentTmp").html());

            $.ajax({
                url: "ajax/commentForm.json",
                type: "get",
                dataType: "json",

                error: function () {


                },

                success: function (json) {

                    $("#middle .middleList").append(tmp1({commentForm: json}))

                    }

                 });

            }//tmp1f() end
        //템플릿 작품 쓴댓글 end



        //템플릿 코멘터리 함수선언
        function tmp2f() {

            var tmp2 = _.template($("#commentaryTmp").html());

            $.ajax({
                url: "ajax/commentaryForm.json",
                type: "get",
                dataType: "json",

                error:function () {


                },

                success:function (json) {

                    $("#middle .middleList").append(tmp2({commentaryForm:json}))

                    }

                });

            }//tmp2f() end
        //템플릿 코멘터리 end




        //템플릿 커뮤니티 달린댓글 함수선언
        function tmp3f() {


                var tmp3 = _.template($("#userReplyTmp").html());

                $.ajax({
                    url: "ajax/userReplyForm.json",
                    type: "get",
                    dataType: "json",

                    error:function () {


                    },

                    success:function (json) {

                        $("#middle .middleList").append(tmp3({userReplyForm:json}))

                    }

                });

            }//tmp3f() end
        //템플릿 커뮤니티 달릿댓글 end



        //템플릿 커뮤니티 쓴 댓글
        function tmp4f() {


                var tmp4 = _.template($("#userCommentTmp").html());

                $.ajax({
                    url: "ajax/userCommentForm.json",
                    type: "get",
                    dataType: "json",

                    error:function () {


                    },

                    success:function (json) {

                        $("#middle .middleList").append(tmp4({userCommentForm:json}))

                    }

                });

            }//tmp4f() end
        //템플릿 커뮤니티 쓴 댓글 end


        //템플릿 커뮤니티 내가 쓴 글
        function tmp5f() {


                var tmp5 = _.template($("#postTmp").html());

                $.ajax({
                    url: "ajax/postForm.json",
                    type: "get",
                    dataType: "json",

                    error:function () {


                    },

                    success:function (json) {

                        $("#middle .middleList").append(tmp5({postForm:json}))

                    }

                });

            }//tmp5f() end
        //템플릿 커뮤니티 내가 쓴 글



        //처음 템플릿 작품-달린댓글 나오고
        tmpf();

        //작품눌럿을때 달린댓글 디폴트되고 나옴
        $(".work").click(function () {

            $(".middleList").children().remove();

            tmpf();

        });


        //커뮤눌럿을때 달린댓글 디폴트되고 나옴
        $(".community").click(function () {

            $(".middleList").children().remove();

            tmp3f();
        });


        //달린댓글 눌럿을때 템플릿 나옴 (선생님이 where조건 줘서 작품일때,커뮤니티일때 달린댓글 템플릿 나오게하면 된다고하던데..)
        $(".userReply").click(function () {

            $(".middleList").children().remove();

            tmpf();

        });


        //쓴댓글 눌럿을때 템플릿 나옴 (선생님이 where조건 줘서 작품일때,커뮤니티일때 쓴댓글 템플릿 나오게하면 된다고하던데..)
        $(".userComment").click(function () {

            $(".middleList").children().remove();

            tmp1f();

        });


        //코맨터리 눌럿을때 템플릿 나옴
        $(".commentary").click(function () {

        $(".middleList").children().remove();

         tmp2f();

        });



        //내가 쓴글 눌렀을때 템플릿 나옴
        $(".post").click(function () {

            $(".middleList").children().remove();

            tmp5f();

        });

            //신고 팝업
            $("body").on("click",".warn",function (e) {
                e.preventDefault();

                $(".warnPopup").show();
                $(".warnPopupBack").show();

            });

            $(".warnPopupBack").click(function () {

                $(".warnPopup").hide();
                $(".warnPopupBack").hide();

            });

            //신고팝업 end


</script>
</body>
</html>