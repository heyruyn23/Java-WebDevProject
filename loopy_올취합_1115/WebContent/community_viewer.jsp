<%@page import="org.bjd.loopy.vo.PageVO"%>
<%@page import="org.bjd.loopy.vo.ReplyText"%>
<%@page import="org.bjd.loopy.dao.RepliesTextsDAO"%>
<%@page import="org.bjd.loopy.util.PaginateUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Set"%>
<%@page import="org.bjd.loopy.vo.Text"%>
<%@page import="org.bjd.loopy.dao.TextsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	int no = 0;
	if(noStr!=null){
		no = Integer.parseInt(noStr);
	}// if end
	
	Text text = TextsDAO.selectOne(no);
	
	if(text==null){
		response.sendRedirect("community_allBoard_page01.jsp");
	}else{
		
		String pageNoStr = request.getParameter("page");
		int pageNo = 1;
		if(pageNoStr!=null){
			pageNo = Integer.parseInt(pageNoStr);
		}//if end
		
		Set<Integer> viewPages =
		(Set)session.getAttribute("viewPages");
		
		if(viewPages==null){
			viewPages = new LinkedHashSet();
		}// if end
		
		if(!viewPages.contains(no)){
			viewPages.add(no);
			TextsDAO.updateHit(no);
			session.setAttribute("viewPages", viewPages);
			text.setHit(text.getHit()+1);
		}
		
		String link = "/community_allBoard_page01.jsp?page=1";
		
		int numPage = 5;
		
		PageVO pageVO = new PageVO(pageNo, numPage, no);
		
		List<ReplyText> list = RepliesTextsDAO.selectList(pageVO);
		
		int total = RepliesTextsDAO.selectTotal(no);
		
		int numBlock = 3;
		
		String url = "/community_view.jsp";
		String param = "no="+no+"&page=";
		
		String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewer</title>
<link rel="stylesheet" href="css/tui-editor-contents.min.css">
<link rel="stylesheet" href="css/viewer.css"/>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div id="post">
    <div class="postName">
        <h2><%=text.getTitle()%></h2>
    </div><!--postName end-->
    <div class="postUserInformation">
        <ul>
            <li><div class="postUser"><a href=""><%=text.getNickKo()%></a></div></li>
            <li><div class="postDate"><%=text.getFormatDate()%></div></li>
            <span>|</span>
            <li><div class="postTime"><%=text.getFormatTime()%></div></li>
        </ul>
    </div><!--postUserInformation end-->

    <div class="viewer"></div>

    <div class="postInformation">
        <span>댓글</span>
        <span class=""><%=text.getReplyCount() %></span>
        <span>개</span>
        <span>|</span>
        <select>
            <option>등록순</option>
            <option>추천순</option>
        </select>
        <span>|</span>
        <span>조회수</span>
        <span class=""><%=text.getHit()%></span>
        <span>|</span>
        <span>추천</span>
        <span class="postLikeCount"><%=text.getLikeCount() %></span> 
        <%if(loginUser != null){%>
        <button class="postLike" type="button">추천</button>
        <%}%>
        <span class="close"><a href="">댓글 접기</a></span>
        <span>/</span>
        <span><a href="">새로고침</a></span>
    </div><!--postInformation end-->
    
<%if(loginUser != null){%>
    <div class="userCommentForm">
        <div class="profileBox">
            <img src="<%=loginUser.getProfile()%>" width="100" height="100" class="profile" alt=""/>
        </div><!--,profile end-->
        <div  class="commentWrite">
            <textarea name="" placeholder="댓글을 입력하세요"></textarea>
        </div>
        <div class="commentWriteButton">
            <button type="button">입력</button>
        </div>
    </div><!--userCommentForm end-->    
<%}%>

    <div class="userCommentList">
        <ul>

        </ul>
        <script type="text/template" id="userCommentTmp">
            <@ _.each(community_comment,function(userComment){@>
            <@ if(userComment.no==userComment.seq)  {@>
                    <li class="userComment">
                        <div class="profileArea">
						<@if(userComment.profile != null){@>
                            <div class="repProfile"><a href=""><img width="60" height="60" src="<@=userComment.profile@>"/></a></div>
						<@} else{@>
							<div class="repProfile"><a href=""><img width="60" height="60" src="/profile/userDefault.jpg"/></a></div>
						<@}@>
                            <div class="commentNickname"><a href=""><@=userComment.nickKo@></a></div>
                        </div>
						

                        <div class="commentText"><@=userComment.text@></div>
                        <div class="writeTime"><time><@=moment(userComment.regdate).format("YYYY. MM. DD. hh:mm")@></time></div>
                        <div class="userCheck">
                            <div class="commentLike"><i class="far fa-heart"></i><span class="screen_out">추천</span></div>
                            <div class="commentLikeCount">
                                <span class="screen_out">추천</span>
                                <i class="fas fa-heart"></i>
                                <span><@=userComment.likeCount@></span>
                            </div>
                            <div class="commentAdj"><a href=""><i class="far fa-edit"></i><span class="screen_out">수정</span></a></div>
                            <div class="commentDel"><a href=""><i class="far fa-trash-alt"></i><span class="screen_out">삭제</span></a></div>
                            <div class="commentRep"><a href=""><i class="fas fa-flag"></i><span class="screen_out">신고</span></a></div>
                            <div class="commentReRep"><button href=""><i class="fas fa-reply"></i><span class="screen_out">대댓글</span></button></div>
                        </div>
                    </li>
                <@ } else { @>
                    <li class="userCommentReply">
                        <div class="profileArea">
						<@if(userComment.profile != null){@>
                            <div class="repProfile"><a href=""><img width="60" height="60" src="<@=userComment.profile@>"/></a></div>
						<@} else{@>
							<div class="repProfile"><a href=""><img width="60" height="60" src="/profile/userDefault.jpg"/></a></div>
						<@}@>
                        <div class="commentNickname"><a href=""><@=userComment.nickKo@></a></div>
                        </div>
                        <div class="commentText"><@=userComment.text@></div>
                        <div class="writeTime"><time><@=moment(userComment.redate).format("YYYY. MM. DD. hh:mm")@></time></div>
                        <div class="userCheck">
                            <div class="commentLike"><i class="far fa-heart"></i><span class="screen_out">추천</span></div>
                            <div class="commentLikeCount">
                                <span class="screen_out">추천</span>
                                <i class="fas fa-heart"></i>
                                <span><@=userComment.likeCount@></span>
                            </div>
                            <div class="commentAdj"><a href=""><i class="far fa-edit"></i><span class="screen_out">수정</span></a></div>
                            <div class="commentDel"><a href=""><i class="far fa-trash-alt"></i><span class="screen_out">삭제</span></a></div>
                            <div class="commentRep"><a href=""><i class="fas fa-flag"></i><span class="screen_out">신고</span></a></div>
                            <@ if(userComment.no==userComment.seq)  {@>
                            <div class="commentReRep"><button href=""><i class="fas fa-reply"></i><span class="screen_out">대댓글</span></button></div>
                            <@}@>
                        </div>
                    </li>
                <@}@>
            <@})@>
        </script>
    </div><!--userCommentList end-->
</div><!--post end-->
<div class="commentPaginate"></div><!--commentPaginate end-->
<script src="js/jquery.js"></script>
<script src="js/moment-with-locales.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/tui-code-snippet.min.js"></script>
<script src='js/markdown-it.js'></script>
<script src="js/to-mark.min.js"></script>
<script src="js/codemirror.js"></script>
<script src="js/highlight.js"></script>
<script src="js/squire-raw.js"></script>
<script src="js/tui-editor-Editor.js"></script>
<script>


	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
	
	
	
    var tmp= _.template($("#userCommentTmp").html());
    var like01 = 0;
    var like02 = 0;

    $('.viewer').tuiEditor({
        viewer: true,
        height: 600,
        initialValue:`<%=text.getText()%>`
        });

    /*
    * # h1
    * ## h2
    *
    *
    * */

    
    function getCommunityComments() {
	    $.ajax({
	        url:"ajax/communityComment.jsp",
	        type:"get",
	        dataType:"json",
	        data:{pageNo:1,no:<%=no%>},
	        error:function () {
	            alert("test");	
	        },
	        success:function (json) {
	        	
	        	console.log(json);
	        	
	        	
	            $(".userCommentList ul").append(tmp({"community_comment":json}));
	        }
	    });
	    
    }
    
    getCommunityComments();
    
    $(".userCommentList").on("click",".commentLike",function () {
        /*항상 있는 .userCommentList를 잡고 새로 생기는 .commentLike를 클릭할 수 있게 연결*/
        if(like01 == 0){
            $(this).html("<i class=\"fas fa-heart\"></i>").css("color", "red");
            like01 = 1;
        }
        else if(like01 ==1){
            $(this).html("<i class=\"far fa-heart\"></i>").css("color", "white");
            like01 = 0;
        }
    });
    
    $(".postInformation").on("click", ".postLike",function () {
        if(like02==0){
            var count = Number($(".postLikeCount").text());
            count++;
            $(".postLikeCount").css("color", "red");
            $(".postLikeCount").text(count);
            like02=1;
        }else{
            var count = Number($(".postLikeCount").text());
            count--;
            $(".postLikeCount").css("color", "white");
            $(".postLikeCount").text(count);
            like02=0;
        }
    });

</script>
</body>
</html>