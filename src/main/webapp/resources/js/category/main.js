// bgm 재생
//Audio 사용을 위한 객체 생성
let audio = new Audio();
//오디오가 참조하는 노래 주소 지정
audio.src = "/cyworld/resources/sound/main.mp3";
myAudio.loop = true; //노래가 끝나도 loop가 가능하게 설정
audio.play();
audio.volume = 3;

// 각종 팝업창

// 도토리 구매 팝업창
function DotoryPopUp() {
  let popUrl = "dotory.do?idx=${param.idx}&dotoryNum=${signVo.dotoryNum}";
  let popOption =
    "top=100, left=800, width=600, height=800, status=no, menubar=no, toolbar=no, resizable=no";
  let pop = window.open(popUrl, "_blank", popOption);
}

// 검색 팝업창
function searchPopUp() {
  //let popUrl = "main_search_popup.do";
  let popOption =
    "top=100, left=800, width=600, height=800, status=no, menubar=no, toolbar=no, resizable=no";
  window.open("", "search", popOption);
  document.sf.action = "main_search_popup.do";
  document.sf.target = "search";
  document.sf.submit();
}

// 일촌 신청 및 일촌평 작성 기능

// 일촌 신청
function ilchon() {
  let idx = document.getElementById("idx").value;
  let sessionIdx = document.getElementById("sessionIdx").value;

  // 비회원일 경우
  if (sessionIdx <= 0) {
    alert("로그인후 이용 가능합니다");
    return;
  }

  url = "main_ilchon.do";
  param = "idx=" + idx + "&sessionIdx=" + sessionIdx;
  sendRequest(url, param, resultIlchon, "GET");
}
// 일촌 신청 콜백메소드
function resultIlchon() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    let data = xhr.responseText;
    let ilchonNum = document.getElementById("ilchonNum").value;

    if (data == "no") {
      alert("일촌 취소");
      location.href = "main.do?idx=${signVo.idx}";
      return;
    }

    alert("일촌 신청 완료");
    location.href = "main.do?idx=${signVo.idx}";
  }
}

// 일촌평 작성
function registration(f) {
  let ilchonpyeongText = f.ilchonpyeongText.value;
  let idx = document.getElementById("idx").value;
  let sessionIdx = document.getElementById("sessionIdx").value;

  // 비회원일 경우
  if (sessionIdx <= 0) {
    alert("로그인후 이용 가능합니다");
    return;
  }

  // 타 유저의 미니홈피일 경우
  if (idx != sessionIdx) {
    let ilchonUp = document.getElementById("ilchonUp").value; // 일촌 신청 상태를 나타내는 숫자

    // 쌍방으로 일촌 신청하지 않은 경우
    if (ilchonUp != 2) {
      alert("일촌평은 서로 일촌 상태여야 작성 가능합니다");
      return;
    }
  }

  // 공백일 경우
  if (ilchonpyeongText == "") {
    alert("일촌평을 작성해주세요.");
    return;
  }

  url = "ilchon_write.do";
  param = "ilchonpyeongText=" + ilchonpyeongText + "&idx=" + idx;
  sendRequest(url, param, resultIlchonpyeong, "GET");
}

// 일촌평 콜백메소드
function resultIlchonpyeong() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    let data = xhr.responseText;

    if (data == "no") {
      alert("작성 실패");
      return;
    }

    alert("작성 완료");
    location.href = "main.do?idx=${signVo.idx}";
  }
}

// 액션 미니미 광고 배너

// 액션 미니미 광고 배너 클릭시 --> 미니미 수정 팝업창
function minimiPopUp() {
  let popUrl = "profile_minimi_popup.do?idx=${signVo.idx}";
  let popOption =
    "top=100, left=800, width=600, height=800, status=no, menubar=no, toolbar=no, resizable=no";
  window.open(popUrl, "minimi", popOption);
}

// 액션 미니미 광고 배너 끄기
function displayNone(f) {
  const rightBanner = document.querySelector(".right-banner");
  rightBanner.style.display = "none";
}

// 액션 미니미 광고 배너 배경색

// 배너 배경색 랜덤
const colors = [
  "#83bdf490",
  "#42d3fb98",
  "#00e5e98b",
  "#5bf3c391",
  "#aafa9494",
  "#f9f97194",
  "#ffafc8ac",
  "#b595ff8f",
  "#e4f7d280",
  "#fdd785ac",
  "#f9aa80b7",
];

const LENGTH = colors.length;

// setInterval(callback, delay); 지연시간동안 callback을 호출
const timer = setInterval(randomColor, 3000);

function randomColor() {
  let num1 = Math.floor(Math.random() * LENGTH);
  let num2 = Math.floor(Math.random() * LENGTH);
  let num3 = Math.floor(Math.random() * LENGTH);
  let num4 = Math.floor(Math.random() * LENGTH);
  let num5 = Math.floor(Math.random() * LENGTH);
  // document.body.style.backgroundColor = colors[num];
  document.getElementById("banner").style.background =
    "linear-gradient(45deg," +
    colors[num1] +
    "," +
    colors[num2] +
    "," +
    colors[num3] +
    "," +
    colors[num4] +
    "," +
    colors[num5] +
    ")";
}

