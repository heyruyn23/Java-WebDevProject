<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Custom Gift | GiftGuideService</title>
<%@ include file="/WEB-INF/template/link.jsp"%>
<link rel="stylesheet" href="/css/customGift.css">

</head>
<body>
	<%@ include file="/WEB-INF/template/header.jsp"%>
	<div id="customContentBox">

		<div id="customHeroImg">
			<div id="customHeroText">
				<!--<h1 id="ab">-->
				<!--맞춤 선물-->
				<!--</h1>-->
				<h1 id="customHeroTitle" class="custom_hero_text">Custom Gift</h1>
				<h2 class="custom_hero_text">선물하는 대상에게 딱 맞는 선물을 추천해드립니다</h2>
			</div>
		</div>
		<!--customHeroImg end-->

		<div class="custom_wrap" id="customQuestionBox">

			<div class="custom_form" id="customFormGender">
				<!-- 
            <form:form modelAttribute="survey" method="post">   
 -->
				<form>
					<div class="custom_progress">
						<div class="custom_progress custom_progress_bar"
							style="width: 1%; background-color: indianred"></div>
					</div>
					<!--custom_progress end-->
					<div class="custom_question">
						<h1>선물 할 대상의 성별은 무엇인가요?</h1>
					</div>

					<ul class="custom_answer_form">
						<li class="custom_answer_list"><label>

								<div class="custom_answer_box">

									<input type="radio" name="gender" value="M" />
									<div class="custom_checkbox">

										<div class="custom_checkbox_checked" id="customCheckGenderM">
											<i class="fas fa-check"></i>
										</div>
									</div>
									<div class="custom_checkbox_text">남자</div>
								</div>

						</label></li>
						<li class="custom_answer_list"><label>
								<div class="custom_answer_box">
									<input type="radio" name="gender" value="W" />
									<div class="custom_checkbox">
										<div class="custom_checkbox_checked" id="customCheckGenderW">
											<i class="fas fa-check"></i>
										</div>
									</div>
									<div class="custom_checkbox_text">여자</div>
								</div>


						</label></li>
					</ul>
					<!--.custom_answer_form end-->
					<div class="custom_msg">
						<i class="fas fa-exclamation-circle"></i> 옵션을 선택해주세요
					</div>
					<button class="custom_btn_next" id="customBtnGender">
						다음 <i class="fa fa-angle-right hidden-xs"></i>
					</button>
			</div>
			<!--#customFormGender end-->

			<div class="custom_form" id="customFormAge">

				<div class="custom_progress">
					<div class="custom_progress custom_progress_bar"
						style="width: 25%; background-color: indianred"></div>
				</div>
				<!--custom_progress end-->
				<div class="custom_question">
					<h1>선물 할 대상의 연령대는 무엇인가요?</h1>
				</div>

				<ul class="custom_answer_form">
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="age" value="10">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckAgeTen">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">10대</div>
							</div>
					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="age" value="20">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckAgeTwenty">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">20대</div>
							</div>


					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="age" value="30">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckAgeThirty">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">30대</div>
							</div>


					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="age" value="40">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckAgeForty">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">40대</div>
							</div>


					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="age" value="50">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckAgeFifty">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">50대 이상</div>
							</div>


					</label></li>
				</ul>
				<!--.custom_answer_form end-->
				<div class="custom_msg">
					<i class="fas fa-exclamation-circle"></i> 옵션을 선택해주세요
				</div>
				<button class="custom_btn_next" id="customBtnAge">
					다음 <i class="fa fa-angle-right hidden-xs"></i>
				</button>

			</div>
			<!--#customFormAge end-->

			<div class="custom_form" id="customFormRelation">
				<div class="custom_progress">
					<div class="custom_progress custom_progress_bar"
						style="width: 50%; background-color: indianred"></div>
				</div>
				<!--custom_progress end-->
				<div class="custom_question">
					<h1>선물 할 대상과의 관계는 무엇입니까?</h1>
				</div>

				<ul class="custom_answer_form">
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="relation" value="부모님">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckParents">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">부모님</div>
							</div>
					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="relation" value="형제자매">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckSiblings">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">형제 자매</div>
							</div>
					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="relation" value="친구">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckFriend">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">친구</div>
							</div>
					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="relation" value="직장동료">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckColleague">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">직장동료</div>
							</div>
					</label></li>

					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="relation" value="그외">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckEtc">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">그 외</div>
							</div>
					</label></li>
				</ul>
				<!--.custom_answer_form end-->
				<div class="custom_msg">
					<i class="fas fa-exclamation-circle"></i> 옵션을 선택해주세요
				</div>
				<button class="custom_btn_next" id="customBtnRelation">
					다음 <i class="fa fa-angle-right hidden-xs"></i>
				</button>

			</div>
			<!--#customFormRelation end-->

			<div class="custom_form" id="customFormReason">
				<div class="custom_progress">
					<div class="custom_progress custom_progress_bar"
						style="width: 75%; background-color: indianred"></div>
				</div>
				<!--custom_progress end-->
				<div class="custom_question">
					<h1>선물을 준비하는 이유는 무엇인가요?</h1>
				</div>

				<ul class="custom_answer_form">
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="reason" value="1">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckBirth">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">생일</div>
							</div>
					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="reason" value="2">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked"
										id="customCheckAnniversary">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">기념일</div>
							</div>
					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="reason" value="3">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckHoliday">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">명절</div>
							</div>
					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="reason" value="4">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckHappy">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">소확행 (소소한 선물)</div>
							</div>
					</label></li>
					<li class="custom_answer_list"><label>
							<div class="custom_answer_box">
								<input type="radio" name="reason" value="5">
								<div class="custom_checkbox">
									<div class="custom_checkbox_checked" id="customCheckReasonEtc">
										<i class="fas fa-check"></i>
									</div>
								</div>
								<div class="custom_checkbox_text">그 외</div>
							</div>
					</label></li>
				</ul>
				<!--.custom_answer_form end-->
				<div class="custom_msg">
					<i class="fas fa-exclamation-circle"></i> 옵션을 선택해주세요
				</div>
				<button type="button" class="custom_btn_next" id="customBtnReason">완료
				</button>

				</form>
				<!-- 
