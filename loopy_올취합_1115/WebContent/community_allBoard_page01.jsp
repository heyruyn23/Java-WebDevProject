<%@page import="org.bjd.loopy.util.PaginateUtil"%>
<%@page import="org.bjd.loopy.vo.Text"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.dao.TextsDAO"%>
<%@page import="org.bjd.loopy.vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String pageStr = request.getParameter("page");
	int pageNo = 1;
	int numPage = 8;
	
	if(pageStr!=null) {
		
		try {
			pageNo = Integer.valueOf(pageStr);
		}catch(Exception e) {
			System.out.println("숫자아님");			
		}//try~catch end
		
	}//if end
	
	PageVO pageVO = new PageVO(pageNo,numPage);
	
	List<Text> list = TextsDAO.selectList(pageVO);
	List<Text> listBV = TextsDAO.selectListBV();
	List<Text> listBL = TextsDAO.selectListBL();

	int total = TextsDAO.selectTotal();	
				
	int numBlock = 5;
				
	String url = "/community_allBoard_page01.jsp";
	String param = "page=";				
				
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);				
				
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>allBoard</title>
<link rel="stylesheet" href="/css/allBoard.css"/>
<link rel="stylesheet" href="/css/paginate.css"/>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div id="communityTap">
    <div class="showAllBoard on"><a href="community_allBoard_page01.jsp">전체 글 보기</a></div>
    <div class="freeBoard"><a href="community_freeBoard.jsp">자유 게시판</a></div>
    <div class="lectureBoard"><a href="community_lectureBoard.jsp">강의 게시판</a></div>
    <div class="queryBoard"><a href="community_queryBoard.jsp">질문 게시판</a></div>
    <div class="informBoard"><a href="community_informBoard.jsp">정보 게시판</a></div>
    <div class="reviewBoard"><a href="community_reviewBoard.jsp">리뷰 게시판</a></div>
    <div class="PRBoard"><a href="community_PRBoard.jsp">홍보 게시판</a></div>
</div><!--communityTap end-->


<div class="boardListContents">
    <div class="searchBoard">
        <form action="" method="get">
            <fieldset>
                <legend class="screen_out">게시판 검색</legend>
                <select class="boardListSearchSource">
                    <option>전체</option>
                    <option>제목</option>
                    <option>작성자</option>
                    <option>내용</option>
                </select>
                <input name="searchBoard"
                       value=""
                       class="boardListSearchSource"
                />
                <button type="submit" class="boardListSearchSource">
                    <i class="fas fa-search"></i>
                    <span class="screen_out">검색</span>
                </button>
            </fieldset>
        </form>
    </div><!--searchBoard end-->
    <p>조회수 best</p>
    <div class="boardListContentsIndex">
        <div>번호</div>
        <div>제목</div>
        <div>작성자</div>
        <div>시간</div>
        <div>조회수</div>
        <div>추천수</div>
    </div><!--boardListContentsIndex end-->
</div><!--boardListContents end-->

<div class="viewBestList">
    <ul>
    <%for(Text text: listBV) {%>
         <li>
           <div class="viewBestListNo"><%=text.getTextNo() %></div>
           <div class="viewBestListName"><a href="/community_viewer.jsp?no=<%=text.getTextNo()%>"><%=text.getTextTitle() %></a></div>
           <div class="viewBestListLevel"><span>45</span></div>
           <div class="viewBestListWriter"><a href=""><%=text.getNickKo()%></a></div>
           <div class="viewBestListUploadDate"><%=text.getTextReg()%></div>
           <div class="viewBestListViewCount"><%=text.getTextHit()%></div>
           <div class="viewBestListLikeCount"><%=text.getLikeNum()%></div>
         </li>
    <%} %>
    </ul>
</div><!--viewBestList end-->

<div class="middleIndex">
    <div>추천수 best</div>
</div><!--middleIndex end-->

<div class="likeBestList">
    <ul>
    	<%for(Text text: listBL) {%>
            <li>
                <div class="likeBestListNo"><%=text.getTextNo() %></div>
                <div class="likeBestListName"><a href="/community_viewer.jsp?no=<%=text.getTextNo()%>"><%=text.getTextTitle() %></a></div>
                <div class="likeBestListLevel">55</div>
                <div class="likeBestListWriter"><a href=""><%=text.getNickKo()%></a></div>
                <div class="likeBestListUploadDate"><%=text.getTextReg()%></div>
                <div class="likeBestListViewCount"><%=text.getTextHit()%></div>
                <div class="likeBestListLikeCount"><%=text.getLikeNum()%></div>
            </li>
        <%} %>   
    </ul>
</div><!--likeBestList end-->

<div class="middleIndex">
    <div>전체 글 목록</div>
</div><!--middleIndex end-->

<div class="allBoardList">
    <ul>
    	<%for(Text text: list) {%>
            <li>
                <div class="allBoardListNo"><%=text.getTextNo() %></div>
                <div class="allBoardListName"><a href="/community_viewer.jsp?no=<%=text.getTextNo()%>"><%=text.getTextTitle() %></a></div>
                <div class="allBoardListLevel">12</div>
                <div class="allBoardListWriter"><%=text.getNickKo()%></div>
                <div class="allBoardListUploadDate"><%=text.getTextReg()%></div>
                <div class="allBoardListViewCount"><%=text.getTextHit()%></div>
                <div class="allBoardListLikeCount"><%=text.getLikeNum()%></div>
            </li>
        <%} %>   
    </ul>
</div><!--allBoardList end-->

<div class="bottom">
<!--     <div class="pagination">
        <a href="#">&laquo;</a>
        <a class="active" href="#">1</a>
        <a href="community_allBoard_pageElse.jsp">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">&raquo;</a>
    </div> -->
    <%=paginate %>
    <div class="searchBoard">
        <form action="" method="get">
            <fieldset>
                <legend class="screen_out">게시판 검색</legend>
                <select class="boardListSearchSource">
                    <option>전체</option>
                    <option>제목</option>
                    <option>작성자</option>
                    <option>내용</option>
                </select>
                <input name="searchBoard"
                       value=""
                       class="boardListSearchSource"
                />
                <button type="submit" class="boardListSearchSource">
                    <i class="fas fa-search"></i>
                    <span class="screen_out">검색</span>
                </button>
            </fieldset>
        </form>
    </div><!--searchBoard end-->
</div><!--bottom end-->

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

    $("#communityTap div").on("click",function () {
        var idx = $(this).index();
        $(".on").removeClass("on");
        $(".tab").eq(idx).addClass("on");
        $(this).addClass("on");
    });
</script>
</body>
</html>