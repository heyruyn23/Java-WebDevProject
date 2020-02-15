<%@page import="org.bjd.ggs.vo.Item"%>
<%@page import="org.bjd.ggs.vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	PageVO nosVO = new PageVO();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PickMe | GiftGuideService</title>
<%@ include file="/WEB-INF/template/link.jsp"%>
<link rel="stylesheet" href="css/pickme.css" />
<link rel="stylesheet" href="css/headerFooter.css" />
<style>
#allIndexHeader{
z-index:90000;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/template/header.jsp"%>
	<!-- -->
	<div id="content">
		<div class="choose">
			<ul id="cardList">

			</ul>
		</div>
		<div id="underBar">
			<div id="countItems">${count}</div>
			<div id="progressBar"></div>	
			<div id="barValue"></div>
			<!--  <button id="cardsSubmit">제출</button> -->
		</div>
	</div>
	<!-- -->
	<footer>
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</footer>

	<script src="/js/underscore-min.js"></script>
	<script type="text/template" id="cardTmp">
	<@_.each(items,function(item){ @> 
        <li class="choose_card" data-itemNo="<@=item.no@>" title="<@=item.name@>">
			<img src="/items/<@=item.image@>" style="width:218px; height:318px;">
            <div class="card_overlay">
                <div class="card_evaluate">
                    <div class="good">
                        <i class="far fa-smile"></i>
                    </div>
                    <div class="bad">
                        <i class="far fa-angry"></i>
                    </div>
                </div>
            </div>
        </li>
	<@})@>
	</script>
	<script src="/js/jquery.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script>
	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};
    /*아이탬 ajax*/
    var itemPage = 1;
    
	   var cardTmp = _.template($("#cardTmp").html());
			function getContents() {
				$.ajax({
					url:"/ajax/getItems",
					type:"get",
					dataType:"json",
					error:function(xhr,error,code){
						alert(error+code);
					},
					success:function(data){
						console.log(data);
						//확인용 
						//console.log(contentsTmp(data));
						//여기다가 붙여준다 템플릿을s
						$("#cardList").append(cardTmp({items:data}));
					}
				});
				//ajax end
				
			}//getContents() end

    /////////////////////////////////////
    var start = 0;
    var cnt = $("#countItems").text();
    var card = $("#cardTmp").html();
    var $cardList = $("#cardList");
    var items =[  
    	/*
    	{name:"커피머신"},{name:"청소기"},{name:"공기청정기"},{name:"냉난방기"},{name:"가습기"},
        {name:"헤어기기"},{name:"디카 / 캠코더"},{name:"프로젝터"},{name:"헤드폰 / 이어폰"},{name:"노트북"},
        {name:"PC"},{name:"휴대폰"},{name:"태블릿PC"},{name:"스마트워치"},{name:"스마트폰 악세사리"},
        {name:"아웃도어 용품"},{name:"스포츠"},{name:"가구 / 침구"},{name:"건강식품"},{name:"간편식품"},
        {name:"식품선물세트"},{name:"유아용품"},{name:"생활용품"},{name:"주방용품"},
        {name:"악기"},{name:"반려동물용품"},{name:"건강기기(안마의자)"},{name:"가방"},{name:"지갑"},
        {name:"손목시계"},{name:"쥬얼리"},{name:"신발"},{name:"선글라스 / 안경"},{name:"패션 잡화 / 소품"},
        {name:"의류"},{name:"언더웨어"},{name:"화장품(메이크업)"},{name:"스킨케어"},{name:"향수"},
        {name:"만년필"},{name:"다이어리"},{name:"게임기기"},{name:"드론"},{name:"취미용품(프라모델, 피규어)"},
        {name:"책"},{name:"꽃"},{name:"편지"},{name:"여행(티켓, 항공권, 호텔"},{name:"기프티콘"},{name:"문화티켓(공연, 영화)"}
   		*/
    ];//51개의 items
  
	var randomList = items;	
    function shuffle(){
        for(var i=items.length-1;i>0;i--){
            var j = Math.floor(Math.random()*(i+1));
            var temp = randomList[i];
            randomList[i] = randomList[j];
            randomList[j] = temp
        }
    }//shuffle() end랜덤하게 배치하기위해
    function createCard(){
        for(var i=0; i<6 ; i++){
            console.log(start);
                $("#cardList").append(card);
                start++;
        }
    };//createCard end()
    function injectNm(){
        for(var i=0;i<randomList.length;i++){
            console.log(randomList[i]);
        }
    };
    function progressBarUpdate(){
        var width = (cnt%10)*100;
        console.log(width);
        $("#barValue").css("width",width+"px");
    }
    shuffle();
    injectNm();
	//getContents(0);
    // var cardTmp = _.template(card,item);
    // console.log(cardTmp);
    $(function(){
        $(window).scroll(function(){
            var $window = $(this);
            let scrollTop = $window.scrollTop();
            let windowHeight = $window.height();
            let documentHeight = $(document).height();
            console.log("documentHeight:" + documentHeight + " | scrollTop:" +
                scrollTop + " | windowHeight: " + windowHeight );
            console.log(scrollTop/300);
            console.log(itemPage);
            if( (scrollTop/300) >= itemPage) {
                          //createCard();
                          console.log(scrollTop/300);
                          console.log(itemPage);
                          itemPage++;
                          getContents();     
            }
            /*
            if (scrollTop > (documentHeight-windowHeight-68)) {
                //footer의 높이만큼 bottom 을준다
                // console.log(scrollTop-2300);
                //값은  scrollTop - footer size
                $("#underBar").css("bottom", scrollTop - (documentHeight-windowHeight-68));
            } else {
                $("#underBar").css("bottom", 0);
            }
           	*/
        });
    });//무한스크롤링 end
    //마우스 오버시
    getContents(); 
    getContents(); 
    getContents();
    progressBarUpdate();
    var flag = true;
    $cardList.on("mouseenter",".choose_card",function () {
        $(this).children().css("display", "block");
        flag = true;
    });
    $cardList.on("mouseleave", ".choose_card", function () {
        if(!$(this).children().hasClass("chose")) {
            $(this).children("div").css("display", "none");
        };
    });
    // $cardList.on("click", ".choose_card", function () {
    //     if($(this).children().hasClass("chose")){
    //         $(this).children().toggleClass("chose");
    //         cnt--;
    //     }else{
    //         $(this).children().toggleClass("chose");
    //         cnt++
    //     };
    //
    // });
    var itemNo = 0;
    
    $cardList.on("click",".card_evaluate div",function () {
    if(${loginMember!=null}){
       console.log($(this).parent().children(".on"));
       if($(this).parent().children(".on").length == 1){
           if($(this).hasClass("on")){
               $(this).toggleClass("on");
               if($(this).parent().parent().hasClass("chose")){
                   $(this).parent().parent().toggleClass("chose");
                  // console.log($(this).parent().parent().parent().attr("data-itemno"));
                 //  alert($(this).parent().parent().parent().data("itemno"));
                   
                   var itemNo = $(this).parent().parent().parent().data("itemno");
                   var rank = 0;
                   if($(this).hasClass("bad")){rank = -1;}
                   if($(this).hasClass("good")){rank = 1;}
                   $.ajax({
    				   url:"/ajax/pickmeItem/"+itemNo,
    				   type:"DELETE",
    				   dataType:"json",
    				   error:function(xhr,error,code){
    						alert(error+code);
    				   },
    				   success:function(json) {
    						//alert("good");
    				   }//success end
    				});//$.ajax() end
                   cnt--;
               }else{
                   $(this).parent().parent().toggleClass("chose");
                   //console.log($(this).parent().parent().parent().attr("data-itemno"));
                   //alert($(this).parent().parent().parent().data("itemno"));
                   var itemNo = $(this).parent().parent().parent().data("itemno");
                   var rank = 0;
                   if($(this).hasClass("bad")){rank = -1;}
                   if($(this).hasClass("good")){rank = 1;}
                   $.ajax({
                	   url:"/ajax/pickmeItem/"+itemNo,
    				   type:"POST",
    				   dataType:"json",
    				   data:{"rank":rank},
    				   error:function(xhr,error,code){
    						alert(error+code);
    				   },
    				   success:function(json) {
    						//alert("good");
    				   }//success end
    				});//$.ajax() end
                   cnt++
               };
               $("#countItems").text(cnt);
               progressBarUpdate();
           }else{
               $(this).parent().children().removeClass("on");
               $(this).toggleClass("on");
               if($(this).parent().parent().hasClass("chose")) {
                   $(this).parent().parent().parent().children().removeClass("chose");
                   $(this).parent().parent().toggleClass("chose");
                   //console.log($(this).parent().parent().parent().attr("data-itemno"));
                   //alert($(this).parent().parent().parent().data("itemno"));
                   var itemNo = $(this).parent().parent().parent().data("itemno");
                   var rank = 0;
                   if($(this).hasClass("bad")){rank = -1;}
                   if($(this).hasClass("good")){rank = 1;}
                   $.ajax({
                	   url:"/ajax/pickmeItem/"+itemNo+"/rank/"+rank,
    				   type:"PUT",
    				   dataType:"json",
    				   error:function(xhr,error,code){
    						alert(error+code);
    				   },
    				   success:function(json) {
    						//alert("good");
    				   }//success end
    				});//$.ajax() end
               };
               $("#countItems").text(cnt);
               progressBarUpdate();
           }
       }else{
           $(this).toggleClass("on");
           if($(this).parent().parent().hasClass("chose")){
               $(this).parent().parent().toggleClass("chose");
               //console.log($(this).parent().parent().parent().attr("data-itemno"));
               //alert($(this).parent().parent().parent().data("itemno"));
               var itemNo = $(this).parent().parent().parent().data("itemno");
               var rank = 0;
               if($(this).hasClass("bad")){rank = -1;}
               if($(this).hasClass("good")){rank = 1;}
               $.ajax({
				   url:"/ajax/pickmeItem/"+itemNo,
				   type:"DELETE",
				   dataType:"json",
				   error:function(xhr,error,code){
						alert(error+code);
				   },
				   success:function(json) {
						//alert("good");
				   }//success end
				});//$.ajax() end
               cnt--;
           }else{
               $(this).parent().parent().toggleClass("chose");
               //console.log($(this).parent().parent().parent().attr("data-itemno"));
               //alert($(this).parent().parent().parent().data("itemno"));
               var itemNo = $(this).parent().parent().parent().data("itemno");
               var rank = 0;
               if($(this).hasClass("bad")){rank = -1;}
               if($(this).hasClass("good")){rank = 1;}
               $.ajax({
            	   url:"/ajax/pickmeItem/"+itemNo,
				   type:"POST",
				   dataType:"json",
				   data:{"rank":rank},
				   error:function(xhr,error,code){
						//alert(error+code);왜 에러코드 뜨는지 모르겠음...
				   },
				   success:function(json) {
						//alert("good");
				   }//success end
				});//$.ajax() end
               cnt++
           };
           $("#countItems").text(cnt);
           progressBarUpdate();
       }
    }else{alert("로그인을 해주세요!")};
    }); //카드 눌릴때 함수
    // header scroll
    var $window = $(window);
    $("#allIndexHeader").css("background-color","#f0f0f0");
    $window.scroll(function () {
        var sTop = $window.scrollTop();//스크롤높이
        console.log("top: "+sTop);
        if(sTop>0) {
// 골드, 핑크골드
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(183,110,121,0.6))");
// 골드, 실버
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(192,192,192,0.6))");
//            $("#allIndexHeader").css("background-color","#f0f0f0");
// 골드
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(212,175,55,0.9))");
        }else {
//            $("#allIndexHeader").css("background","transparent")
        }//if~else end
    });//scroll() end
    // header scroll end
</script>
</body>
</html>