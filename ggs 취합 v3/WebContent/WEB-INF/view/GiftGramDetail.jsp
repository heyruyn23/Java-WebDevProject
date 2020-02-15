<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>GiftGram | GiftGuideService</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/GiftGramDetail.css">
    <style>

    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>


<main>
    <div id="detailWrap">
		
        <div id="detailBox">
            <div id="detailImgBox">
                <div id="imgWrap">
                    <i class="fas fa-chevron-circle-left btn_setting left_btn"></i>
                    <i class="fas fa-chevron-circle-right btn_setting  right_btn"></i>
                   <ul id="imgBox">
                   <c:forEach items="#{images}" var="image">
                       <li><img src="/img/${image}"></li>
				   </c:forEach>

                   </ul>

                    </div>
                </div>
            </div>
            <div id="detailTextBox">
                <ul id="detailText">
                    <li id="userBox">
                        <div id="detailTitle"> 
                            <p id="title">${user.content} ${loginUser.email} </p>
                            <span class="userInfo">${user.email}</span>
                            <span class="userInfo">${user.regDate}</span>
                            <span class="userInfo">조회수 ${user.hit}</span>
           					<span id="hiddennum">${user.postNum}</span>
                        </div>
                    </li>
                    <div id="commentBox">
                        <div id="commentWrap">
                            <li class="comment_setting tag"><span class="user_cmt">#기념일 #생일 #19950408</span></li>
                           
                        </div>
                        <li id="textBottom">
                            <div id="like">
                            	<i class="far fa-heart like"></i><span id="likeCnt"></span>
								<i class="far fa-comments"></i><span id="commentCnt"></span>
                            </div>
                            <div id="commentInput">
                           <div id="cmtContent">
                                <textarea name="cmt"  id="cmtInput" placeholder="댓글 입력...." autocomplete="off"></textarea>
            			   </div>
			               </div>
                        </li>
                    </div>

			     </ul>

        </div>
        </div>

    </div>

</main>
<%@include file="/WEB-INF/template/footer.jsp" %>

<script type="text/template" id="cmtTmp">
    <@_.each(comment,function(comment){@>
    <li class="comment_setting">
		<span class="user_id"><@=comment.email@></span> :
		<span class="user_cmt"><@=comment.content@></span>
	</li>
    <@})@>
</script>


<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.js"></script>
<script>
		_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
	
        var img_length = $("img").length;
        var cmtTmp = _.template($("#cmtTmp").html());
        var page = $("#hiddennum").text();
       	var content;
           
        $("#imgBox").css("width",""+img_length *43+"vw");
        
		
		// 댓글 ajax
		function commentList() {
			
			 $("#commentWrap").empty();
				$.ajax({
	             url:"ajax/"+page,
	             type:"get",
	             dataType:"json",
	             error: function () {
	                 alert(" 댓글 서버 점검중");
	             },
	             success:function (json) {
	            	$("#commentWrap").append(cmtTmp({comment:json}));
	             }
	         });
		}
		// 댓글 ajax 종료
		
		commentList();
		
		// 좋아요 및 댓글 수 ajax
		function like(){   
			
			$.ajax({
	             url:"ajax/like/"+page,
	             type:"get",
	             dataType:"json",
	             error: function () {
	                 //alert("좋아요 서버 점검중");
	             },
	             success:function (json) {
	                 console.log(json.likeCnt);   
	                 $("#likeCnt").text(json.likeCnt);
	                 $("#commentCnt").text(json.commentCnt);  
	             }
	         });
		}
		//  좋아요 및 댓글 수 ajax 종료
		
		like();
		
		function insertlike() {
			$.ajax({
	             url:"like/"+page,
	             type:"get",
	             dataType:"json",
	             error: function () {        
	             },
	             success:function (json) {
	            	 like();
	            	 if(json ==0){
	            		$(".like").removeClass("fas");
	            	 }
	            	 else if(json ==1)
	            		 {
	            			 $(".like").addClass("fas");
	            		 }
	             }
	         });
			 
		}
		
		
		$("#cmtInput").keydown(function(key) {
			if (key.keyCode == 13 && !key.shiftKey) {
	    		<c:choose>	
				<c:when test="${loginMember == null }">
					alert("로그인이 필요합니다.");
					$("#cmtInput").val("");
        		</c:when>
        		<c:otherwise> 
        		content = $(this).val(); 
    			content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
    			key.preventDefault(); 
    			$.ajax({
    	             url:"comment/insert/"+page,
    	             type:"get",
    	             dataType:"json",
    	             data:{"content":content},
    	             error: function () {
    	            		alert("댓글");
    	             },
    	             success:function (json) {
    	            	 commentList();
    	            	 $("#cmtInput").val("");
    	       			 like();
    	             }
    	         });
    			
    		
            	 
    			</c:otherwise>
    			</c:choose>
			}
			});
		
        $(".like").click(function () {
        	<c:choose>
        	<c:when test="${loginMember == null }">
        		alert("로그인이 필요합니다.");
        	</c:when>
        	<c:otherwise>  
        		insertlike();
        	</c:otherwise>
        	</c:choose>
        });
        $(".fa-comments").click(function () {
            $("#cmtInput").focus();
        });
    
        var img_width = 0;

        var img_box = $("#imgBox").width();
        var x_location = 0;

        function btn_check(){
        if(x_location >=0){
            $(".right_btn").hide();
        }
        else{
            $(".right_btn").show();
        }
        if(x_location > ((img_length-1) *-30)){
            $(".left_btn").show();
        }else{
            $(".left_btn").hide();
        }
        }
        btn_check();
        $(".left_btn").click(function () {

            var img_width = $("#imgWrap").width();
                x_location-=30;
                btn_check();
                console.log(x_location);
                $("#imgBox").css("transform","translateX("+x_location+"vw)");

            // }

        })


        $(".right_btn").click(function () {

            x_location+=30;
            btn_check();
            console.log(x_location);
            $("#imgBox").css("transform","translateX("+x_location+"vw)");
        });

</script>
</body>
</html>