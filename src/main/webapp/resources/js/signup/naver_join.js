window.onload = function () {
  document
    .getElementsByClassName("address_kakao")[0]
    .addEventListener("click", function () {
      //주소 입력칸을 클릭하면
      new daum.Postcode({
        oncomplete: function (data) {
          //선택시 입력값 세팅
          document.getElementsByClassName("address_kakao")[0].value =
            data.address; // 주소 넣기
          document.getElementsByClassName("address_kakao")[2].focus(); //상세입력 포커싱
        },
      }).open();
    });
  document
    .getElementsByClassName("address_kakao")[1]
    .addEventListener("click", function () {
      //주소 버튼을 클릭
      new daum.Postcode({
        oncomplete: function (data) {
          //선택시 입력값 세팅
          document.getElementsByClassName("address_kakao")[0].value =
            data.address; // 주소 넣기
          document.getElementsByClassName("address_kakao")[2].focus(); //상세입력 포커싱
        },
      }).open();
    });
};

// 휴대폰용 자동 하이픈
function phoneAutoHyphen(str) {
  str = str.replace(/[^0-9]/g, ""); // 입력값에 숫자만 적용
  let tmp = "";
  if (str.length < 4) {
    // 입력값이 4자리보다 작을시
    return str;
  } else if (str.length < 7) {
    // 입력값이 7자리보다 작을시
    tmp += str.substr(0, 3);
    tmp += "-";
    tmp += str.substr(3);
    return tmp;
  } else if (str.length < 11) {
    // 입력값이 11자리보다 작을시
    tmp += str.substr(0, 3); // 000
    tmp += "-"; // 000-
    tmp += str.substr(3, 3); // 000-000
    tmp += "-"; // 000-000-
    tmp += str.substr(6); // 000-000-0000
    return tmp;
  } else {
    // 입력값이 11자리일시
    tmp += str.substr(0, 3); // 000
    tmp += "-"; // 000-
    tmp += str.substr(3, 4); // 000-0000
    tmp += "-"; // 000-0000-
    tmp += str.substr(7); // 000-0000-0000
    return tmp;
  }
  return str;
}
// 휴대폰 입력값 가져오기
const phoneNumber = document.getElementById("phoneNumber");
phoneNumber.onkeyup = function (event) {
  // 값을 입력시 발동
  event = event || window.event;
  let val = this.value.trim(); // 입력값 가져오기
  this.value = phoneAutoHyphen(val); // 입력값에 자동 하이픈 메소드 적용
};

// 주민번호용 자동 하이픈
function identityAutoHyphen(str) {
  str = str.replace(/[^0-9]/g, ""); // 입력값에 숫자만 적용
  let tmp = "";
  if (str.length < 7) {
    // 입력값이 7자리보다 작을시
    return str;
  } else {
    // 입력값이 13자리일시
    tmp += str.substr(0, 6); // 000000
    tmp += "-"; // 000000-
    tmp += str.substr(6); // 000000-0000000
    return tmp;
  }
  return str;
}
// 주민번호 입력값 가져오기
const identityNum = document.getElementById("identityNum");
identityNum.onkeyup = function (event) {
  // 값을 입력시 발동
  event = event || window.event;
  let val = this.value.trim(); // 입력값 가져오기
  this.value = identityAutoHyphen(val); // 입력값에 자동 하이픈 메소드 적용
};

