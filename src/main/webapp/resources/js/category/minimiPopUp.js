// 팝업 종료
function buyclose() {
  return window.close();
}

// 보유 미니미 checkbox 중복 체크 방지
function NoMultiChk1(chk) {
  let num = document.getElementsByName("minimi");

  for (let i = 0; i < num.length; i++) {
    if (num[i] != chk) {
      num[i].checked = false;
    }
  }
}

// 구매 미니미 checkbox 중복 체크 방지
function NoMultiChk2(chk) {
  let obj = document.getElementsByName("buyMinimiName");

  for (let i = 0; i < obj.length; i++) {
    if (obj[i] != chk) {
      obj[i].checked = false;
    }
  }
}

// 미니미 변경
function changeMinimi(f) {
  let minimi = f.minimi;

  for (let i = 0; i < minimi.length; i++) {
    if (minimi[i].checked == true) {
      f.action = "profile_minimi_change.do";
      f.method = "GET";
      f.submit();
      return;
    }
  }
}

// 미니미 구매
function purchaseMinimi(f) {
  let idx = f.idx.value;
  let buyMinimiName = f.buyMinimiName;
  let dotoryNum = f.dotoryNum.value;
  let price = f.price;

  for (let i = 0; i < buyMinimiName.length; i++) {
    if (buyMinimiName[i].checked == true) {
      // 보유 도토리 수가 미니미 가격보다 적을 경우
      if (price[i].value > dotoryNum) {
        alert("도토리가 부족합니다");
        return;
        // 보유 도토리 수가 미니미 가격보다 많을 경우
      } else {
        dotoryNum = dotoryNum - price[i].value;
        url = "profile_minimi_buy.do";
        param =
          "idx=" +
          idx +
          "&dotoryNum=" +
          dotoryNum +
          "&buyMinimiName=" +
          buyMinimiName[i].value;
        sendRequest(url, param, resultBuy, "GET");
        return;
      }
    }
  }
}

// 미니미 구매 콜백메소드
function resultBuy() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    let data = xhr.responseText;

    // 이미 구매한 미니미일 경우
    if (data == "no") {
      alert("이미 구매한 미니미입니다");
      return;
    }

    alert("구매 완료");
    location.href = "profile_minimi_popup.do?idx=${param.idx}";
  }
}
