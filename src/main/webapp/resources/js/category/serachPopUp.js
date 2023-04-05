// 유저 검색
function search(f) {
  f.action = "main_search.do";
  f.method = "GET";
  f.submit();
}

// 팝업창 닫기
function searchClick() {
  return window.close();
}
 