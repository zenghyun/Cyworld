// 방명록 작성
function send(f) {
  f.action = "guestbook_insert.do";
  f.method = "GET";
  f.submit();
}
