String getTodayString() {
  var now = new DateTime.now();
  var weeklist = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"];
  return "${now.year}년 ${now.month}월 ${now.day}일 ${weeklist[now.weekday - 1]}";
}

String getCurrentTimeString() {
  var now = new DateTime.now();
  var hour = now.hour;
  var ampmStr = "";
  if (hour > 12) {
    hour = hour - 12;
    ampmStr = "pm";
  } else {
    ampmStr = "am";
  }
  var hourStr = hour > 9 ? "${hour}" : "${hour}";
  var minStr = now.hour > 9 ? "${now.hour}" : "0${now.hour}";
  return "${hourStr}:${minStr}${ampmStr}";
}
