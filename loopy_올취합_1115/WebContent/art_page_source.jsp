<%@page import="org.bjd.loopy.util.PaginateUtil"%>
<%@page import="org.bjd.loopy.vo.PageVO"%>
<%@page import="org.bjd.loopy.vo.Source"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.dao.SourcesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    

    
    
    String pageStr = request.getParameter("page");
	int pageNo = 1;
	int numPage = 28;

	if(pageStr!=null) {
	
		try {
			pageNo = Integer.valueOf(pageStr);
		}catch(Exception e) {
			System.out.println("숫자아님");			
		}//try~catch end
		
	}//if end
	

	
	PageVO pageVO = new PageVO(pageNo,numPage);
	
	List<Source> list = SourcesDAO.selectList(pageVO);

	int total = SourcesDAO.selectTotal();	
				
	int numBlock = 5;
				
	String url = "/art_page_source.jsp";
	String param = "page=";				
				
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);				
				
    
    
    
    
    
    
    
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="styleSheet" href="/css/art.css"/>
    <link rel="styleSheet" href="/css/paginate.css"/>
    
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <style>
    
 
        
        .allList li{
            float: left;
            position: relative;
            margin-right: 37.5px;
           
        }

       	 #sourceWrap{
            position: relative;
            width: 1200px;
            min-height: 220px;
            margin: auto;
        }
        .sourceWrap{
            position: relative;
            width: 1200px;
            margin: auto;
            overflow:hidden;
            margin-bottom: 20px;
        }

        .sourceCover li{
            width: 140px;
            height: 140px;
            float: left;
            margin-right: 36.6px;
        }
        .sourceCover li>img{
            border-radius: 100px;
        }




        .sourceContents li{
            position: relative;
            width: 140px;
            height: 60px;
            float: left;
            margin-right: 36.6px;
        }


        .sourceContents li>a{
            display: block;
            font-size: 14px;
            font-weight: bold;

        }


        .sourceTitle{
          /*transform: translateX();*/
            margin-top: 5px;
            margin-left: 5px;

        }
        .sourceArtist{
            margin-top: 5px;
            margin-left: 5px;


        }
        .sourceTime{
            font-size: 11px;
            transform: translate(5px, 10px);

        }
        .sourceNum{
            font-size: 11px;
            transform: translate(-5px, -5px);
            text-align: right;


        }
        .sourceDate{
            font-size: 11px;
            transform: translate(5px, 5px);




        }


        #upload{
            position: absolute;
            width: 120px;
            height: 35px;
            font-size: 16px;
            font-weight: bold;
            background-color: #311b92;
            top:-120px;
            left: 55px;
            border-radius: 5px;
            cursor: pointer;
            outline: none;

        }
        .total{
            width: 140px;
            height: 220px;
            float: left;
            padding: 20px 15px;
            position: relative;

        }


        #uploadPopup{
            width: 500px;
            height: 500px;
            background-color: #d9d9d9;
            overflow: hidden;
            position: absolute;
            z-index: 2;
            box-shadow: 2px 2px 20px #424242;
            top:50%;
            left: 50%;
            margin-top: -200px;
            margin-left: -250px;
            display: none;
        }


        .sourceName{
            width: 250px;
            height: 30px;
            margin: auto;
            display: block;
            border-radius: 5px;
            margin-top: 10px;


        }

        .recordBox{
            width: 100px;
            height: 100px;
            background-color:black;
            position: relative;
            top:20px;
            left: 100px;
            cursor: pointer;
            border-radius: 5px;
        }

        .mpBox{
            width: 100px;
            height: 100px;
            background-color: #d22e62;
            position: relative;
            top:-80px;
            left: 300px;
            cursor: pointer;

        }

        .mpBox img{
            border-radius: 5px;
        }

        .waveBox{
            width: 400px;
            height: 100px;
            background-color: #9d7a6d;
            margin: auto;
            margin-top: -40px;
            cursor: pointer;
            box-shadow: 2px 2px 10px black;

        }

        .uploadBox{
            width: 400px;
            height: 100px;
            margin: auto;
            margin-top: 20px;
            margin-left: 95px;



        }


        .uploadBox a{
            font-size: 16px;
            font-weight: bold;
            color: black;

        }

        .uploadSelect{
            width: 200px;
            height: 40px;
            border-radius: 5px;

        }


        .uploadBtn{
            margin: auto;
            width: 110px;
            height: 50px;
            display: block;
            border-radius: 5px;
            font-size: 17px;
            cursor: pointer;
        }



        #opacity{
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            z-index: 1;

        }
        .fas{
            transform: translate(8px,8px);
            color: black;
        }


        #out{
            position: absolute;
            top: 5px;
            right: 5px;
            width:30px;
            height: 30px;
            background-color: #383838;
            border-radius: 10px;
            cursor: pointer;
        }
        .fas.fa-times{
            font-size: 20px;
            line-height: 15px;
            margin-left: 1px;
        }
        .fa-dot-circle {
            position: absolute;
            color:#383838;
            font-size: 60px;
            margin-left: 20px;
            margin-top: 20px;
        }
        .color{
            color: red;
        }

        .playBox:hover{
            display: block;
        }


        .playBox{
            position: absolute;
            font-size: 80px;
            left: 30px;
            top:-110px;
            cursor:pointer;

        }

        .playBox>i{
            color:#311b92;
            opacity: 0.7;
        }

        .stopBox{
            position: absolute;
            font-size: 80px;
            left: 30px;
            top:-110px;
            cursor:pointer;
            display: none;

        }
