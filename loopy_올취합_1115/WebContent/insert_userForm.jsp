<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link rel="stylesheet" href="css/signUpForm.css" />
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<body>
<div id="header">
        <div class="headerIndex">
            <h1 class="logo"><a class="screen_out" href="index.jsp">Loopy</a></h1>
            <div class="songList">
                <a href="/art_page_artist.jsp">작품</a>
            </div><!--songList end-->
            <div class="looper">
                <a href="">루퍼</a>
            </div><!--looper end-->
            <div class="community">
                <a href="/community_allBoard_page01.jsp">커뮤니티</a>
            </div><!--community end-->
            <div class="ranking">
                <a href="/main_rank.jsp">랭킹</a>
            </div><!--ranking end-->
            <div class="betting">
                <a href="/betting.jsp">배팅</a>
            </div><!--betting end-->
            <div class="totalSearch">
                <form action="" method="get">
                    <input name="search"
                           value=""
                           placeholder="통합 검색"
                    />
                    <button type="submit">
                        <i class="fas fa-search"></i>
                        <span class="screen_out">검색</span>
                    </button>
                </form>
            </div><!--div end-->
        </div><!--.headerIndex end-->
    </div><!--header end-->
<div id="wrap">
    <h1>Loopy 계정 만들기</h1>
    <div class="innerWrap">
        <form action="/signUp.jsp" method="get" enctype="multipart/form-data">
            <!--회원 번호 받기-->
            <fieldset>
                <legend class="screen_out">회원가입 폼</legend>
                <div class="essential information">
                    *은 필수 입력사항 입니다
                </div><!--essential end-->

                <span class="essential txt">*</span>
                <input name="id"
                       id="id"
                       placeholder="아이디"
                       title="이메일 아이디 입력창"
                       size="20"
                       type="text"
                /><!--id end-->

                <span class="txt">@</span>
                <input name="address"
                       id="address"
                       title="이메일 주소 입력창"
                       size="20"
                       type="text"
                       value=""
                       placeholder=""
                /><!--address end-->

                <select name="emailAddress" id = "emailAddress">
                    <option value>직접입력</option>
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="google.com">google.com</option>
                    <option value="nate.com">nate.com</option>
                </select><!--emailAddress end-->

                <p class="valEmail validate txt">아이디 영문 4자이상, 숫자 사용 불가 </p><!--p end-->

                <div class="inputPwd">
                    <span class="essential txt">*</span>
                    <input name="password"
                                id="pw1"
                                type="password"
                                placeholder="비밀번호 입력"
                    />
                </div><!--inputPwd end-->
                <div class="inputPwd">
                    <span class="essential txt">*</span>
                        <input  id="pw2"
                                type="password"
                                placeholder="비밀번호 확인"
                    />
                    <span id="pwCheck"></span>
                </div><!--inputPwd end-->

                <p class="txt">
                    8 ~ 16자
                </p><!--p end-->

                <div class="nickname">
                    <span class="essential txt">*</span>
                    <input name="nickname1"
                           id="nickname1"
                           placeholder="한글 닉네임"
                           type="text"
                    />
                    <button id="nicknameButton1" type="button" class="nickCheck">중복확인</button>
                </div><!--nickname end-->

                <!--<p class="valnickname validate txt">사용가능한 닉네임입니다.</p>-->
                <div class="nickname">
                    <span class="essential txt">*</span>
                    <input name="nickname2"
                           id="nickname2"
                           placeholder="영어 닉네임"
                           type="text"
                    />
                    <button id="nicknameButton2" type="button" class="nickCheck">중복확인</button>
                </div><!--nickname end-->

                <p class="information nickInformation">영어/한글 닉네임을 설정하시면 더 많은 유저가 내 게시물을 기억할 수 있습니다.</p>
                <div class="optionBtn">
                    <button  type= "submit" class="signUp">회원가입</button>
                    <button class="cancel">취소</button>
                </div><!--optionBtn end-->
            </fieldset><!--fieldset end-->
        </form><!--form end-->
    </div><!--inner wrap end-->
</div><!--wrap end-->

<div class="signUpPopUp full">
    <div class="infoBox">
        <div class="infoBoxExit"><i class="fas fa-sign-out-alt"></i><span class="screen_out">나가기</span></div>
        <div class="txt">입력하신 이메일 주소로 인증 메일이 발송되었습니다.</div>
        <br/>
        <br/>
        <div class="txt">인증메일의 링크를 클릭하시면</div>
        <div class="txt">회원가입이 성공적으로 완료됩니다.</div>
        <br/>
        <br/>
        <a href="" class="userMail"></a>
    </div><!--//infoBox-->
</div><!--//popUp-->


