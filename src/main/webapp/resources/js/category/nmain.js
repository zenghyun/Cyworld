// 검색 팝업창
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

// 로그인
function goLogin() {
  location.href = "logout.do";
}

// 회원가입
function memberJoin() {
  location.href = "login_authentication.do?platform=cyworld";
}
