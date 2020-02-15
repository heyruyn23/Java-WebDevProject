<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="fsvs" lang="en">
<head>
    <meta charset="UTF-8">
    <title>GiftGram | GiftGuideService</title>
</head>
<%@ include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="css/GiftGram.css">
<body>
<style>

</style>

<%@ include file="/WEB-INF/template/header.jsp" %>

<div id="popWrap"></div>
<div id="banner">
</div>
<main>

    <div id="writePop">
        <i class="close far fa-times-circle"></i>
        <form action="/wirte/giftGram" method="POST">
            <ul id="imgBox">
                <label for="inputImg">
                    <li id="mainImg">
                        <input type="file" name="img" id="inputImg" hidden>
                        <div id="imgInput"><i class="fas fa-plus-circle"></i></div>
                    </li>

                </label>
            </ul>
            <ul id="textBox">
				<form action="/wirte/giftGram" method="POST">
                <li class="line">Image</li>

                <div id="sub_img">
                  
                </div>
                <li class="line"></li>

                <li class="line"><span class="write_title">내 용</span></li>
                <li>
                    <input name="content" id="writeTitle" placeholder="입력 필수!(최대 60자 입니다.)" autocomplete="off">

                </li>
                <li class="write_setting input_btn" >
                    <button class="btn_next btn_setting">등 록</button>
                </li>
                </form>
            </ul>
        </form>
    </div>


    <div id="banner ">

    </div>
    <div id="content1">
        <div id="bestGift">
            <h2 id="bestFont">Best Gift</h2>
            <ul id="bestList">
            <c:forEach items="${bestlist}" var="best" begin="0" end="2">
            <a href="giftgram/${best.memberNo }/${best.no }">
                <li class="best_card_setting">
                    <img class="gift_img" src="/img/${best.image }" width="26%" height="30%">
                    <div class="card_title">
                        <span>${best.content }</span>
                    </div>
                </li>
             </a>
             </c:forEach>

            </ul>
            <button class="btn_setting best_btn"><i class="btn fas fa-chevron-up"></i></button>
        </div>

    </div>
    <div id="content2">

        <div id="giftSide">
            <ul id="giftList" >
        
            </ul>

        </div>
        <div id="writeBtn" class="btn_setting2">
            <i class="fas fa-pencil-alt"></i>
        </div>
        <div id="upBtn" class="btn_setting2">
            <i class="fas fa-arrow-alt-circle-up"></i>
        </div>
        <div id="giftFilter" title="필터" class="btn_setting2">
            <i class="fas fa-plus"></i>

        </div>
        <ul id="filterBox">
            <div id="filterAge" >
                <p class="filter_setting select_age">나 이<i class="fas fa-caret-down"></i></p>
                <li class="filter_list filter_age" value="10">10대</li>
                <li class="filter_list filter_age" value="20">20대</li>
                <li class="filter_list filter_age" value="30">30대</li>
                <li class="filter_list filter_age" value="40">40대</li>
                <li class="filter_list filter_age" value="50">50대</li>
                <li class="filter_list filter_age" value="60">60대이상</li>
            </div>
            <div id="filterGender" >
                <p class="filter_setting select_gender">성 별<i class="fas fa-caret-down"></i></p>
                <li class="filter_list filter_gender" value="F">여성</li>
                <li class="filter_list filter_gender" value="M">남성</li>
            </div>
            <p class="filter_setting select_reset">리 셋<i class="fas fa-caret-down"></i></p>
        </ul>
    </div>

</main>
<div class="aside">
    <img id="moreBtn" class="more_btn" src="/img/button.png" alt="더보기" title="더보기">
</div>
<%@ include file="/WEB-INF/template/footer.jsp" %>

</body>

<script type="text/template" id="giftTmp">
    <@_.each(gift,function(gift){@>
    <a href="giftgram/<@=gift.memberNo@>/<@=gift.no@>">
          <li class="gift_card_setting ">
                    <img class="gift_img"  src="img/<@=gift.image@>">
                    <div class="card_title">
                        <span><@=gift.content@></span>
                    </div>
          </li>
    </a>
    <@})@>
</script>

<script type="text/template" id="subImgTmp">
	<@_.each(json,function(src){@>
	<li class="sub_list">
		<i class="fas fa-times img_del"></i>
		<img class="subImg" src="img<@=src@>"/> 
		<input type="hidden" name="image" value="<@=src@>"/> 
	</li>
	<@})@>
</script>

