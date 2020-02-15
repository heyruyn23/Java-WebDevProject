<%@page import="org.bjd.loopy.vo.PageVO"%>
<%@page import="org.bjd.loopy.vo.Text"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.dao.TextsDAO"%>
<%@page import="org.bjd.loopy.util.PaginateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageStr = request.getParameter("page");
	int pageNo = 1;
	int numPage = 20;

	if(pageStr!=null) {
		try {
			pageNo = Integer.valueOf(pageStr);
		}catch(Exception e) {
			System.out.println("숫자아님");			
		}//try~catch end
	}//if end	
	
	PageVO pageVO = new PageVO(pageNo,numPage);
	
	List<Text> list = TextsDAO.selectLList(pageVO);
	
	int total = TextsDAO.selectLTotal();	
	
	int numBlock = 5;
				
	String url = "/community_freeBoard.jsp";
	String param = "page=";				
				
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lectureBoard</title>
<link rel="stylesheet" href="/css/community.css"/>
<link rel="stylesheet" href="/css/paginate.css"/>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div id="communityTap">
    <div class="showAllBoard"><a href="community_allBoard_page01.jsp">전체 글 보기</a></div>
    <div class="freeBoard"><a href="community_freeBoard.jsp">자유 게시판</a></div>
    <div class="lectureBoard on"><a href="community_lectureBoard.jsp">강의 게시판</a></div>
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
    <div class="communityTitle">강의게시판</div>
    <div class="boardListContentsIndex">
        <div>번호</div>
        <div>제목</div>
        <div>작성자</div>
        <div>시간</div>
        <div>조회수</div>
        <div>추천수</div>
    </div><!--boardListContentsIndex end-->
    <div class="communityWrite"><a href=""><i class="fas fa-pen-square"></i><span class="screen_out">글쓰기</span></a></div>
    <div class="indexNum">
        <select>
            <option value="<%=numPage%>">목록 갯수</option>
            <option value="<%=numPage%>">20</option>
            <option value="<%=numPage+=10%>">30</option>
            <option value="<%=numPage+=20%>">40</option>
            <option value="<%=numPage+=30%>">50</option>
        </select>
    </div>
</div><!--boardListContents end-->

<div class="allBoardList">
    <ul>
		<%for(Text text: list){ %>
		    <li>
		        <div class="allBoardListNo"><span><%=text.getTextNo() %></span></div>
		        <div class="allBoardListName"><a href=""><%=text.getTextTitle() %></a></div>
		        <div class="allBoardListLevel"><span>12</span></div>
		        <div class="allBoardListWriter"><a href=""><%=text.getNickKo()%></a></div>
		        <div class="allBoardListUploadDate"><%=text.getTextReg()%></div>
		        <div class="allBoardListViewCount"><%=text.getTextHit()%></div>
		        <div class="allBoardListLikeCount"><%=text.getLikeNum()%></div>
		    </li>
		<%} %>
    </ul>
</div><!--allBoardList end-->

<div class="bottom">
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
            </fieldset><!--fieldset end-->
        </form><!-- form end-->
    </div><!--searchBoard end-->

    <div class="myPost"><button>내가 쓴 글</button></div>
</div><!--bottom end-->

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>
    var tmp = _.template($("#allBoardListTmp").html());
    var num = $(".indexNum option").val();
    var count = 0;

    $(".indexNum select").on("change", function () {
        console.log($(this).val());
        var num = $(this).val();
        $(".allBoardList ul").children("li").remove();
        count = 0;
        for(var i = 0; i<Number(num); i++){
            $(".allBoardList ul").append(tmp());
            count++;
            console.log(count);
        }
    });
    /*페이지네이션 적용일 경우....는?*/

    $("#communityTap div").on("click",function () {
        var idx = $(this).index();
        $(".on").removeClass("on");
        $(".tab").eq(idx).addClass("on");
        $(this).addClass("on");
    });
</script>
</body>
</html>