/* 
        .plusBox {
            position: absolute;
            right:0;
            top:0;
            background: #9d7a6d;
            display: none;
            cursor: pointer;
            border-radius: 5px;
            width: 25px;
            height: 25px;

        }

        .plusBox i {
            position: absolute;
            top:-5px;
            left: -4px;
            font-size: 20px;


        }

        .total:hover .plusBox {
            display: block;
        }
        .fas.fa-search{
            transform: translate(0px,0px);
             color: white;

        } */
      


    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<% int type = 6; %>
<%@ include file="/WEB-INF/template/art_header.jsp" %>

 <!-- 소리소스 템플릿 스크립트-->


<!-- 소리소스 템플릿 스크립트 end--> 







<!--업로드 팝업-->
<div id="uploadPopup">
    <div id="out"><i class="fas fa-times"></i></div>
    <input type="text" placeholder="소리소스 명을 입력하세요" name="" class="sourceName"/>
    <div class="recordBox"><i class="far fa-dot-circle"></i></div>
    <div class="mpBox"><img src="img/file_music.png" width="100" height="100"/></div>
    <div class="waveBox"></div>
    <div class="uploadBox"><a>이 소리소스를 </a><select class="uploadSelect"><option class="uploadOption">그냥올리기</option></select>
            <!--<div class="addForder">-->
            <!--<i class="fas fa-plus"></i>-->
            <!--</div>-->
    </div><!--uploadBox end-->
    <a href=""><button class="uploadBtn">올리기</button></a>
</div><!--uploadPopup end-->
<!--업로드 팝업 end-->

<div id="opacity"></div><!-- 팝업시 배경 불투명-->




<!-- <div id="sourceWrap">
	<button id="upload">업로드</button>업로드 버튼end
	
    <div class="total">
        <button class="plusBox"><i class="fas fa-plus"></i></button>
        <div class="sourceCoverBox">
            <ul class="sourceCover">
                <li><img src ="img/car.jpg" width="140" height="140"/></li>
            </ul>
        </div>sourceCoverBox end
        <div class="sourceContentsBox">
            <ul class="sourceContents">
                <li>
                    <div class="playBox"><i class="far fa-play-circle"></i></div>
                    <div class="stopBox"><i class="far fa-stop-circle"></i></div>
                    <a class="sourceTitle">싫어요</a>
                    <a class="sourceArtist">기분이</a>
                    <a class="sourceTime">04:27</a>
                    <a class="sourceNum">3,333,333</a>
                    <a class="sourceDate">2010-10-10</a>
                </li>
            </ul>sourceContents end
        </div>sourceContentsBox end
    </div>total end