<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.js"></script>
<script>
    var filter_gender;
    var filter_age;
    var age = null; 
    var endage = "null";
    var sex = null;
	var num = 10;
	var oldImg = null;
	var imgtest =0;
	var $checkImg = $("#inputImg");
	var contentval = false;
	
	var imgReg = /^image/; // 이미지 파일 형식 확인
	var contentcheck = /^[a-z|A-Z|ㄱ-힣|0-9|!?()+-.,;]{1,60}$/
	
	
	
	
	
	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};


    var tmp = _.template($("#giftTmp").html());
    var imgTmp = _.template($("#subImgTmp").html());
    
    function checkImg() {

		//jquery객체에서 순수자바스크립트요소객체 얻기
		var checkImg = $checkImg.get(0);

		//input type=file요소(순수자바스크립트)는 무조건
		//files배열을 가지고 있습니다.

		//한 개의 파일
		var file1 = checkImg.files[0];

		//File 객체의 속성
		//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
		//- name : 파일명
		//- lastModified : 최종수정일
		//- size : 파일 크기

		if (file1 == null || file1.size <= 0 && !imgReg.test(file1.type)) {

			alert("제대로된 파일을 넣어주세요.");
			imgtest = 0;
			return;
		}//if end

		//이미지인지 확인!!
		if (!imgReg.test(file1.type)) {

			alert("이미지 파일을 선택해주세요.");
			imgtest = 0;
			return;
		}

		if (oldImg != file1.name) {

			oldImg = file1.name;

			//ajax로 넘길 폼을 생성하고
			var form = new FormData();

			//1)파라미터명, 2) 파일 3) 파일명
			form.append("uploadImg", file1, file1.name);

			//multipart/form-data로 ajax처리
			$.ajax({
				url : "/ajax/upload",
				dataType : "json",
				type : "POST",//multipart/form-data
				processData : false,//multipart/form-data
				contentType : false,//multipart/form-data
				data : form,
				error : function() {
					alert("사진 서버 점검중!");
				},
				success : function(json) {
					
		            $("#writePop").css("left","25%");
		            $("#textBox").show();
		        	
					console.log({json:json});
					$("#sub_img").prepend(imgTmp({json:json}));			
					$("#mainImg").css("background-image",'url(img'+json.src+')');
				}//success end 
				   
			});//ajax() end
		}//if end
		 $("#writePop").css("left","35%");
         $("#textBox").hide();
	}//checkProfile() end
	
	$checkImg.change(checkImg);
    
    console.log($checkImg.change(checkImg));
   	function List() {
   		$.ajax({
            url:"/ajax/gift",
            type:"get",
            data:{"num":num},
            dataType:"json",
            error: function () {
                alert("서버 점검중");
            },
           success:function (json) {
        	   $("#giftList").append(tmp({gift:json}));
            }
        });
       
	}; //List() end;
	List();
	
	//filter ajax function
	function Filter(){
		
		$("#giftList").empty();
		
		 $.ajax({
            url:"/ajax/gift/filter",
            type:"get",
            data:{"age":age,"sex":sex,"endage":endage},
            dataType:"json",
            error: function () {
                alert("서버 점검중");
            },
           success:function (json) {
               console.log(json); 
        	   $("#giftList").prepend(tmp({gift:json}));
            }
        });
	}// filter function end
	
     	$("#moreBtn").click(function() {
     	
			num+=10;
			List();
		})//moreBtn end();
  
        $(".select_reset").click(function () {
            $(".select_gender").text("성 별");
            $(".select_age").text("나 이");
            $(".filter_gender").hide();
            $(".filter_age").hide();
            age=null;
            endage =null;
            sex=null;
            
            console.log("1"+age+"2"+endage+"3"+sex);
            
            $("#giftList").empty();
            num = 10;
			List();
        })

        $("#moreBtn").mouseenter(
            function () {
                var src = $(this).attr("src");
                $(this).attr("src", src.replace(/\.png$/i, ".gif"));

            });
        $("#moreBtn").mouseout(function () {
            var src = $(this).attr("src");
            $(this).attr("src", src.replace(/\.gif$/i, ".png"));

        });


    $(".best_btn").click(function () {

        $(".btn").toggleClass("fa-chevron-down fa-chevron-up");

        $("#bestList").slideToggle(400);
    });



    $(window).scroll(function () {
        var scrollValue = $(document).scrollTop();

        if(scrollValue >600){
            $("#upBtn").show();
        }
        else{
            $("#upBtn").hide();
        }
    });



    $("#upBtn").click(function () {
        $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
    })

    $("#giftFilter").click(function () {
        $("#filterBox").toggle();
    });
    $("#filterAge").click(function () {
        $(".filter_age").toggle();
    });
    $("#filterGender").click(function () {
        $(".filter_gender").toggle();
    });


    $(".filter_age").click(function () {
        $(".select_age").text($(this).text());
       	age = ($(this).val());
       	endage = (age +10);
       	console.log("age_filter");
       	Filter();

       
    })
    $(".filter_gender").click(function () {
        $(".select_gender").text($(this).text());
        sex=($(this).attr("value"));
        console.log("gender_filter ::"+sex);
        Filter();
        
    });
    $("#writeBtn").click(function () {
    	<c:choose>
    	<c:when test="${loginMember == null }">
    		alert("로그인이 필요합니다.");
    	</c:when>
    	<c:otherwise>  
    	$("#popWrap").show();
        $("#writePop").show();
    	</c:otherwise>
    	</c:choose>
    
    });
    $(".close").click(function () {
        $("#popWrap").hide();
        $("#writePop").hide();
        $("#inputImg").val("");
        $("#writeTitle").val("");
    })
    
    var background;
    
    $("#sub_img").on("click",".sub_list",function(){
    	background = null;
    	background = ($(this).children("img").attr("src"));
    	
    	$("#mainImg").css("background-image",'url('+background+')');
    });
    
    $("body").on("click",".img_del",function(){
    	
    	$(this).parent().remove();
    });
    
    $("#writeTitle").keyup(function () {
		if( contentcheck.test($(this).val()))
			{
				$(".btn_next").show();
			}
		else{
			$(".btn_next").hide();
		}
	})
    
</script>
</html>