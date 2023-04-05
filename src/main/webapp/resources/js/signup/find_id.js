// ID 찾기
function findID(f) {
  let name = f.name.value;
  let phoneNumber = f.phoneNumber.value;

  // 유효성 검사

  if (name == "") {
    alert("이름을 입력하세요");
    return;
  }
  if (phoneNumber == "") {
    alert("휴대전화 번호를 입력하세요");
    return;
  }

  let url = "findIdCheck.do";
  let param = "name=" + name + "&phoneNumber=" + phoneNumber;
  sendRequest(url, param, resultId, "POST");
}
// ID 찾기 콜백메소드
function resultId() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    let data = xhr.responseText;

    if (data == "no") {
      alert("아이디를 찾지 못하였습니다");
      return;
    }

    alert("아이디는 '" + data + "' 입니다");
    location.href = "login.do";
  }
}

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
