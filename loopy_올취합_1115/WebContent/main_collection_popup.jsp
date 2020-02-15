<%@page import="org.bjd.loopy.dao.BLKTagDAO"%>
<%@page import="org.bjd.loopy.vo.BLKTag"%>
<%@page import="org.bjd.loopy.vo.Tag"%>
<%@page import="org.bjd.loopy.dao.TagsDAO"%>
<%@page import="org.bjd.loopy.vo.Playlist"%>
<%@page import="java.util.List"%>
<%@page import="org.bjd.loopy.dao.PlaylistsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="css/loopy_reset.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <style>
        html {
            overflow-y: scroll;
        }
        body {
        	margin:0px;
        	padding:0px;
            font-family: 'Nanum Gothic', sans-serif;
        }

        #addWorkBoxPopup{
            position: fixed;
            top:50%;
            left: 50%;
            margin-left: -210px;
            margin-top: -210px;
            width: 450px;
            height: 500px;
            background-color: #bab9ba;
            overflow: hidden;
            z-index: 2;
            overflow-y: scroll;
        }
        .addBoxName{
            width: 420px;
            height: 30px;

        }

        .addBoxName span{
            padding: 0px 10px;
            line-height: 40px;
            font-weight: bold;
            color: black;
        }

        #addContents{
            margin: auto;
            width:400px;


        }
      
        
    

        .addCollectionBox {
            width: 100px;
            height: 100px;
            display: inline-block;
            transform: translate(15px,0px);



        }

        .far.fa-plus-square{
            font-size: 50px;
            cursor: pointer;
            color:black ;
            transform: translate(50px,50px);

        }

        .selectBox{
           width: 100px;
            height: 100px;
            border-radius: 5px;
            margin-top: 30px;
            margin-left: 23px;
            display: inline-block;
            cursor: pointer;
            vertical-align: middle;
            background-image:url("/img/forder.jpg");
            background-size: 100% 100%;

        }

        .selectBox span:nth-child(1){
            display: block;
            text-align: center;
            font-size: 14px;
            transform: translate(0px,105px);
            color: #311b92;
            font-weight: bold;

        }

        .selectBox span:nth-child(2){
            display: block;
             text-align: center;
             font-size: 14px;
             color: #311b92;
             font-weight: bold;
            transform: translate(0px,115px);
         }
         
         

        .outBtn{
            position: absolute;
            width:30px;
            height: 30px;
            background-color: #383838;
            border-radius: 5px;
            right: 5px;
            top:5px;
            cursor: pointer;
        }
        .outBtn i{
            font-size: 20px;
            color: black;
        }
        
        .outBtn1{
            position: absolute;
            width:30px;
            height: 30px;
            background-color: #383838;
            border-radius: 5px;
            right: 5px;
            top:5px;
            cursor: pointer;
        }
        .outBtn1 i{
            font-size: 20px;
            color: black;
        }
        .mainPopup{
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0, 0.7);
            z-index: 1;
        }


        /* 추가 팝업*/


        #makeWorkBoxPopup{
            position: absolute;
            width: 350px;
            min-height: 200px;
            background-color: #bab9ba;
            border-radius: 5px;
            top:50%;
            left: 50%;
            margin-left: -175px;
            margin-top: -130px;
            z-index: 2;
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
            display: none;
         	
		}

            

        }
        
        .checkBox{
            position: relative;
            width: 350px;
            height: 40px;
            line-height: 30px;

        }
        
        .titleBox{
            position: relative;
            width: 350px;
            height: 30px;
            line-height: 30px;


        }
        .tagSmallBox{
            position: relative;
            width: 350px;
            height: 30px;
            margin-top: 10px;
            line-height: 30px;

        }

        .newTitle{
            width: 320px;
            height: 20px;
            border-radius: 5px;
            display: block;
            margin:auto;
            outline: none;

        }


        .completeBtn{
            margin-left: 250px;
            margin-top: 50px;
            width: 80px;
            height: 30px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btnBox{
            width: 200px;
            min-height: 50px;
            margin-bottom: 10px;
            background-color: #bab9ba;

        }

        .newAlbum{

            color: black;
        }

        .newCollect{
            margin-left: 70px;
            color: black;
        }
        .checkBoxName{
            margin-left: 10px;
            color: black;
            font-weight: bold;
        }

        span{
            color: black;
            font-weight: bold;
        }


        #tagBox {
            width:1000px;
            min-height:30px;
            border:none;
            padding: 5px;

        }
        .tagBox {
            line-height:30px;
            background:transparent;
            float: left;
            margin-right:5px;
            padding:0 6px;
            border:1px solid #424242;
            border-radius:10px;
            margin-bottom:5px;

        }
        #tag{
        	display:none;
        }
     

        #tag span{
            color: #311b92;
            
        }

        .inputTag {
            width:100px;
            height:29px;
            border-radius:10px;
            line-height:30px;
            border:1px solid #424242;
            outline: none;
            padding-left:8px;
            display: inline-block;

        }

        .delete{
            background: transparent;
            border:0;
            outline: none;
            cursor:pointer;
            font-size: 14px;
        }

        .fas.fa-hashtag{
            color: #311b92;
        }
        .fa.fa-times{
            color: black;
        }

    </style>