</div>sourceWrap -->
  



<!--소리소스 카드 전체 틀-->
 <div id="sourceWrap">
    <button id="upload">업로드</button><!--업로드 버튼end-->
    <div class="sourceWrap">
    <% for(Source source : list) { %>
    <div class="total">
        <div class="sourceCoverBox">
            <ul class="sourceCover">
                <li><img src ="img/default.jpg" width="140" height="140"/></li>
            </ul>
        </div><!--sourceCoverBox end-->
        <div class="sourceContentsBox">
            <ul class="sourceContents">
                <li>
                    <div class="playBox"><i class="far fa-play-circle"></i></div>
                    <div class="stopBox"><i class="far fa-stop-circle"></i></div>
                    <a class="sourceTitle"><%=source.getName()%></a>
                    <a class="sourceArtist"><%=source.getNickKo()%></a>
                    <a class="sourceTime">00:03</a>
                    <a class="sourceNum">123</a>
                    <a class="sourceDate"><%=source.getRegdate()%></a>
                </li>
            </ul><!--sourceContents end-->
        </div><!--sourceContentsBox end-->
    </div><!--total end-->
<%}%>
</div>
<%=paginate %>
</div><!-- sourceWrap -->
<!--소리소스 카드 전체 틀 end-->







<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@(.+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};


    //상단 탭 이동
    $("#tab>.tab").click(function () {
        


        $(".on").removeClass("on").before();
        $(this).addClass("on");

    });
    //상단 탭 이동 end


    //업로드 녹음버튼
    $(".recordBox").click(function () {

        $(".far.fa-dot-circle").toggleClass("color");

    });
    //업로드 녹음버튼 end



    //소리소스 추가 템플릿
   /*  var tmp = _.template($("#sourceListTmp").html());



    $.ajax({
        url: "ajax/sourceListForm.json",
        type: "get",
        dataType: "json",

        error:function () {


        },

        success:function (json) {

            $("#sourceWrap").append(tmp({sourceListForm:json}))

        }

    }); */
    //소리소스 추가 템플릿 end 





     //무한스크롤링
    $(window).scroll(function () {
        var sTop = $(this).scrollTop();

        console.log("스크롤탑:"+sTop);

        //브라우저의 높이
        var wTop = $(window).height();

        console.log("스크롤탑:"+sTop+"/브라우저높이:"+wTop);

        //문서의 높이
        var dTop = $(document).height();


        if((dTop-100)<=wTop+sTop) {

           

        }
        console.log("스크롤탑:"+sTop+"/브라우저높이:"+wTop+"/문서높이:"+dTop);

    });
    //무한스크롤링 end 



    //업로드 클릭시 곡 팝업창
    $("#upload").click(function () {

        $("#uploadPopup").show();
        $("#opacity").show();
    })

    $("#opacity").click(function () {

        $("#uploadPopup").hide();
        $("#addForderBox").hide();
        $("#opacity").hide();

    });
    //업로드 클릭시 곡 팝업창 end

    //업로드 팝업 창  x 버튼(나가기)
    $("#out").click(function () {
        $("#uploadPopup").hide();
        $("#addForderBox").hide();
        $("#opacity").hide();
    });
    //업로드 팝업 창  x 버튼(나가기)


    //소리소스 클릭시 재생 되고 중지되고
    $("#sourceWrap").on("click",".playBox",function () {
    //(부모)on .playBox 템플릿 전체를 감싸는 조상이기 때문에 부모를 sorceWrap으로 써야한다
        if($(this).children().hasClass("far fa-play-circle"))
        {
            $(this).children().attr("class","far fa-stop-circle").css("color","red");
        }
        else{
            $(this).children().attr("class","far fa-play-circle").css("color","#311b92");
        }
    });
    //소리소스 클릭시 재생 되고 중지되고 end


</script>
</body>
</html>