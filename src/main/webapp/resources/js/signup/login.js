function nmain() {
  // idx로 -1을 부여받게 된다
  location.href = "nmain.do?idx=" + -1;
}

// ID 찾기
function find_id() {
  location.href = "findID.do";
}

// PW 찾기
function find_pw() {
  location.href = "findPW.do";
}

// 로그인 ID & PW 체크
function loginCheck(f) {
  let userID = f.userID.value;
  let info = f.info.value;

  // 유효성 체크
  if (userID == "") {
    alert("아이디를 입력하세요");
    return;
  }
  if (info == "") {
    alert("비밀번호를 입력하세요");
    return;
  }

  // Ajax로 ID와 PWD를 전달
  let url = "login_check.do";
  let param = "userID=" + userID + "&info=" + info;
  sendRequest(url, param, resultLogin, "POST");
}
// 로그인 콜백메소드
function resultLogin() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    let data = xhr.responseText;

    // 서버에서 넘어온 데이터를 실제 JSON형식으로 변환
    var json = new Function("return" + data)();

    if (json.result == "no_id") {
      alert("아이디가 틀렸습니다");
      return;
    }
    if (json.result == "no_info") {
      alert("비밀번호가 틀렸습니다");
      return;
    }

    alert("로그인 성공");
    // 입력한 ID와 비밀번호를 들고 메인 페이지로 이동
    const ff = document.getElementById("ff");
    ff.action = "login_authentication.do";
    ff.method = "POST";
    ff.submit();
  }
}

// 네이버 로그인 정보
const naverLogin = new naver.LoginWithNaverId({
  clientId: "eSWj7IYuFA0SbZBBHqva", // 네이버에서 발급받은 API 사용 ID
  callbackUrl: "http://localhost:9090/cyworld_oracle/login_naver_callback.do", // 로그인을 하고 정보동의 후 이동할 페이지 - 네이버에서 미리 등록해야한다.
  loginButton: { color: "green", type: 3, height: 40 }, // 위에 작성한 <div>태그에 만들어줄 로그인 버튼 모양 설정
  isPopup: false, // callbackUrl을 팝업창으로 열건지 선택 - true : 팝업 / false : 다음 페이지
  callbackHandle: true, // 콜백메소드에 핸들메소드 사용여부
});
// 로그인 정보동의 시작
naverLogin.init();

// 카카오 로그인 API 검증
window.Kakao.init("299930f187d00dde5908962ec35a19c9");
// 카카오 로그인 시작
function kakaoLogin() {
  window.Kakao.Auth.login({
    // 동의항목에 체크한것들 작성
    scope: "account_email, gender",
    // 정보동의가 완료되면 실행되는 메소드
    // success는 위에 코드가 성공하면 받아오는 콜백함수이다.
    success: function (authObj) {
      // 유저정보 받아오기
      window.Kakao.API.request({
        // url을 통해 현제 로그인한 사용자 정보를 받아온다.
        url: "/v2/user/me",
        // 위에 코드가 성공하면 실행
        success: (res) => {
          // account정보를 받아온다.
          const kakao_account = res.kakao_account;
          // 받아온 account정보
          const email = kakao_account.email; // 이메일
          const gender = kakao_account.gender; // 성별
          const kf = document.getElementById("kf"); // form태그
          const h_email = document.getElementById("email"); // hidden 이메일
          const h_gender = document.getElementById("gender"); // hidden 성별
          // hidden value에 account정보 넣기
          h_email.value = email;
          h_gender.value = gender;
          kf.submit(); // action="url" 이동
        },
      });
    },
  });
}
