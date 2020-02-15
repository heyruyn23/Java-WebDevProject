<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>이벤트 상세보기 | GiftGuideService</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/event.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/viewContent.css"/>
    <style>
    #replyBox .reply_content{
    	width: 1060px;
    }
    
    .event_contents #communityBoardReply{
    	width: 1060px;
    	min-height:900px;
    }
    
    #communityBoardReply .paginate{
    	right: 0;
    }
    </style>
</head>
<body>


<%@ include file="/WEB-INF/template/header.jsp" %>

<div class="event_contents">
    <div class="event_detailContent_box">
        <div class="event_detailContent_shareWrap">
            <button type="button" class="event_btn_share" data-control="shareSNS" data-open-text="SNS 공유하기 닫기" data-close-text="SNS 공유하기 열기"><span class="haze"></span></button>
            <div class="event_sns_share">
                <ul>
                    <li><a href="javascript:facebook_sharer();" title="새 창" class="facebook"><span class="haze">페이스북</span></a></li>
                    <li><a href="javascript:kakaostory_sharer();" title="새 창" class="kakaostory"><span class="haze">카카오스토리</span></a></li>
                    <li><a href="javascript:kakaotalk_sharer();" title="새 창" class="kakao"><span class="haze">카카오톡</span></a></li>
                    <li><a href="javascript:band_sharer();" title="새 창" class="band"><span class="haze">밴드</span></a></li>
                    <li><a href="javascript:copyUrl();" title="새 창" class="url" ><span class="haze">url 복사</span></a></li>
                </ul>
                <span class="ico"></span>
            </div><!--event_sns_share end-->
        </div><!--event_detailContent_shareWrap end-->

        <div class="event_detailContents_detail">
        	<img class="event_detailContents_img" src="/eventImg/${event.content}" alt="" width="1060" height="750"/>
        </div><!--.event_detailContents_detail end-->

        <div class="event_btn_place">
            <a href="/eventMain" class="event_btn_goBackList">
            목록
            </a><!--.event_btn_goBackList end-->
            <c:if test="${loginMember!=null }">
            <a href="#" class="event_btn_survey">
                이벤트 설문 참여
            </a><!--.event_btn_survey end-->
            </c:if>
        </div><!--.event_btn_place end-->
<!-- 댓글 -->
         <div id="communityBoardReply">
            <div id="replyBox">
                <span>댓글 </span>
                <span style="color:#F6890A ;">${commentNum}</span>
                <ul>
                	<c:forEach items="${content}" var="con">
	                    <li>
	                        <span class="reply_id">${con.email }</span>
	                        <span class="reply_regDate">${con.regDate }</span>
	                        <button class="siren_btn">신고하기</button>
	                        <div class="reply_content">
	                            ${con.content }
	                        </div>
	                    </li>
                    </c:forEach>
                </ul>
                
                ${paginate }
                
                <div id="replyInput">
                    <form action="/commentE" method="POST">
                    <textarea id="replyInputBox" <c:if test="${loginMember==null }">placeholder="로그인 후 이용해 주세요"</c:if>
                              maxlength="200" name="content"></textarea>
                        <span id="replyRule">주제와 무관한 댓글과 욕설 또는 특정 대상을 비방하는 악플은 삭제될 수 있습니다. </span>
                        <input type="hidden" name="postNum" value="${no}"/>
                        <input type="hidden" name="memberNo" value="${loginMember.no}"/>
                        <c:if test="${loginMember!=null }">
                        <button type="submit"  id="replyInputBtn">등록하기</button>
                        </c:if>
                    </form>
                </div><!--replyInput end-->
            </div><!--replyBox end-->
        </div><!--communityBoardReply end-->
    </div><!--event_detailContent_box end-->
<!-- 댓글 -->

