import 'package:flutter/material.dart';
import 'package:capstone/model/size_config.dart';

class RecommandPage extends StatefulWidget {
  RecommandPage({Key key, this.darkMode}) : super(key: key);

  final darkMode;

  @override
  _RecommandPageState createState() => _RecommandPageState();
}

class _RecommandPageState extends State<RecommandPage> {
  String result = "";
  GlobalKey appBar = GlobalKey();

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
                      color: Color(0xffF47252),
                      fontFamily: 'Jalnan'),
                ),
              ),
              SizedBox(
                height: SizeConfig.standard2 * 0.19, //?0.2
              ),

              //? 메뉴뽑기 버튼
              // Container(
              //   height: SizeConfig.standard2 * 0.063, //0.053
              //   width: SizeConfig.standard * 0.8,
              //   child: FlatButton(
              //     splashColor: Color(0xffEE5732),
              //     highlightColor: Colors.transparent,
              //     color: Color(0xffF47252),
              //     onPressed: () {
              //       // takeFood();
              //       // print(widget.resultList);
              //       // print(widget.resultList.length);
              //     },
              //     child: Text('메뉴 뽑기',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: SizeConfig.standard * 0.06,
              //           height: 1.5,
              //           fontFamily: 'NanumGothic',
              //         )),
              //     shape: RoundedRectangleBorder(
              //         side: BorderSide(
              //             color: Color(0xffF47252),
              //             width: 1,
              //             style: BorderStyle.solid),
              //         borderRadius:
              //             BorderRadius.circular(SizeConfig.standard * 0.053)),
              //   ),
              // ),

              SizedBox(
                height: SizeConfig.standard2 * 0.019, //?0.039
              ),

              //?지도(comming soon)
              Container(
                height: SizeConfig.standard2 * 0.063, //0.053
                width: SizeConfig.standard * 0.8,
                child: TextButton(
                  // splashColor: Color(0xffEE5732),
                  // highlightColor: Colors.transparent,
                  // color: Color(0xffF47252), //Colors.black54,
                  onPressed: () {
                    // result == "" ? mapDialog() : null;
                  },
                  child: Text('주변 식당 찾기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.standard * 0.06,
                        height: 1.5,
                        fontFamily: 'NanumGothic',
                      )),
                  // shape: RoundedRectangleBorder(
                  //     side: BorderSide(
                  //         color: Colors.transparent,
                  //         width: 0,
                  //         style: BorderStyle.solid),
                  //     borderRadius:
                  //         BorderRadius.circular(SizeConfig.standard * 0.053)),
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
