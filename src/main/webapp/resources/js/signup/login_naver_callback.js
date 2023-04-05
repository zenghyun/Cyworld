const naverLogin = new naver.LoginWithNaverId({
  clientId: "eSWj7IYuFA0SbZBBHqva",
  callbackUrl: "http://localhost:9090/cyworld_oracle/login_naver_callback.do",
  isPopup: false,
  callbackHandle: true,
});
naverLogin.init();

// 로그인 유효성 검사
window.addEventListener("load", function () {
  naverLogin.getLoginStatus(function (status) {
    if (status) {
      // form태그
      let ff = document.getElementById("ff");
      // naver API 필수정보값
      const name = naverLogin.user.getName(); // 이름
      const gender = naverLogin.user.getGender(); // 성별
      const email = naverLogin.user.getEmail(); // 이메일
      // input태그 hidden타입
      const h_name = document.getElementById("name"); // 이름
      const h_gender = document.getElementById("gender"); // 성별
      const h_email = document.getElementById("email"); // 이메일
      // input value에 naver API 필수정보값 넣기
      h_name.value = name; // 이름
      h_gender.value = gender; // 성별
      h_email.value = email; // 이메일
      // 다음 인증페이지 이동
      ff.submit();
    } else {
      console.log("callback 처리에 실패하였습니다.");
    }
  });
});