<!--popup01 -->
    <div class="event_popup_box">
        <div class="event_popupExit_box">
            <button type="button"><i class="fas fa-times-circle"><span class="screen_out">취소</span></i></button>
        </div><!--event_popupExit_box end-->
        
        <form  action="/research" method="post">
            <fieldset>
                <legend class="screen_out">이벤트 설문</legend>
                <input type="hidden" name="memberNo" value="${loginMember.no }"/>
                <input type="hidden" name="eventNo" value="${no}"/>
                <div class="event_select_popup">
                    <span>관계: </span>
                    <select name = "target" class="event_select_relation">
                        <option value="부모님">부모님</option>
                        <option value="형제자매">형제자매</option>
                        <option value="친구">친구</option>
                        <option value="직장동료">직장동료</option>
                        <option value="그외">그외</option>
                    </select><!--.event_select_relation end-->
                </div><!--event_select_popup end-->

                <div class="event_addBtn_category event_categoryBtn_category">
                    <button type="button" class="event_btn_category">선물 카테고리 추가</button>
                </div><!--.event_addBtn_category end-->

				<!-- 여기 1 -->
                <ul class="event_category_areaUl">
                    <li class="event_category_area categoryOne">
                        <div class="event_category_ContentWrap">
                            <span class="event_category_categoryImg"></span>
                            <div class="event_category_categoryName">비어 있음</div>
                            
                            <input type="hidden" name="rankFirst" value="">
                            <input type="hidden" name="categoryNoFirst" value="">
                             
                            
                        </div>
                    </li><!--event_category_area end-->
                    <li class="event_category_area categoryTwo">
                        <div class="event_category_ContentWrap">
                            <span class="event_category_categoryImg"></span>
                            <div class="event_category_categoryName">비어 있음</div>
                             
                            <input type="hidden" name="rankSecond" value="">
                            <input type="hidden" name="categoryNoSecond" value="">
                            
                        </div>
                    </li><!--event_category_area end-->
                    <li class="event_category_area categoryThree">
                        <div class="event_category_ContentWrap">
                            <span class="event_category_categoryImg"></span>
                            <div class="event_category_categoryName">비어 있음</div>
                             
                            <input type="hidden" name="rankThird" value="">
                            <input type="hidden" name="categoryNoThird" value="">
                            
                        </div>
                    </li><!--event_category_area end-->
                </ul>
                <div class="event_sendBtn_category event_categoryBtn_category">
                    <button type="submit" class="event_btn_category">보내기</button>
                </div><!--.event_sendBtn_category end-->
            </fieldset>
        </form>
        <!-- 여기 1 -->
    </div><!--.event_popup_box end-->
<!--popup01-->
<!--popup02-->
    <div class="event_popup_category">
        <div class="event_popupExit_boxTwo">
            <button type="button"><i class="fas fa-times-circle"><span class="screen_out">취소</span></i></button>
        </div><!--event_popupExit_box end-->

        <h2 class="event_popup_name">선물 카테고리</h2>
        <div class="event_popup_categoryList">
            <ul class="event_popup_categoryUl">
            	<c:forEach items="${categoryList}" var="category">
                    <li class="category" data-img="${category.image}" data-no="${category.no}">${category.name}</li>
            	</c:forEach>
            </ul><!--.event_popup_categoryUl end-->
        </div><!--.event_popup_categoryList end-->
    </div><!--.event_popup_category end-->
<!--popup02-->

    <a class="event_btn_scrollTop" href="#">
        <i class="fas fa-chevron-up"></i>
        <br/>
        <span>맨 위로</span>
    </a>
</div><!--event_contents end-->

<%@ include file="/WEB-INF/template/footer.jsp" %>