</head>
<body>

<div class="mainPopup"></div><!--팝업 배경 불투명-->



    <!--앨범추가 팝업 -->
    
    
    <div id="addWorkBoxPopup">
    <div class="addBoxName"><span class="addCheckBoxName"><span>컬렉션</span><button class="outBtn"><i class="fas fa-times"></i></button></div>
             <ul id="addContents">
             <%-- 
            <%for(Playlist playlist : clist ) {
            
            BLKTag blkTag = new BLKTag(playlist.getNo(),"collection");
			List<String> blkTags = BLKTagDAO.selectList(blkTag);
   			 %>
               <li class="selectBox"><span><%=playlist.getName() %></span>
               <%for(String tag : blkTags ) {%>
            <span id="tag"><%=tag %></span>
            <% } %></li>
               <% } %>
                 --%>
          
           </ul> 
        <div class="addCollectionBox"><i class="far fa-plus-square"></i></div>
    </div><!--addWorkBoxPopupp end-->
  
    <!--앨범추가 팝업 -->
    
    
    





<!--앨범/컬렉션 만들기 팝업-->
<div id="makeWorkBoxPopup">
<form  method="get"  id="makeWorkBoxPopupForm"
             action="/ajax/insertPlayList2.jsp">
    <div class="checkBox"><span class="checkBoxName">새 컬렉션 만들기</span><button class="outBtn1" type="button"><i class="fas fa-times"></i></button></div>
    <div class="titleBox"><input type="text" placeholder="제목" class="newTitle" name="name"/></div>
    <div id="tagBox">
        <div class="tagSmallBox"><input type="text" class="inputTag" placeholder="태그입력" name="tag"/></div>
    </div>
    <div class="btnBox"><button class="completeBtn">완료</button></div>
    </form>
</div><!--makeWorkBoxPopup end-->
<!--앨범/컬렉션 만들기 팝업 end-->


<!--태그 요소-->
<script type="text/template" id="tagTmp">
    <div class="tagBox">
        <input type="hidden" name="tag" value="<@=value@>">
        <span><i class="fas fa-hashtag"></i><@=value@></span>
        <button class="delete"><i class="fa fa-times"></i></button>
    </div>
</script>
<!--태그 요소 end-->


<!--collectionTmp 요소 end-->
<script type="text/template" id="collectionTmp">
    <@_.each(collections, function (collection){ @>
		<li class="selectBox">
  		<div><span><@=collection.name @></span></div>
	    </li>
	<@ }) @>
</script>
<!--collectionTmp 요소 end-->



<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};



$(".addCollectionBox").click(function () {

    $(".titleBox input").val("");
    $(".tagSmallBox input").val("");
    $(".tagBox").remove();
    $("#makeWorkBoxPopup").show();

});

