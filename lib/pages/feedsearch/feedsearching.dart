import 'package:crepe/pages/feedsearch/feedsearchrecentkeyword.dart';
import 'package:crepe/pages/feedsearch/feedsearchresult.dart';
import 'package:crepe/util/AppPrefs.dart';
import 'package:flutter/material.dart';

class FeedSearching extends StatefulWidget {
  const FeedSearching({Key? key}) : super(key: key);
  @override
  State<FeedSearching> createState() => _FeedSearching();
}

class _FeedSearching extends State<FeedSearching> {
  var searchText = "";
  var txtC = TextEditingController();
  var isSearching = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            top: true,
            child: Container(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Column(children: [
                Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              child: Center(
                                  child: SizedBox(
                                width: 24,
                                height: 24,
                                child:
                                    Image.asset("assets/images/back_icon.png"),
                              )),
                            )),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                            flex: 1,
                            child: Container(
                                height: 40,
                                padding: EdgeInsets.only(right: 8),
                                child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                        filled: true,
                                        contentPadding: EdgeInsets.only(
                                            top: 14, left: 16, right: 10),
                                        fillColor:
                                            Color.fromRGBO(243, 247, 253, 1),
                                        hintText: "#키워드를 입력하세요.",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            isSearching
                                                ? Icons.close
                                                : Icons.search,
                                          ),
                                          onPressed: () {
                                            print(searchText);
                                            if (isSearching) {
                                              txtC.text = "";
                                              setState(() {
                                                isSearching = false;
                                                searchText = "";
                                              });
                                            } else {
                                              onSearch();
                                            }
                                          },
                                        )),
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 14,
                                      fontFamily: 'pretendard',
                                    ),
                                    textInputAction: TextInputAction.search,
                                    controller: txtC,
                                    onSubmitted: (value) {
                                      onSearch();
                                    },
                                    onChanged: (text) {
                                      setState(() {
                                        searchText = text;
                                      });
                                    })))
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: !isSearching
                      ? FeedSearchRecentKeyword(callback: setRencentSearchWord)
                      : FeedSearchResult(
                          searchText: searchText, callback: itemClicked),
                )
              ]),
            )));
  }

  void onSearch() {
    if (searchText.isEmpty) {
      return;
    }
    setRecentFeedSearch(searchText);
    setState(() {
      isSearching = true;
    });
  }

  void setRencentSearchWord(String rText) {
    txtC.text = rText;
    setState(() {
      searchText = rText;
    });
  }

  void itemClicked(Map<String, dynamic> itemData) {
    print(itemData);
  }
}