<script src="js/jquery.js"></script>
<script>
    var $popUp = $(".signUpPopUp");
    var $id = $("#id");
    var $address = $("#address");
    var $nickname1 = $("#nickname1");
    var $nickname2 = $("#nickname2");
    
    var emailReg = /^[a-z|A-Z][\w]{3,19}\@[a-z|A-Z][\w]{3,10}\.[a-z|A-Z]{1,5}$/
    
    var nicknameReg1 = /^[ㄱ-힣|0-9]{1,10}$/;
    var nicknameReg2 = /^[a-z|A-Z|0-9]{1,10}$/;
    
    var isValidEmail=false;
    var isValidPassword=false;
    var isValidNickname1 = false;
    var isValidNickname2 = false;
    // 아이디에 포커스
    $id.focus();

    $id.blur(function () {
        if(!(isNaN($id.val())) || $id.val().length<4){
            // 오류 문자열을 idHelper의 text를 셋팅
            $(".valEmail").text("아이디 영문 4자이상, 숫자 사용 불가");
            //아이디에 포커스
            $id.focus();
        }else{
            //전부맞으면 오류문자열 초기화
            $(".valEmail").text('사용 가능한 아이디입니다');
            $address.focus();
        }
    });// blur function end
    
    
    function signUpEmail() {
        var email = $("#id").val();
        var address = $("#address").val();
        var emailAddress = $("#emailAddress").val();
        if(emailAddress != "" ){
            $("#address").attr("value", emailAddress).attr("placeholder", emailAddress);
            $(".infoBox a").text(email+"@"+address);
            $(".infoBox a").attr("href", "http://"+address);
        }else{
            $(".infoBox a").text(email+"@"+address);
            $(".infoBox a").attr("href", "http://"+address)
        }
    }//signUp Email() function end

    $("#emailAddress").change(signUpEmail);
    
    $("#emailAddress").change(function () {
        var val = $(this).val();
        $("#address").val(val);
    });/*값을 변경할 때 쓰는 것*/
    
    function checkEmail(){
    	var id = $id.val();
    	var address = $address.val();
    	var email = id + "@" + address;
    	
    	if(emailReg.test(email)){
    		isValidEmail = false;
    		
    		$.ajax({
    			url:"/ajax/checkEmail.jsp",
    			dataType:"json",
    			data:{"email":value},
    			error:function(){
    				alert("서버 점검 중!!");
    			},
    			success:function(json){
    				if(json.count==0){
    					isValidEmail=true;
    		    		$(".valEmail.text").text("사용가능한 이메일 입니다.").css("color","green");
    				}else{
    					isValidEmail=false;
    					$(".valEmail.text").text("이미 사용중이거나 탈퇴한 이메일입니다.").css("color","red");
    				}//if~else end
    				
    			}// succes end
    		}); //$.ajax() end
    	}else{
    		$(".valEmail.text").text("첫글자를 영어로, 영어,숫자 4~20글자로 입력해주세요.");
    	}//if~ else end
    }// checkEmail end
    
    
    

    $('#pw2').blur(function(){
        //첫번째 입력한 pw와 두번째 입력한 pw가 맞는지 비교
        if($('#pw1').val() != $('#pw2').val()){
            // 틀리다면 오류문자열 셋팅하고 pw1에 포커스
            $('#pwCheck').html("<i class=\"fas fa-times-circle\"></i>").css("color","red").css("font-size","20px");
            $('#pw1').focus();
            // 비밀번호가 8자 미만 16자 이상이면
        }else if($('#pw1').val().length < 8 || $('#pw1').val().length > 16){
            $('#pw1').focus();
            $('#pwCheck').html("<i class=\"fas fa-times-circle\"></i>").css("color","red").css("font-size","20px");  //요소는 html()에 넣어야 함
            //전부 통과하면
        }else{
            $("#pwCheck").html("<i class=\"fas fa-check-circle\"></i>").css("color","green").css("font-size","20px");
            isValidPassword=true;
            $('#nickname').focus();
        }
    });
    


    /*영어, 한글 식별이 안됨*/
    $("#nickname1").blur(function () {
        var st = $(this).val();
        var flag = /^[a-zA-Z0-9- ]*$/.test(st);
        if(flag ==false){
            $nickname2.focus();
            $nickname1.val(st);
        }else{
            $nickname1.focus();
            $nickname2.val(st);
        }
    });
    
	function checkNicknameKo(){
		var value1 = $nickname1.val();
		   if(nicknameReg1.test(value1)) {
			   //application/x-www-form-urlencoded
			   $.ajax({
				   url:"/ajax/checkNicknameKo.jsp",
				   dataType:"json",
				   data:{"nickname1":value1},
				   error:function() {
					   
					  alert("서버 점검중!");
					  
				   },
				   success:function(json) {
					   if(json.count==0) {
						   isValidNickname1 = true;
					   }else {
						   isValidNickname1 = false;
						   $(".information.nickInformation").text("한글 닉네임 중복").css("color","red");
					   }//if~else end
				   }//success end
			   });//$.ajax() end
		   }  // if end
	}// checkNicknameKo function end
	
	function checkNicknameEn(){
		var value2 = $nickname2.val();
		 if(nicknameReg2.test(value2)){
		   $.ajax({
			   url:"/ajax/checkNicknameEn.jsp",
			   dataType:"json",
			   data:{"nickname2":value2},
			   error:function() {
				  alert("서버 점검중!");
			   },
			   success:function(json) {
				   if(json.count==0) {
					   isValidNickname2 = true;
				   }else {
					   isValidNickname2 = false;
					   $(".information.nickInformation").text("영어 닉네임 중복").css("color","red");
				   }//if~else end
			   }//success end
		   });//$.ajax() end
		 }// if end
	}// checkNicknameEn function end
	
	$("#nicknameButton1").click(function(e) {
        e.preventDefault();
        checkNicknameKo();
	});
	
	$("#nicknameButton2").click(function(e){
        e.preventDefault();
        checkNicknameEn();
	});
	
	
	$("#innerWrap>form").submit(function(){
		checkEmail();
		if(!isValidEmail){
			return flase
		}
		
	});
	
/* 	$(".signUp").click(function (e) {
        e.preventDefault();
        signUpEmail();
        $popUp.show();
    });// click end

    $popUp.click(function () {
        $popUp.hide();
    });// click end

    $popUp.on("click", ".userMail", function () {
        //e.preventDefault();
        $popUp.hide();
    })// click end */
</script>
</body>
</html>