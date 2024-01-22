import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getRecentFeedSearch() async {
  List<String>? rList = [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  rList = prefs.getStringList("recentfsearchword");
  if (rList == null) {
    return [];
  } else {
    return rList;
  }
}

void setRecentFeedSearch(String stext) async {
  List<String> tList = [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? rList = prefs.getStringList("recentfsearchword");
  if (rList != null) {
    tList = rList;
    for (var i = 0; i < tList.length; i++) {
      if (tList[i] == stext) {
        tList.removeAt(i);
        break;
      }
    }
    if (tList.length > 20) {
      tList.removeLast();
    }
  }
  tList.insert(0, stext);
  print(tList);
  prefs.setStringList("recentfsearchword", tList);
}
