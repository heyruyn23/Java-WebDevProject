<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입 | GiftGuideService</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/loginAndJoin.css">
<link rel="icon" href="/img/ggb.png">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

</head>
<body>
	<div id="joinBodyImage">
		<div id="joinContents">
			<h1 class="join_title">GGS</h1>
			<!-- .join_title end -->
			<h6 class="join_title_detail">(Gift Guide Service)</h6>
			<!-- .join_title_detail end -->
			<form action="/member/join" method="post">
				<input type="hidden" id="birthDate" name="birthDate" /> <input
					type="hidden" id="email" name="email" />
				<div class="join_email_tie">
					<div class="join_email_title">이메일</div>
					<!-- .join_email_title end -->
					<div id="emailForm">
						<input class="join_email_inp" type="text"
							placeholder="아이디로 사용할꺼에요!" autocomplete="off" maxlength="30">
						<!-- .join_email_inp end -->
						@ <input class="join_email_selectInp" autocomplete="off">
						<select id="joinEmailSelect" class="join_email_select">
							<option value="no_host">주소를 선택해 주세요!</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="etc">직접입력</option>
						</select>
						<!-- .join_email_select end -->
					</div>
					<!-- .email end -->
					<div class="join_email_msg">이메일을 입력해주세요!</div>
					<!-- .join_email_msg end -->
				</div>
				<!-- join_email_tie end -->
				<div class="join_password_tie">
					<div class="join_password_title">비밀번호</div>
					<!-- .join_password_title end -->
					<input class="join_password_inp" type="password" name="password"
						autocomplete="off" maxlength="15">
					<!-- .join_password_inp end -->
					<div class="join_password_msg">비밀번호를 입력해 주세요!</div>
					<!-- .join_password_msg end -->
				</div>
				<!-- join_password_tie end -->
				<div class="join_msg_tie">
					<div class="join_msg_title">비밀번호 재확인</div>
					<!-- .join_msg_title end -->
					<input class="join_msg_inp" type="password" name="msg"
						autocomplete="off" maxlength="15">
					<!-- .join_msg_inp end -->
					<div class="join_msg_msg">한번 더 입력해주세요!</div>
					<!-- .join_msg_msg end -->
				</div>
				<!-- .join_msg_tie end -->
				<div class="join_birthDate_tie">
					<span class="join_birthDate_title">생년월일</span>
					<div id="birthDate">
						<label> <input type="text" id="year" maxlength="4"
							autocomplete="off" title="태어난 년도를 입력"
							placeholder="년(4자리) ex) 2005" />
						</label> <label> <input type="text" id="month" maxlength="2"
							autocomplete="off" title="태어난 월을 입력" placeholder="월 ex) 05" />
						</label> <label> <input type="text" id="date" maxlength="2"
							autocomplete="off" title="태어난 일을 입력" placeholder="일 ex) 27" />
						</label>
					</div>
					<div class="join_birthDate_msg">생년월일을 입력해주세요!</div>
				</div>
				<!-- .join_birthDate_tie end -->
				<div class="join_gender_tie">
					<div class="join_gender_title">성별</div>
					<!-- .join_gender_title end -->
					<div class="join_gender_fas_tie">
						<label> <i class="fas fa-male fas_M"></i> <!-- 폰트어썸 남자 end -->
							<input class="join_gender_inputM" type="radio" name="sex"
							value="M"> <!-- 폰트어썸 인풋 라디오 남자 -->
						</label>
						<!-- 폰트어썸 M 라벨 end -->
						<label> <i class="fas fa-female fas_F"></i> <!-- 폰트어썸 여자 end -->
							<input class="join_gender_inputF" type="radio" name="sex"
							value="F"> <!-- 폰트어썸 인풋 라디오 여자 -->
						</label>
						<!-- 폰트어썸 F 라벨 end -->
					</div>
					<!-- .join_gender_fas_tie end -->
					<!--<select class="join_gender_select" name="genderSelect">-->
					<!--<option selected value="">성별을 선택해 주세요!</option>-->
					<!--<option value="M">남성</option>-->
					<!--<option value="W">여성</option>-->
					<!--</select> &lt;!&ndash; .join_gender_select end &ndash;&gt;-->
					<!--<div class="join_gender_msg">궁금궁금</div>-->
				</div>
				<!-- .join_gender_tie end -->
				<div class="join_btn_tie">
					<button class="join_before_btn"
						onclick="location.href='login_form.html'">이전으로</button>
					<!-- .join_before_btn end -->
					<button class="join_join_btn">가입하기</button>
					<!-- .join_join_btn end -->
				</div>
				<!-- .join_btn_tie end -->
			</form>
			<!-- form end -->
		</div>
		<!-- #joinContents end -->
	</div>
	<!-- #joinBodyImage end -->
	<script src="/js/jquery.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script>
		//폼 지정
		var $joinForm = $("#joinContents>form");

		//성별 체크된 라디오값 가져오기
		var temp = $(':radio[name="sex"]:checked').val();

		//정규표현식
		var $emailReg = /^[a-z|A-Z][\w]{4,29}$/;//이메일 영어로 시작 다섯자 이상 30자 이하
		//var $emailReg = /^[a-z|A-Z][\w]*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var $pwdReg = /^[\w]{3,15}$/; //비밀번호 3 ~ 15자리 입력 영어나 숫자 또는 영어+숫자 조합

		//inp, select, fas
		var $email = $("#email"); //이메일
		var $emailInp = $(".join_email_inp"); //이메일 첫번째(아이디) input
		var $emailSelectInp = $(".join_email_selectInp");
		var $pwdInp = $(".join_password_inp"); //비밀번호 input
		var $emailSelect = $(".join_email_select"); //이메일 셀렉트(주소)
		var $msgInp = $(".join_msg_inp"); //비밀번호 재확인 input
		var genderSelect; //성별 셀렉트
		var genderMsg = $(".join_gender_msg"); //성별 메세지
		var $year = $("#year"); //year
		var $month = $("#month"); //month
		var $date = $("#date"); //date
		var $birthDate = $("#birthDate"); //생년월일 inp 묶음
		var $sexM = $(".fas_M"); //남자
		var $sexF = $(".fas_F"); //여자

		//msg
		var $emailMsg = $(".join_email_msg"); //이메일 메세지
		var $pwdMsg = $(".join_password_msg"); //비밀번호 메세지
		var $birthMsg = $(".join_birthDate_msg"); //생년월일(생일) 메세지
		var $msgMsg = $(".join_msg_msg"); //비밀번호 재확인 메세지

		//유효성 검사가 되었는지 확인하는 변수
		var isValidEmail = false; //이메일
		var isValidPwd = false; //비밀번호
		var isValidMsg = false; //비밀번호 재확인
		var isValidBirth = false; //생년월일
		var isValidSex = false; //성별

		var oldEmail = null;

		//이메일 유효성검사 ajax
		function checkEmail() {

			//입력값
			var email = $emailInp.val();

			//console.log(email);
			//var value = $emailInp.val()+$emailMark.val()+$(".join_email_select option:selected").val();

			if ($emailReg.test(email)) {

				var host = $emailSelect.val();

				//console.log(host);

				if (host != "no_host") {

					if (host != "etc") {

						email = $emailInp.val() + "@" + host; //직접입력 클릭안하고 셀렉트의 옵션을 선택할 경우 이조합으로

					} else {

						email = $emailInp.val() + "@" + $emailSelectInp.val(); // 직접입력 클릭시 셀렉트인풋 조합으로

					} //if ~ else end (host != "etc")

					//작동gogo
					$emailMsg.text("확인중...");

					$.ajax({
						url : "/ajax/member/email",
						dataType : "json",
						data : {
							"email" : email
						},
						error : function() {

							alert("서버 점검중!");

						},
						success : function(json) {

							if (json.result) {
								isValidEmail = true;
								$emailMsg.text("환영합니다!");
							} else {
								isValidEmail = false;
								$emailMsg.text("이미 사용중이거나 탈퇴한 이메일이네요!");
							}//if~else end

						}//success end
					});//$.ajax() end

				} else {
					isValidEmail = false;
					$emailMsg.text("이메일 종류를 선택해주세요.");
				} //if ~ else end (host != "no_host")

			} else {
				$emailMsg.text("특수문자 제외 5~30자 첫글자는 영어로 시작되어야 해요ㅠ_ ㅠ");
			}//if~else end

		}//checkEmial end

		//이메일 유효성 검사
		//$emailInp.keyup(function() {
		//	var value = $(this).val();
		//	if ($emailReg.test(value)) {
		//		$emailMsg.addClass("ok").text("환영합니다!");
		//	} else {
		//		$emailMsg.removeClass("ok").text(
		//				"특수문자 제외 5~30자 첫글자는 영어로 시작되어야 해요ㅠ_ ㅠ");
		//		return false;
		//	} // if ~ else end
		//}); //keyup() email end

		//이메일 직접입력 선택시 select 사라지고 input
		$emailSelect.change(function() {
			$(".join_email_select option:selected").each(function() {
				if ($(this).val() == 'etc') {
					$emailSelect.css("display", "none");
					$(".join_email_selectInp").css("display", "inline-block"); //셀렉트 옵션중 value="etc" 인 옵션을 클릭하면 발생
				} //if() end
			}) //each() end
		}); //.join_email_select change end

		//비밀번호 유효성 검사
		function checkPwd() {
			//사용자가 입력한 val 얻어옴
			var value = $pwdInp.val();
			if ($pwdReg.test(value)) {
				isValidPwd = true;
				$pwdMsg.text("조건에 맞는 비밀번호입니다!");
			} else {
				isValidPwd = false;
				$pwdMsg.text("영어와 숫자로 3~15자리까지 입력해주세요!");
			} //if~else end
		}//keyup() password end

		//비밀번호 재확인 유효성 검사
		function checkPwdMsg() {
			var value = $msgInp.val();
			if (value.length != 0 && value == $pwdInp.val()) {
				isValidMsg = true;
				$msgMsg.addClass("ok").text("비밀번호와 일치합니다.");
			} else {
				isValidMsg = false;
				$msgMsg.removeClass("ok").text("비밀번호와 동일하게 입력해주세요.");
			} //if else end
		}//checkPwdMsg end

		//생년월일 유효성 검사
		//$(".join_birthDate_inp").keyup(
		//		function() {
		//			var value = $(this).val();
		//			if ($birthDateReg.test(value)) {
		//				$birthDateMsg.addClass("ok").text("환영합니다!");
		//				return true;
		//			} else {
		//				$birthDateMsg.removeClass("ok").text(
		//						"숫자로 6자리를 입력해주세요! ex ) 950725");
		//				return false;
		//			} //if ~ else end
		//		}); //keyup() birthDate end

		//생년월일 유효성 검사 수정
		function checkBirthDate() {

			var year = $year.val();
			var month = $month.val();
			var date = $date.val();

			var birth = moment([ year, month - 1, date ]);

			if (birth.isValid()) {
				isValidBirth = true;
				$birthMsg.addClass("ok").text(
						year + "년  " + month + "월  " + date + "일에 태어나셨군요!");
			} else {
				isValidBirth = false;
				$birthMsg.removeClass("ok").text("생년월일을 입력해 주셔야 해요!");
			}//if~else end

		}//checkBirthDate() end

		//성별 유효성 검사
		// $(".join_gender_select").change(function () {
		//
		//     genderSelect = $(".join_gender_select").val();
		//
		//     if(genderSelect == "") {
		//         genderMsg.addClass("ok").text("성별을 선택해 주세요!");
		//         return false;
		//     }else if(genderSelect == "M") {
		//         genderMsg.addClass("ok").text("남성이시군요!");
		//         return true;
		//     }else if(genderSelect == "W" ) {
		//         genderMsg.addClass("ok").text("여성이시군요!");
		//         return true;
		//     }// if if~else if~else end
		//
		// }); //change() end

		/* function checkSex() {
			
			if(join_gender_inputM.val() == "M") {
				$sexF.removeClass("ok"); //여자 css remove
				$sexM.addClass("ok"); //남자 css add
			} if else (join_gender_inputF.val() == "F") {
				$sexM.removeClass("ok"); //남자 css remove
				$sexF.addClass("ok"); //여자 css add
			} else {
				return false;
			}
			
		}; */

		//성별 유효성 검사 수정
		//성별 선택했는지 확인하는 함수
		function checkSex3() {

			//네임이 sex인 인풋 라디오 타입에 선택값이 없을경우
			if ($("input[name=sex]:radio:checked").length == 0) {

				isValidSex = false; //가입하기 버튼 안먹힘

			} else {
				isValidSex = true; //먹힘
			}

		}//checkSex3 end

		//성별 남성 클릭시 css
		function checkSexM() {
			$sexF.removeClass("ok"); //여자 css remove
			$sexM.addClass("ok"); //남자 css add
			//console.log("남" + temp);
		}; //checkSexM end

		//성별 여성 클릭시 css
		function checkSexF() {
			$sexM.removeClass("ok"); //남자 css remove
			$sexF.addClass("ok"); //여자 css add
			//console.log("여" + temp);
		}; //checkSexF end

		//함수 이벤트 지정
		$emailInp.keyup(checkEmail).blur(checkEmail).focus();//email에 포커스 지정
		$emailSelect.change(checkEmail); //셀렉트
		$emailSelectInp.keyup(checkEmail);
		$pwdInp.keyup(checkPwd); //비밀번호
		$msgInp.keyup(checkPwdMsg); //비밀번호 재확인
		$year.keyup(checkBirthDate); // 년
		$month.keyup(checkBirthDate); // 월
		$date.keyup(checkBirthDate); // 일
		$sexM.click(checkSexM); // 남성
		$sexF.click(checkSexF); // 여성

		//form submit
		$joinForm.submit(function() {

			checkEmail(); // 이메일 함수
			checkPwd(); // 비밀번호 함수
			checkPwdMsg(); // 비밀번호 재확인 함수
			checkBirthDate(); // 생년월일 함수
			checkSex3(); // 성별 선택했는지 안했는지 확인하는 함수

			if (!isValidEmail || !isValidPwd || !isValidMsg || !isValidBirth
					|| !isValidSex) {
				return false;
			}//if end

			//이메일 셀렉트 직접입력이 아닐시
			if ($emailSelect.val() != "etc") {
				$email.val($emailInp.val() + "@" + $emailSelect.val()); //조건에 맞을때 이메일@셀렉트 형식으로 submit
			} else {
				//직접입력일시
				$emailSelect.val(""); //아닐시 직접입력 value값 ''로 초기화
				$email.val($emailInp.val() + "@" + $emailSelectInp.val()); //조건에 맞지 않을때 이메일@직접입력선택인풋 형식으로 submit
			}//if ~ else end

			//생년월일 0000-00-00 형식으로 submit
			$birthDate
					.val($year.val() + "-" + $month.val() + "-" + $date.val());

		});//submit() end
	</script>
</body>
</html>