// 비밀번호가 패턴에 맞는지 확인용
function pwCheck() {
  let pwText = document.getElementsByClassName("pwText"); // 비밀번호 아래에 글이 작성될 <div>
  let pw = document.getElementById("pw").value; // 비밀번호 값

  let pattern1 = /[0-9]/; // 숫자 입력
  let pattern2 = /[a-zA-Z]/; // 영어 소문자, 대문자 입력
  let pattern3 = /[~!@#$%^&*()_+]/; // 특수기호 입력

  // 비밀번호가 패턴에 하나라도 맞지 않을때
  //      숫자 입력 안할시    or    영어 입력 안할시    or  특수기호 입력 안할시   or 8자리 보다 작을시
  if (
    !pattern1.test(pw) ||
    !pattern2.test(pw) ||
    !pattern3.test(pw) ||
    pw.length < 8
  ) {
    // 비밀번호 입력창에 입력하자마자 바로 아래에 글 작성
    pwText[0].innerHTML =
      "영문 + 숫자 + 특수기호 8자리 이상으로 구성하여야 합니다";
  } else {
    // 비밀번호 입력창에 입력하자마자 바로 아래에 글 작성
    pwText[0].innerHTML = "";
  }
}

// 비밀번호와 비밀번호 확인이 동일한지 확인용
function pw2Check() {
  let pwText = document.getElementsByClassName("pwText"); // 비밀번호 아래에 글이 작성될 <div>
  let pw = document.getElementById("pw").value; // 비밀번호 값
  let pw2 = document.getElementById("pw2").value; // 비밀번호 확인 값

  // 비밀번호와 비밀번호 확인이 서로 맞지 않을때
  if (pw != pw2) {
    // 비밀번호 확인창에 입력하자마자 바로 아래에 글 작성
    pwText[1].innerHTML = "비밀번호가 일치하지 않습니다";
  } else {
    // 비밀번호 확인창에 입력하자마자 바로 아래에 글 작성
    pwText[1].innerHTML = "";
  }
}

// DB저장하러 이동
function join(f) {
  // 회원가입 정보
  let name = f.name.value;
  let identityNum = f.identityNum.value;
  let gender = f.gender.value;
  let email = f.email.value;
  let phoneNumber = f.phoneNumber.value;
  let address = f.address.value;
  let addressDetail = f.addressDetail.value;
  let platform = f.platform.value;

  // 유효성 검사

  if (identityNum == "") {
    alert("주민번호를 입력하세요");
    return;
  }
  if (phoneNumber == "") {
    alert("휴대전화 번호를 입력하세요");
    return;
  }
  if (address == "") {
    alert("주소를 입력하세요");
    return;
  }
  if (addressDetail == "") {
    alert("상세 주소를 입력하세요");
    return;
  }

  url = "welcome.do";
  param =
    "name=" +
    name +
    "&identityNum=" +
    identityNum +
    "&gender=" +
    gender +
    "&email=" +
    email +
    "&phoneNumber=" +
    phoneNumber +
    "&address=" +
    address +
    "&addressDetail=" +
    addressDetail +
    "&platform=" +
    platform;
  sendRequest(url, param, resultJoin, "POST");
}
// 회원가입 콜백메소드
function resultJoin() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    let data = xhr.responseText;

    if (data == "no") {
      alert("가입된 회원정보가 있습니다");
      alert("로그인 혹은 아이디/비밀번호 찾기를 이용해주세요");
      location.href = "login.do";
    } else {
      alert("가입이 완료되었습니다");
      alert("로그인 페이지로 이동합니다");
      location.href = "login.do";
    }
  }
}

//</div> 네이버 로그아웃
let naverLogoutPopUp; // 팝업창 만들기
function naverOpenPopUp() {
  // 팝업 열기 메소드
  // 팝업에 로그아웃 실행 기능 추가 - 네이버 로그아웃이 가능한 주소를 가져다 사용
  naverLogoutPopUp = window.open(
    "https://nid.naver.com/nidlogin.logout",
    "_blank",
    "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1"
  );
}
function naverClosePopUp() {
  // 팝업 닫기 메소드
  naverLogoutPopUp.close(); // 열린 팝업창을 다시 닫는 기능
}
function naverLogout() {
  naverOpenPopUp(); // 팝업 열기
  setTimeout(function () {
    naverClosePopUp(); // 팝업 닫기
    location.href = "logout.do"; // 첫 페이지로 이동
  }, 500); // 팝업 여는거부터 순차적으로 0.5초 간격으로 실행
}
