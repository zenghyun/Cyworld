// PW 찾기
function findPW(f) {
  let name = f.name.value;
  let userID = f.userID.value;
  let email = f.email.value;

  // 유효성 검사

  if (name == "") {
    alert("이름을 입력하세요");
    return;
  }
  if (userID == "") {
    alert("아이디를 입력하세요");
    return;
  }
  if (email == "") {
    alert("이메일을 입력하세요");
    return;
  }

  let url = "findPwCheck.do";
  let param =
    "name=" +
    name +
    "&userID=" +
    userID +
    "&email=" +
    encodeURIComponent(email);
  sendRequest(url, param, resultPw, "POST");
}

// PW 찾기 콜백메소드
function resultPw() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    let data = xhr.responseText;

    if (data == "no") {
      alert("해당 ID로 가입된 정보가 없습니다");
      return;
    }

    alert("메일로 임시비밀번호 발급이 완료되었습니다");
    location.href = "login.do";
  }
}
