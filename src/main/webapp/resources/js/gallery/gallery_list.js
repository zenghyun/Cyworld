// bgm 재생

//Audio 사용을 위한 객체 생성
let audio = new Audio();
//오디오가 참조하는 노래 주소 지정
audio.src = "/cyworld/resources/sound/main.mp3";
myAudio.loop = true; //노래가 끝나도 loop가 가능하게 설정
audio.play();
audio.volume = 3;

// 게시글 삭제
function del(f) {
  if (!confirm("정말 삭제하시겠습니까?")) {
    return;
  }

  var url = "gallery_delete.do";
  var param =
    "galleryIdx=" +
    f.galleryIdx.value +
    "&galleryContentRef=" +
    f.galleryContentRef.value;
  sendRequest(url, param, resultDel, "GET");
}

// 게시글 삭제 콜백메소드
function resultDel() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    var data = xhr.responseText;

    if (data == "no") {
      alert("삭제 실패");
      return;
    }

    alert("삭제성공");
    location.href = "gallery.do?idx=${param.idx}";
  }
}

// 게시글 수정
function modify(f) {
  f.action = "gallery_modify_form.do";
  f.method = "GET";
  f.submit();
}

// 좋아요 기능

// 게시글 좋아요
function like(f) {
  let galleryIdx = f.galleryIdx.value;
  let galleryContentRef = f.galleryContentRef.value;

  let url = "gallery_like.do";
  let param =
    "galleryIdx=" + galleryIdx + "&galleryContentRef=" + galleryContentRef;
  sendRequest(url, param, resultLike, "GET");
}
// 게시글 좋아요 콜백메소드
function resultLike() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    // Controller에서 보낸 VO가 JSON형태로 들어온다
    let data = xhr.responseText;

    // JSON형태로 들어온 data를 실제 JSON타입으로 변경
    var json = new Function("return" + data)();

    // 게시글 번호 - name으로 가져와 배열로 생성
    let galleryContentRef = document.getElementsByName("galleryContentRef");

    // 가져온 게시글 번호로 for문 생성
    for (let i = 0; i < galleryContentRef.length; i++) {
      // VO로 가져온 정보중 게시글 번호를 가져와 일치하는 게시글이 나올때까지 for문을 돌린다
      if (galleryContentRef[i].value == json.galleryContentRef) {
        // 좋아요 수가 작성되는곳을 id로 가져오는데 추가로 같이 작성한 숫자로 어느 게시글의 좋아요인지 찾는다
        let galleryLikeNum = document.getElementById("galleryLikeNum" + i);
        // VO로 가져온 정보중 좋아요 수를 가져와 작성한다
        galleryLikeNum.innerText = json.galleryLikeNum;
      }
    }
  }
}

// 댓글 기능

// 댓글 작성
function reply(f) {
  let galleryCommentIdx = f.galleryCommentIdx.value;
  let galleryCommentRef = f.galleryCommentRef.value;
  let galleryCommentName = f.galleryCommentName.value;
  let galleryCommentContent = f.galleryCommentContent.value;

  //유효성 체크

  if (galleryCommentContent == "") {
    alert("댓글을 작성해주세요.");
    return;
  }

  url = "comment_insert.do";
  param =
    "galleryCommentIdx=" +
    galleryCommentIdx +
    "&galleryCommentRef=" +
    galleryCommentRef +
    "&galleryCommentContent=" +
    galleryCommentContent +
    "&galleryCommentName=" +
    galleryCommentName;
  sendRequest(url, param, resultWrite, "GET");
}

// 댓글 작성 콜백메소드
function resultWrite() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    let data = xhr.responseText;

    if (data == "no") {
      alert("작성 실패");
      return;
    }

    alert("작성 완료");
    location.href = "gallery.do?idx=${param.idx}";
  }
}

// 댓글 삭제
function gcdel(f) {
  if (!confirm("정말 삭제하시겠습니까?")) {
    return;
  }

  var url = "gcomment_delete.do";
  var param =
    "galleryCommentRef=" +
    f.galleryCommentRef.value +
    "&galleryCommentIdx=" +
    f.galleryCommentIdx.value +
    "&galleryNum=" +
    f.galleryNum.value;
}
// 댓글 삭제 콜백메소드
function resultgcDel() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    var data = xhr.responseText;

    if (data == "no") {
      alert("삭제 실패");
      return;
    }

    alert("삭제성공");
    location.href = "gallery.do?idx=${param.idx}";
  }
}

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
