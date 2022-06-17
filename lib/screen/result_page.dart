import 'package:flutter/material.dart';
import "dart:math";
import 'package:capstone/model/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key key, this.resultList, this.darkMode}) : super(key: key);

  //? 선택되어서 넘어온 음식 리스트(최종)
  final List resultList;

  final bool darkMode;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String result = "";
  String user = "qwe123@naver.com";
  String weather = "맑음";

  GlobalKey appBar = GlobalKey();

//? 리스트에서 음식 랜덤으로 뽑는 함수
  void takeFood() {
    setState(() {
      int randomIndex = Random().nextInt(widget.resultList.length);
      result = widget.resultList[randomIndex];
    });
  }

  double getHeights(GlobalKey key) {
    final RenderBox renderBox = key.currentContext.findRenderObject();
    final size = renderBox.size.height;
    // print('sizeRed = $sizeRed');
    return size;
  }

//? 메뉴 안뽑고 지도 찾을 때
  void mapDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(bottom: 0),
            shape: RoundedRectangleBorder(
                //side: BorderSide(color: Color(0xffF47252), width: 2),
                borderRadius: BorderRadius.circular(10.0)),

            //Dialog Main Title
            // title: Column(
            //   children: <Widget>[
            //     new Text("Dialog Title"),
            //   ],
            // ),
            //
            content: Container(
              //color: Colors.yellow,
              padding: EdgeInsets.only(
                top: SizeConfig.standard2 * 0.04,
                right: SizeConfig.standard * 0.02,
                left: SizeConfig.standard * 0.02,
              ),

              child: Text(
                "메뉴를 먼저 뽑아주세요!",
                style: TextStyle(
                  fontSize: SizeConfig.standard * 0.05,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            actions: <Widget>[
              Container(
                //color: Colors.black,
                child: TextButton(
                  // splashColor: Colors.transparent,
                  child: Text(
                    "확인",
                    style: TextStyle(
                      fontSize: SizeConfig.standard * 0.053,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF47252),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          key: appBar,
          centerTitle: true,
          backgroundColor: Color(0xffF47252),
          title: Text(
            "뭐먹게?",
            style: TextStyle(
              fontSize: SizeConfig.standard * 0.053,
            ),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.menu),
          //     color: Colors.white,
          //     iconSize: 30,
          //     onPressed: () {
          //       //openEndDrawer(); //drawer 펼치기
          //     },
          //   ),
          // ],
        ),
        body: Container(
          width: SizeConfig.standard,
          color: widget.darkMode ? Color(0xff282828) : Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.standard2 * 0.19,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: SizeConfig.standard * 0.12),
                child: Text(
                  "오늘은",
                  style: TextStyle(
                      fontSize: SizeConfig.standard * 0.1,
                      color: Color(0xffF47252),
                      fontFamily: 'Jalnan'),
                ),
              ),
              SizedBox(
                height: SizeConfig.standard2 * 0.04,
              ),

              //? 결과창
              Container(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  width: SizeConfig.standard * 0.76, //0.8
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5.0,
                      color: Color(0xffF47252),
                    ),
                  ),
                  child: Center(
                    child: result == ""
                        ? Text(
                            "없다",
                            style: TextStyle(
                                fontSize: SizeConfig.standard * 0.1,
                                color: widget.darkMode
                                    ? Color(0xff282828)
                                    : Colors.white,
                                fontFamily: 'Jalnan'),
                          )
                        : Text(
                            result,
                            style: TextStyle(
                                fontSize: SizeConfig.standard * 0.1,
                                color: widget.darkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Jalnan'),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.standard2 * 0.03,
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: SizeConfig.standard * 0.12),
                child: Text(
                  "먹을까?",
                  style: TextStyle(
                      fontSize: SizeConfig.standard * 0.1,
                      color: const Color(0xffF47252),
                      fontFamily: 'Jalnan'),
                ),
              ),
              SizedBox(
                height: SizeConfig.standard2 * 0.19, //?0.2
              ),

              //? 메뉴뽑기 버튼
              Container(
                height: SizeConfig.standard2 * 0.063, //0.053
                width: SizeConfig.standard * 0.8,
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xffF47252),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(
                              SizeConfig.standard * 0.053)),
                      backgroundColor: const Color(0xffF47252)),
                  // splashColor: Color(0xffEE5732),
                  // highlightColor: Colors.transparent,
                  // color: Color(0xffF47252),
                  onPressed: () {
                    takeFood();
                    // print(widget.resultList);
                    // print(widget.resultList.length);
                  },
                  child: Text('메뉴 뽑기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.standard * 0.06,
                        height: 1.5,
                        fontFamily: 'NanumGothic',
                      )),
                ),
              ),

              SizedBox(
                height: SizeConfig.standard2 * 0.019, //?0.039
              ),

              //?지도(comming soon)
              Container(
                height: SizeConfig.standard2 * 0.063, //0.053
                width: SizeConfig.standard * 0.8,
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xffF47252),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(
                              SizeConfig.standard * 0.053)),
                      backgroundColor: const Color(0xffF47252)),
                  // splashColor: Color(0xffEE5732),
                  // highlightColor: Colors.transparent,
                  // color: Color(0xffF47252), //Colors.black54,
                  onPressed: () {
                    result == ""
                        ? mapDialog()
                        : firestore.collection('data').doc(user).set({
                            'menu': result,
                            'weather': weather,
                          });
                  },
                  child: Text('주변 식당 찾기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.standard * 0.06,
                        height: 1.5,
                        fontFamily: 'NanumGothic',
                      )),
                ),
              ),

              //?밑에 간격
              // Container(
              //   height: SizeConfig.standard2 * 0.055,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