/* 
var count=0;

$(".completeBtn").click(function (e) {
    e.preventDefault();


    if($(".titleBox input").val()==""){
        alert("제목을 입력해주세요");
        return false;
    }

    var txt= $(".titleBox input").val().substring(0,6);
    var tag=$(".tagBox span").text();

    count++;


    // var $li=$("<li>").attr('id',count).addClass('selectBox').append('<span></span><span></span>');

    var $li = $("<li class='selectBox' id="+count+"><span></span><span></span></li>");
    $li.appendTo("#addContents");


    if(txt.substring(5)){

        $(".selectBox#"+count+" span:nth-child(1)").text(txt+"...");

    }else {

        $(".selectBox#"+count+" span:nth-child(1)").text(txt);

    }



    $(".selectBox#"+count+" span:nth-child(2)").text(tag).hide();

    $("#makeWorkBoxPopup").hide();


});

 */







		//팝업창 나가기 버튼
		$(".outBtn").click(function () {
		
		    $("#addWorkBoxPopup").hide();
		    $("#makeWorkBoxPopup").hide();
		    location.href="/art_page_artist.jsp";
		
		});
		
		$(".outBtn1").click(function () {
		
		    $("#makeWorkBoxPopup").hide();
		
		});
		//팝업창 나가기 버튼 end



        //팝업 배경 클릭시 나가기
        $(".mainPopup").click(function () {

            $(".mainPopup").hide();
            $("#addWorkBoxPopup").hide();
            $("#makeWorkBoxPopup").hide();
            
            location.href="/art_page_artist.jsp";

        })
        //팝업 배경 클릭시 나가기 end
        
        
        
        
        //태그 자바 스크립트
        var tagTmp = _.template($("#tagTmp").html());
        var $inputTag = $(".inputTag");
        var collectionTmp = _.template($("#collectionTmp").html());

        $inputTag.focus();

        $(".inputTag").keydown(function (e) {
            //console.log(e.keyCode==13);

            //console.log(e.keyCode);
            //e.keyCode==13 ||
            if(e.keyCode==13 || e.keyCode==32) {
                
                //alert("ddd");
                var $this = $(this);
                var val = $this.val();
                $this.before(tagTmp({value:val}));
                $this.val("");
            }else{

              
            }


        });
        //태그 자바 스크립트


        //태그 삭제 기능
        $("#tagBox").on("click",".delete",function () {
            $(this).parents(".tagBox").remove();
        });
        //태그 삭제 기능 end
        
        
        
        
        function getCollectionList() {
        	
        	$.ajax({
        		url:"/ajax/getPlayList.jsp",
        		dataType:"json",
        		type:"get",
        		data:{acType:"collection",userNo:1},//나중에 표현식으로(loginUser의 번호)
        		error:function() {
        			alert("에러");
        		},
        		success:function(json) {
        			$("#addContents").html(collectionTmp({collections:json}));
        		}
        	})
			
		}// end
		
		getCollectionList();
		
		
		
		
		 function insertCollection() {
		       
	      		var title = $(".newTitle").val();
	        	//var	tag = $(".tagbox span").text();
	        	//여러 태그를 받을 배열
	        	
	        	var tags = [];
	       		//태그들의 부모 .tagSmallBox에 있는 input을 모두 선택해서(input은 태그값을 갖고있는 hidden input들이 유일함)
	        	$(".tagBox input").each(function() {
	        		//각 input의 value속성값을 tags배열에 넣어라(push)
	        		tags.push($(this).val().trim());
	        	});
	   		  
			   //application/x-www-form-urlencoded
			   
			   jQuery.ajaxSettings.traditional = true;
			   
			   $.ajax({
				   url:"/ajax/insertPlayList2.jsp",
				   dataType:"json",
				   type: "get",
				   data:{name:title,
					   type:"collection",
						 tag:tags
				   },
				   error:function() {
					  alert("서버 점검중!");
				   },
				   success:function(json) {
					   
					if(json.result) {
					   	 getCollectionList();
					   	 
					   	 $("#makeWorkBoxPopup").hide();
					   	 
					   }else {
						   alert("다시 시도해주세요~");
					   }//if~else end 
				   }//success end
			   });//$.ajax() end
		
	}//insertAlbum() end
	
	
	
	$("#makeWorkBoxPopupForm").submit(function(e) {
		insertCollection();
		/* checkPwd();
		checkBirthDate();
		checkProfile(); */
		//alert("zzzz");
		 return false; 
		
	});//submit() end
	        
        
    </script>

</body>
</html>