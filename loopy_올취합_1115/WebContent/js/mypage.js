	$('.backgroundPic').css("background-image","url("+backgroundImage+")");
			// <%-- 프로필 사진에 마우스오버 하면 구독,차단,이미지 편집 뜨는 기능 --%>
    $('.profilePic').on("mouseenter",function () {
        $(this).css({"cursor":"pointer"});
  //     <%--  // 다른 유저라면--%>
        $('<button class="profileBtn follow">구독</button>').prependTo(this);
        $('<button class="profileBtn block">차단</button>').prependTo(this);
  //      <%-- // 로그인이 되면--%>
        $('<div class="editImg"><i class="far fa-images"></i></div>').prependTo(this);
    });

// <%--    // 프로필 사진에 마우스떼면 구독,차단,이미지 편집 없어지는 기능--%>
    $('.profilePic').on("mouseleave",function () {
        $(".profilePic button").remove();
        $(".editImg").remove();
    });

//   <%--  // 메뉴를 클릭하면 on 클래스 붙였다가 떼기--%>
    $(".menuBar li").click(function (e) {
        $(".menuBar li").removeClass("on");
        $(this).addClass("on");
    });
//<%--    // 감정 ----------------------------------------%>
    $('.emoticons a').click(function (e) {
        e.preventDefault();
    });
        $('.emoticons li').click(function () {
            $(this).children().eq(0).clone().appendTo($(".emoPopUp"));
        $(".emoPopUp").css({"text-indent":"-9999px","overflow":"hidden"}).show();
        if($(this).text()=="angry"){
            $(".emoPopUp").css({"background-position":"-4px -122px"})
        }else if($(this).text()=="excited"){
            $(".emoPopUp").css({"background-position":"-62px -122px"})
        }else if($(this).text()=="happy"){
            $(".emoPopUp").css({"background-position":"-62px -3px"})
        }else if($(this).text()=="okay"){
            $(".emoPopUp").css({"background-position":"-4px -3px"})
        }else if($(this).text()=="sad"){
            $(".emoPopUp").css({"background-position":"-122px -63px"})
        }
        $(".emoticons").css({"display":"none",
        "transition":".8s"});
    });

    $('.emoPopUp').click(function (e) {
        e.preventDefault();
        $(this).css("background-color","transparent");
        $(this).children().eq(0).remove();
        $('.emoticons').css({"bottom":"50px",
        "transition":"1s"}).show(); // 문제
    });
//  <%--   // 감정 end ----------------------------------------%>
  $( window ).scroll( function() {
	if ( $( this ).scrollTop() > 200 ) {
		$( '.top' ).fadeIn();
	} else {
		$( '.top' ).fadeOut();
	}
} );
  
$( '.top' ).click( function() {
	$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	return false;
} );
//<%--    // 감정2 ----------------------------------------%>
$('.emoticons2 a').click(function (e) {
    e.preventDefault();
});
    $('.emoticons2 li').click(function () {
        $(this).children().eq(0).clone().appendTo($(".emoPopUp2"));
    $(".emoPopUp2").css({"text-indent":"-9999px","overflow":"hidden"}).show();
    if($(this).text()=="angry"){
        $(".emoPopUp2").css({"background-position":"-4px -122px"})
    }else if($(this).text()=="excited"){
        $(".emoPopUp2").css({"background-position":"-62px -122px"})
    }else if($(this).text()=="happy"){
        $(".emoPopUp2").css({"background-position":"-62px -3px"})
    }else if($(this).text()=="okay"){
        $(".emoPopUp2").css({"background-position":"-4px -3px"})
    }else if($(this).text()=="sad"){
        $(".emoPopUp2").css({"background-position":"-122px -63px"})
    }
    $(".emoticons2").css({"display":"none",
    "transition":".8s"});
});

$('.emoPopUp2').click(function (e) {
    e.preventDefault();
    $(this).css("background-color","transparent");
    $(this).children().eq(0).remove();
    $('.emoticons2').css({"bottom":"50px",
    "transition":"1s"}).show(); // 문제
});
//<%--   // 감정2 end ----------------------------------------%>