</form:form>
 -->
				<!--form end-->
			</div>
			<!--#customFormReason end-->


			<div class="custom_explain_box">
				<div id="customExplainImg">
					<img src="/img/gift-gif.gif" width="300" height="300" />
				</div>
				<!--<div id="customExplainText"><img src="img/vl.png" width="200" height="200"/></div>-->
				<div class="custom_explain_text" id="customExplainPercent">0 %</div>
				<div class="custom_explain_text" id="customExplainText">
					MATCHING . . .</div>
			</div>
		</div>
		<!--#customWrap end-->

		<div class="custom_wrap" id="customGiftBox">


			<div id="customGiftResultBox">
				<div id="customGiftTitle">
					<h1>
						<i class="fas fa-gift"></i> <em id=resultAgeText></em>대 <em id=resultGenderText></em>에게 딱 맞는 선물은 ?
						<!--문구 미정-->
					</h1>
				</div>
				<div id="Box"></div>
				<!-- 
            <div class="custom_plus_box">
                <button id="customPlusBtn" type="button"> <i class="fas fa-caret-down"></i></button>
            </div>
            <div id="customPlusText" class="custom_plus_box">
                매칭더보기
            </div>
 -->
			</div>
			<!--#customGiftResultBox end-->
		</div>
		<!--#customGiftBox end-->
	</div>
	<!--#customContentBox end-->

	<%@ include file="/WEB-INF/template/footer.jsp"%>
	<!--customContentBox end-->

	<script type="text/template" id="customGiftTmp">

