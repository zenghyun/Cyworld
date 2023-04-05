// 게시글 작성
function insert(f) {
  let galleryContent = f.galleryContent.value;
  let galleryTitle = f.galleryTitle.value;

  //유효성 체크
  if (galleryTitle == "") {
    alert("제목은 입력은 필수입니다");
    return;
  }
  if (galleryContent == "") {
    alert("내용 입력은 필수입니다");
    return;
  }

  f.action = "gallery_insert.do";
  f.submit();
}