//맨 처음부터 배경색 지정
randomColor();

// 오른쪽 탭 기능

// 프로필 탭
function profile(f) {
  let sessionIdx = document.getElementById("sessionIdx").value;
  let idx = document.getElementById("idx").value;

  // 타 유저 접근 불가
  if (sessionIdx != idx) {
    alert("프로필은 본인만 들어갈 수 있습니다");
    return;
  }

  f.action = "profile.do";
  f.method = "POST";
  f.submit();
}

// 다이어리 탭
function diary(f) {
  let sessionIdx = document.getElementById("sessionIdx").value;
  let idx = document.getElementById("idx").value;

  // 비회원일 경우
  if (sessionIdx <= 0) {
    alert("로그인후 이용 가능합니다");
    return;
  }

  f.action = "diary.do";
  f.method = "GET";
  f.submit();
}

// 사진첩 탭
function gallery(f) {
  let sessionIdx = document.getElementById("sessionIdx").value;
  let idx = document.getElementById("idx").value;

  // 비회원일 경우
  if (sessionIdx <= 0) {
    alert("로그인후 이용 가능합니다");
    return;
  }

  f.action = "gallery.do";
  f.method = "GET";
  f.submit();
}

// 방명록 탭
function guestbook(f) {
  let sessionIdx = document.getElementById("sessionIdx").value;
  let idx = document.getElementById("idx").value;

  // 비회원일 경우
  if (sessionIdx <= 0) {
    alert("로그인후 이용 가능합니다");
    return;
  }

  f.action = "guestbook.do";
  f.method = "GET";
  f.submit();
}

// textarea 글자 수 제한

// 입력 글자 수 제한
function check_length(area) {
  let text = area.value;
  let test_length = text.length;

  // 최대 글자수
  let max_length = 45;

  if (test_length > max_length) {
    alert(max_length + "자 이상 작성할 수 없습니다.");
    text = text.substr(0, max_length);
    /* substr() : 문자열에서 특정 부분만 골라낼 때 사용하는 메소드
            ??.substr(start, length)
            즉, 여기서는 0부터 45글자까지만 가져와서 text에 저장
            */
    area.value = text;
    /* text를 다시 area.value로 반환 */
    area.focus();
    /* 다시 area의 위치로 반환 */
  }
}

//네이버 로그아웃
let naverLogoutPopUp; // 팝업창 만들기
// 팝업창 열기 메소드
function naverOpenPopUp() {
  // 팝업창에 로그아웃 실행 기능 추가 - 네이버 로그아웃이 가능한 주소를 가져다 사용
  naverLogoutPopUp = window.open(
    "https://nid.naver.com/nidlogin.logout",
    "_blank",
    "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1"
  );
}
// 팝업창 닫기 메소드
function naverClosePopUp() {
  naverLogoutPopUp.close(); // 열린 팝업창을 다시 닫는 기능
}
// 네이버 로그아웃 실행 메소드
function naverLogout() {
  naverOpenPopUp(); // 팝업창 열기
  setTimeout(function () {
    naverClosePopUp(); // 팝업창 닫기
    location.href = "logout.do"; // 첫 페이지로 이동
  }, 500); // 팝업창 여는거부터 순차적으로 0.5초 간격으로 실행
}

// 카카오 로그아웃

let kakaoLogoutPopUp; // 팝업창 만들기
// 팝업창 열기 메소드
function kakaoOpenPopUp() {
  // 팝업창에 로그아웃 실행 기능 추가 - 카카오 로그아웃이 가능한 주소를 가져다 사용
  kakaoLogoutPopUp = window.open(
    "https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account",
    "_blank",
    "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1"
  );
}
// 팝업창 닫기 메소드
function kakaoClosePopUp() {
  kakaoLogoutPopUp.close(); // 열린 팝업창을 다시 닫는 기능
}
// 카카오 로그아웃 실행 메소드
function kakaoLogout() {
  kakaoOpenPopUp(); // 팝업창 열기
  setTimeout(function () {
    kakaoClosePopUp(); // 팝업창 닫기
    location.href = "logout.do"; // 첫 페이지로 이동
  }, 500); // 팝업창 여는거부터 순차적으로 0.5초 간격으로 실행
}

// 카카오 동의항목 해제
//// 카카오 로그인 API 검증
//window.Kakao.init("299930f187d00dde5908962ec35a19c9");
//// 카카오로그아웃
//function kakaoLinkLogout() {
//// AccessToken을 가지고 있는지 확인
//if (Kakao.Auth.getAccessToken()) {
//// 유저정보 받아오기
//Kakao.API.request({
//// url을 통해 현제 로그인한 사용자를 unlink한다.
//url: '/v1/user/logout',
//// 위에 코드가 성공하면 실행
//success: function (response) {
//// 로그아웃이 성공하면 이동할 페이지
//location.href = "logout.do";
//},
//fail: function (error) {
//console.log(error)
//},
//});
//// AccessToken을 "undefined"로 변경
//Kakao.Auth.setAccessToken(undefined)
//}
//}