<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.js"></script>
<script>
    $window = $(window);

    $window.scroll(function () {
        var scrollTop = $(this).scrollTop();
        console.log(scrollTop);
        if(scrollTop < 500){
            $(".event_btn_scrollTop").hide();
        }else{
            $(".event_btn_scrollTop").show();
        }
    });

    /*header*/
    $window.scroll(function () {
        var sTop = $window.scrollTop();//스크롤높이
        //console.log("top: "+sTop);
        if(sTop>0) {
// 골드, 핑크골드
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(183,110,121,0.6))");
// 골드, 실버
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(192,192,192,0.6))");
            $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(100,100,100,0.5),rgba(200,200,200,0.5), rgba(192,192,192,0.8))");
// 골드
// $("#allIndexHeader").css("background-image","linear-gradient(to bottom, rgba(212,175,55,0.6), rgba(212,175,55,0.9))");
        }else {
            $("#allIndexHeader").css("background","transparent")
        }//if~else end
    });//scroll() end
    // header scroll end
    /*header*/

    $("body").on("click", ".event_btn_scrollTop", function(){
        $("html").scrollTop();
    });

    $('[data-control="shareSNS"]').on({
        'click': function (e) {
            var $this = $(this),
                $haze = $this.find('.haze'),
                isOpen = $this.next().toggleClass('on').hasClass('on'),
                text = $this.attr((isOpen == true ? '': ''));
            $haze.text(text);
        }
    });

    //////////공유하기 스크립트////////
    function twitter_sharer(){
        ga('send', 'event', '이벤트 내 버튼 클릭수', gaDateFormat('2018-12-21') + '_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_트위터 공유', gaDateFormat('2018-12-21') +'_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_트위터 공유');
        digitalData.click.track = "이벤트 상세 페이지^트위터 공유";
        _satellite.track('clicks');
        window.open( "https://twitter.com/intent/tweet?url="+ location.href , "twitter_sharer","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=800,height=600");
    }

    function facebook_sharer(){
        ga('send', 'event', '이벤트 내 버튼 클릭수', gaDateFormat('2018-12-21') + '_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_페이스북 공유', gaDateFormat('2018-12-21') +'_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_페이스북 공유');
        digitalData.click.track = "이벤트 상세 페이지^페이스북 공유";
        _satellite.track('clicks');
        //if (cjone.browser.isDevice) m.facebook.com
        window.open( "http://www.facebook.com/share.php?u="+ location.href , "facebook_sharer","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=640,height=480");
    }
    function kakaostory_sharer(){
        ga('send', 'event', '이벤트 내 버튼 클릭수', gaDateFormat('2018-12-21') + '_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_카카오스토리 공유', gaDateFormat('2018-12-21') +'_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_카카오스토리 공유');
        digitalData.click.track = "이벤트 상세 페이지^카카오스토리 공유";
        _satellite.track('clicks');
        Kakao.Story.share({ url : location.href });
    }

    function band_sharer(){
        ga('send', 'event', '이벤트 내 버튼 클릭수', gaDateFormat('2018-12-21') + '_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_밴드 공유', gaDateFormat('2018-12-21') +'_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_밴드 공유');
        digitalData.click.track = "이벤트 상세 페이지^밴드 공유";
        _satellite.track('clicks');
        window.open('http://band.us/plugin/share?body='+encodeURIComponent('기간 : 12/21(금) ~ 12/31(월)\n국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대')+'\n'+encodeURIComponent(location.href), 'band_sharer', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=800,height=600');
    }

    function kakaotalk_sharer(){
        ga('send', 'event', '이벤트 내 버튼 클릭수', gaDateFormat('2018-12-21') + '_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_카카오톡 공유', gaDateFormat('2018-12-21') +'_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_카카오톡 공유');
        //digitalData.click.track = "이벤트 상세 페이지^카카오톡 공유";
        // _satellite.track('clicks');

        var _snsShareAddr = '';

        var linkUrl = location.href;
        var linkText = 'CJ ONE으로 연결';
        var title = '국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대';
        var content = '기간 : 12/21(금) ~ 12/31(월)\n국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대';
        var img = 'http://www.cjone.com:80/cjmweb/upfile/20181221_1402331.jpg';
        var img_w = '354';
        var img_h = '298';

        KakaoTalkLink_V2(title, content, linkUrl, linkText, img, img_w, img_h);

    }

    function copyUrl(){
        digitalData.click.track = "이벤트 상세 페이지^URL 공유";
        _satellite.track('clicks');
        ga('send', 'event', '이벤트 내 버튼 클릭수', gaDateFormat('2018-12-21') + '_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_URL 공유', gaDateFormat('2018-12-21') +'_국립현대미술관 X 마르셀 뒤샹전 티켓 50% 할인 초대_URL 공유');

        var IE=(document.all)?true:false;

        if (IE) {
            if(confirm('아래 확인 버튼을 클릭하시면 URL 주소가 클립보드에 복사됩니다.\n원하는 곳에 붙여넣기(Ctrl+V)하세요.'))
                window.clipboardData.setData("Text", location.href);
        } else {
            temp = prompt('아래의 URL을 복사(Ctrl+C)하여 원하는 곳에 붙여넣기(Ctrl+V)하세요.', location.href);
        }
    }
    //////////공유하기 스크립트////////


    $('.event_contents').on("click", ".event_btn_survey", function (e) {
        e.preventDefault();
        $('.event_popup_box').show();
    });

    $('.event_contents').on("click", ".event_popupExit_box button", function () {
        //alert("test");
        $(".event_popup_box").hide();
        $(".event_popup_category").hide();
    });

    /*popup01 show*/


    /*popup02 show*/


    var cnt = 3;
    var cntSecond = 0;

    $('.event_contents').on("click", ".event_addBtn_category", function (e) {
        e.preventDefault();
        $(".event_popup_category").show();
    });

    $(document).on("click",".event_popup_categoryUl .category",function (e) {
    	
    	var src = this.dataset.img; // 이미지 이름 받아오기 data-img 로 받음
    	var categoryNo = this.dataset.no; // 카테고리 번호 받아오기 data-no 로 받음
    	
    	//console.log(src);
    	console.log("categoryNo= "+categoryNo);
    	
        var idx = $(".event_popup_categoryUl .category").index(this);
        console.log("idx: "+idx);

        $categoryNum = $(".event_popup_categoryUl .category:eq("+ idx +")");

        if($categoryNum.hasClass('on')){
            $categoryNum.css({
                "background-color": "white",
                "color": "#333"
            });
            cnt++;
            cntSecond--;
            $categoryNum.removeClass('on');
            //console.log(cnt);
            var name = $categoryNum.html();
            $(".event_category_area").eq(cntSecond).children().children().html("");
            $(".event_category_area").eq(cntSecond).children().children().next().html("비어 있음");
            $(".event_category_area").eq(cntSecond).children().children().next().next().val("");
            $(".event_category_area").eq(cntSecond).children().children().next().next().next().val("");
        }else if(cnt<=3 && cnt>=1 && !($categoryNum.hasClass('on')) && cntSecond<3){
            console.log("cnt: "+cnt);
            console.log("cntSecond: " + cntSecond);
            $categoryNum.css({
                "background-color": "#333",
                "color": "white"
            });
            $categoryNum.addClass('on');
            var name = $categoryNum.html();
            $(".event_category_area").eq(cntSecond).children().children().html("<img width='88' height='78' src='/img/"+src+"'/>");
            $(".event_category_area").eq(cntSecond).children().children().next().html(name);
            $(".event_category_area").eq(cntSecond).children().children().next().next().val(cnt);
            $(".event_category_area").eq(cntSecond).children().children().next().next().next().val(categoryNo);
            cnt--;
            cntSecond++;
        }// if ~ else if end
    }); // 카테고리 선택 function end

    $(document).on("click", ".event_popupExit_boxTwo button", function () {
        $(".event_popup_category").hide();
    });
    /*popup02 show*/

</script>
</body>
</html>