<@_.each(customGiftList,function(item){@>
    <div class="custom_gift">
        <div class="custom_gift_img">
            <img class="custom_gift_image" src="/img/item/<@=item.image@>" width="200" height="200">
        </div>
        <div class="custom_gift_text">
            <p class="gift_text_title"><@=item.name@></p>
            <p><@=item.price@>원</p>
        </div>
    </div>
<@})@>
</script>
	<!--#customGiftTmp end-->
	<script src="/js/jquery.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};
		var checkUnload = true;
		$(window).on("beforeunload", function() {
			if (checkUnload)
				return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
		});

		var gender, age, reason, relation;

		$("#customGiftBox").css("display", "none");
		$("input:radio[name=gender]").on("click", function() {
			gender = $("input:radio[name=gender]:checked").val();
			//alert(gender);
			if (gender == 'M') {
				$("#customCheckGenderM").css("display", "block");
				$("#customCheckGenderW").css("display", "none");

			} else {
				$("#customCheckGenderM").css("display", "none");
				$("#customCheckGenderW").css("display", "block");
			}

		});//input:radio[name=gender] click end

		$("input:radio[name=age]").on("click", function() {
			age = $("input:radio[name=age]:checked").val();
			//alert(age);
			$(".custom_checkbox_checked").css("display", "none");
			if (age == '10') {
				$("#customCheckAgeTen").css("display", "block");
			} else if (age == '20') {
				$("#customCheckAgeTwenty").css("display", "block");
			} else if (age == '30') {
				$("#customCheckAgeThirty").css("display", "block");
			} else if (age == '40') {
				$("#customCheckAgeForty").css("display", "block");
			} else if (age == '50') {
				$("#customCheckAgeFifty").css("display", "block");
			}
		});//input:radio[name=age] click end

		$("input:radio[name=relation]").on("click", function() {
			relation = $("input:radio[name=relation]:checked").val();
			//alert(relation);

			$(".custom_checkbox_checked").css("display", "none");
			if (relation == '부모님') {
				$("#customCheckParents").css("display", "block");
			} else if (relation == '형제자매') {
				$("#customCheckSiblings").css("display", "block");
			} else if (relation == '친구') {
				$("#customCheckFriend").css("display", "block");
			} else if (relation == '직장동료') {
				$("#customCheckColleague").css("display", "block");
			} else if (relation == '그외') {
				$("#customCheckEtc").css("display", "block");
			}
		});//input:radio[name=relation] click end

		$("input:radio[name=reason]").on("click", function() {
			reason = $("input:radio[name=reason]:checked").val();
			//alert(reason);

			$(".custom_checkbox_checked").css("display", "none");
			if (reason == '1') {
				$("#customCheckBirth").css("display", "block");
			} else if (reason == '2') {
				$("#customCheckAnniversary").css("display", "block");
			} else if (reason == '3') {
				$("#customCheckHoliday").css("display", "block");
			} else if (reason == '4') {
				$("#customCheckHappy").css("display", "block");
			} else if (reason == '5') {
				$("#customCheckReasonEtc").css("display", "block");
			}
		});//input:radio[name=relation] click end

		$("#customBtnGender").on("click", function(e) {
			e.preventDefault();
			if ($("input:radio[name=gender]:checked").val() == null) {
				$(".custom_msg").css("color", "red");
			} else {
				$(".custom_msg").css("color", "#f9f9f9");
				$("#customFormGender").css("display", "none");
				$("#customFormAge").css("display", "block");
				$("#customExplainPercent").text("25 %");
			}
		});//#customBtnGender click end

		$("#customBtnAge").on("click", function(e) {
			e.preventDefault();
			if ($("input:radio[name=age]:checked").val() == null) {
				$(".custom_msg").css("color", "red");
			} else {
				$(".custom_msg").css("color", "#f9f9f9");
				$("#customFormAge").css("display", "none");
				$("#customFormRelation").css("display", "block");
				$("#customExplainPercent").text("50 %");
			}
		});//#customBtnAgeGender click end

		$("#customBtnRelation").on("click", function(e) {
			e.preventDefault();
			if ($("input:radio[name=relation]:checked").val() == null) {
				$(".custom_msg").css("color", "red");
			} else {
				$(".custom_msg").css("color", "#f9f9f9");
				$("#customFormRelation").css("display", "none");
				$("#customFormReason").css("display", "block");
				$("#customExplainPercent").text("75 %");
			}
		});//#customBtnGender click end

		$("#customBtnReason").on("click", function(e) {
			e.preventDefault();
			if ($("input:radio[name=reason]:checked").val() == null) {
				$(".custom_msg").css("color", "red");
			} else {
				var genderStr;
				$(".custom_msg").css("color", "#f9f9f9");
				$("#customQuestionBox").css("display", "none");
				$("#resultAgeText").text(age);
				if(gender=='W'){
					genderStr='여성';
				}else{
					genderStr='남성';
				}
				$("#resultGenderText").text(genderStr);
				getGiftList();
				$("#customGiftBox").css("display", "block");
				$("#customQuestionBox").fadeOut(2000);
				$("#customGiftResultBox").fadeIn(2000);
				checkUnload = false;
			}
		});//#customBtnGender click end

		//   $("#customPlusBtn").on("click",function () {
		//      var height=$("#customGiftResultBox").height()+400;
		//      $("#customGiftResultBox").css("height",height);
		//      var giftList=_.template($("#customGiftTmp").html());
		//      for (var i=0;i<=2;i++){
		//          // alert(giftList);
		//          $(".custom_gift:last").after(giftList());
		//       }
		//   });//#customPlusBtn click end

		$("#customPlusBtn").hover(function() {
			$("#customPlusText").show();
		}, function() {
			$("#customPlusText").hide();
		});//#customPlusrBtn hover end

		var customGiftTmp = _.template($("#customGiftTmp").html());

		function getGiftList() {
			$.ajax({
				url : "/ajax/customGiftList",
				type : "GET",
				data : {
					"gender" : gender,
					"age" : age,
					"relation" : relation,
					"reason" : reason,
				},
				dataType : "json",
				error : function() {
					alert("에러");
				},
				success : function(json) {
					$("#Box").html(customGiftTmp({
						customGiftList : json
					}));
				}
			});
		}//freePaginate end
		
		function AddComma(data_value){
			return Number(data_value).toLocaleString('en');
		}
	</script>
</body>
</html>