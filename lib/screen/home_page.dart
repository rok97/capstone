import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:randommenu/ad_manager.dart';
import 'package:capstone/model/size_config.dart';
import 'package:capstone/screen/login_page.dart';
import 'package:capstone/screen/result_page.dart';
import 'package:capstone/screen/recommand_page.dart';
import 'package:capstone/screen/map_page.dart';
import 'package:capstone/widget/all_circle.dart';
// import 'package:randommenu/widget/drawer.dart';
import 'package:capstone/widget/food_circle.dart';
import 'package:capstone/food_list.dart';
//import 'package:admob_flutter/admob_flutter.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({Key key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  GlobalKey appBar = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Color appcolor = Colors.white;

//?전체선택 누르는거
  int allClicked = 0;

//?일반 누르는거
  int restClicked = 0;

//?다크모드
  bool darkMode = false;

//? 앱바 높이
  var height = AppBar().preferredSize.height;

  bool listenFromAll = false;
  bool listenFromMe = false;
  List<bool> tagArr = List.filled(40, false);

//? 결과 페이지로 넘어가는 리스트
  List resultList = [];

//? 3개 눌린거 판단하는 함수
  void isThreeClicked() {
    setState(() {
      if (tagArr.where((item) => item == true).length >= 3) {
        listenFromAll = true;
      } else
        listenFromAll = false;
    });
  }

//? 앱바 높이 가져오는 함수
  double getHeights() {
    final RenderBox renderBox = appBar.currentContext.findRenderObject();
    final size = renderBox.size.height;
    return size;
  }

//? 다크모드 유무
  // void darkModeCheck() {
  //   if (darkMode == true) {
  //     appcolor = Color(0xff282828);
  //   } else {
  //     appcolor = Colors.white;
  //   }
  // }

//? 다이얼로그(체크 안하고 선택완료 눌렀을 때 뜨는거)
  void flutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(bottom: 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              //color: Colors.yellow,
              padding: EdgeInsets.only(
                top: SizeConfig.standard2 * 0.04,
                right: SizeConfig.standard * 0.04,
                left: SizeConfig.standard * 0.04,
              ),

              child: Text(
                "최소 한 개 이상 선택해 주세요!",
                style: TextStyle(
                  fontSize: SizeConfig.standard * 0.05,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            actions: <Widget>[
              Container(
                child: TextButton(
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

  //? 추천 받기 다이얼로그(체크 하고 선택완료 눌렀을 때 뜨는거)
  void recommandDialog() {
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
                right: SizeConfig.standard * 0.04,
                left: SizeConfig.standard * 0.04,
              ),

              child: Text(
                "선택을 모두 해제해주세요!",
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
    FirebaseAuth.instance.authStateChanges();
    SizeConfig().init(context);
    //darkModeCheck();
    return Scaffold(
        key: _scaffoldKey,
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
          actions: <Widget>[
            // Center(
            //   child: InkWell(
            //     child: Text("Theme"),
            //     onTap: () {
            //       setState(() {
            //         darkMode = !darkMode;
            //       });
            //     },
            //   ),
            // )
            IconButton(
              padding: EdgeInsets.only(
                  right: SizeConfig.standard * 0.035,
                  bottom: SizeConfig.standard * 0.01),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: darkMode
                  ? const Icon(Icons.brightness_5)
                  : const Icon(
                      Icons.brightness_3,
                      color: Colors.black,
                    ),
              color: Colors.white,
              iconSize: SizeConfig.standard * 0.065,
              onPressed: () {
                setState(() {
                  darkMode = !darkMode;
                });

                //_scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ],
        ),
        //?drawer
        //endDrawer: MyDrawer(),
        body: Container(
          height: SizeConfig.standard2,
          width: SizeConfig.standard,
          color: darkMode ? const Color(0xff282828) : Colors.white,
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.standard2 * 0.05,
                ),

                //? 문구
                Container(
                  child: Text(
                    "최대 3가지 선택 후에 \n'선택 완료' 버튼을 눌러주세요",
                    style: TextStyle(
                        fontSize: SizeConfig.standard * 0.045,
                        color: const Color(0xffF47252),
                        height: 1.4),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(
                  height: SizeConfig.standard2 * 0.05,
                ),

                //? 원 3개
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.standard * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //? 전체선택
                      AllCirlcle(
                        name: "전체선택",
                        photoPath: "images/all.jpg",
                        allClickChanged: (value) {
                          //? 눌렀을때
                          if (value) {
                            for (int i = 0; i < tagArr.length; i++) {
                              tagArr[i] = false;
                            }
                            isThreeClicked();
                            allClicked = 1;
                            restClicked = 0;

                            resultList = [];
                            resultList = FoodList.all;
                          } else {
                            for (int i = 0; i < tagArr.length; i++) {
                              tagArr[i] = false;
                            }
                            isThreeClicked();
                            allClicked = 0;
                            resultList = [];
                          }
                        },
                        alltest: restClicked == 1 ? false : true,
                        darkMode: darkMode,
                      ),

                      //?한식
                      FoodCircle(
                        name: "한식",
                        photoPath: "images/korean.jpg",
                        onClickChanged: (val) {
                          tagArr[1] = val;
                          isThreeClicked();
                          if (val) {
                            //?전체선택 눌려있을때 누르면
                            if (allClicked == 1) {
                              restClicked = 1;
                              allClicked = 0;
                              resultList = [];
                              resultList.addAll(FoodList.korean);
                            }
                            //? 그냥 눌렀을때
                            else {
                              restClicked = 1;
                              resultList.addAll(FoodList.korean);
                            }
                          } else {
                            restClicked = 0;
                            for (int i = 0; i < FoodList.korean.length; i++) {
                              resultList.remove(FoodList.korean[i]);
                            }
                          }
                        },
                        listenFromAll: listenFromAll,
                        listenFromMe: tagArr[1],
                        //listenFromMe: tagArr[0] ? false : tagArr[1],
                        tagArr: tagArr,
                        all: allClicked == 1 ? false : true,
                        darkMode: darkMode,
                      ),

                      //? 중식
                      FoodCircle(
                        name: "중식",
                        photoPath: "images/chinese.jpg",
                        onClickChanged: (val) {
                          tagArr[2] = val;
                          isThreeClicked();

                          if (val) {
                            //?전체선택 눌려있을때 누르면
                            if (allClicked == 1) {
                              restClicked = 1;
                              allClicked = 0;
                              resultList = [];
                              resultList.addAll(FoodList.chinese);
                            }
                            //? 그냥 눌렀을때
                            else {
                              restClicked = 1;
                              resultList.addAll(FoodList.chinese);
                            }
                          } else {
                            restClicked = 0;
                            for (int i = 0; i < FoodList.chinese.length; i++) {
                              resultList.remove(FoodList.chinese[i]);
                            }
                          }

                          // if (val) {
                          //   if (testnumber == 1) {
                          //     //? 아무것도 안함
                          //   } else {
                          //     print("중식눌림");
                          //     resultList.addAll(chinese);
                          //   }
                          // } else {
                          //   print("중식풀림------");
                          //   for (int i = 0; i < chinese.length; i++) {
                          //     resultList.remove(chinese[i]);
                          //   }
                          // }
                        },
                        listenFromAll: listenFromAll,
                        listenFromMe: tagArr[2],
                        tagArr: tagArr,
                        all: allClicked == 1 ? false : true,
                        darkMode: darkMode,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: SizeConfig.standard2 * 0.025,
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.standard * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //? 일식
                      FoodCircle(
                        name: "일식",
                        photoPath: "images/japanese.jpg",
                        onClickChanged: (val) {
                          tagArr[3] = val;
                          isThreeClicked();

                          if (val) {
                            //?전체선택 눌려있을때 누르면
                            if (allClicked == 1) {
                              restClicked = 1;
                              allClicked = 0;
                              resultList = [];
                              resultList.addAll(FoodList.japanese);
                            }
                            //? 그냥 눌렀을때
                            else {
                              restClicked = 1;
                              resultList.addAll(FoodList.japanese);
                            }
                          } else {
                            restClicked = 0;
                            for (int i = 0; i < FoodList.japanese.length; i++) {
                              resultList.remove(FoodList.japanese[i]);
                            }
                          }
                        },
                        listenFromAll: listenFromAll,
                        listenFromMe: tagArr[3],
                        tagArr: tagArr,
                        all: allClicked == 1 ? false : true,
                        darkMode: darkMode,
                      ),

                      //? 양식
                      FoodCircle(
                        name: "양식",
                        photoPath: "images/western.jpg",
                        onClickChanged: (val) {
                          tagArr[4] = val;
                          isThreeClicked();

                          if (val) {
                            //?전체선택 눌려있을때 누르면
                            if (allClicked == 1) {
                              restClicked = 1;
                              allClicked = 0;
                              resultList = [];
                              resultList.addAll(FoodList.western);
                            }
                            //? 그냥 눌렀을때
                            else {
                              restClicked = 1;
                              resultList.addAll(FoodList.western);
                            }
                          } else {
                            restClicked = 0;
                            for (int i = 0; i < FoodList.western.length; i++) {
                              resultList.remove(FoodList.western[i]);
                            }
                          }
                        },
                        listenFromAll: listenFromAll,
                        listenFromMe: tagArr[4],
                        tagArr: tagArr,
                        all: allClicked == 1 ? false : true,
                        darkMode: darkMode,
                      ),

                      //? 분식
                      FoodCircle(
                        name: "분식",
                        photoPath: "images/bunsik.jpg",
                        onClickChanged: (val) {
                          tagArr[5] = val;
                          isThreeClicked();

                          if (val) {
                            //?전체선택 눌려있을때 누르면
                            if (allClicked == 1) {
                              restClicked = 1;
                              allClicked = 0;
                              resultList = [];
                              resultList.addAll(FoodList.bunsik);
                            }
                            //? 그냥 눌렀을때
                            else {
                              restClicked = 1;
                              resultList.addAll(FoodList.bunsik);
                            }
                          } else {
                            restClicked = 0;
                            for (int i = 0; i < FoodList.bunsik.length; i++) {
                              resultList.remove(FoodList.bunsik[i]);
                            }
                          }
                        },
                        listenFromAll: listenFromAll,
                        listenFromMe: tagArr[5],
                        tagArr: tagArr,
                        all: allClicked == 1 ? false : true,
                        darkMode: darkMode,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: SizeConfig.standard2 * 0.025,
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.standard * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //? 야식
                      FoodCircle(
                        name: "야식",
                        photoPath: "images/night.jpg",
                        onClickChanged: (val) {
                          tagArr[6] = val;
                          isThreeClicked();

                          if (val) {
                            //?전체선택 눌려있을때 누르면
                            if (allClicked == 1) {
                              restClicked = 1;
                              allClicked = 0;
                              resultList = [];
                              resultList.addAll(FoodList.night);
                            }
                            //? 그냥 눌렀을때
                            else {
                              restClicked = 1;
                              resultList.addAll(FoodList.night);
                            }
                          } else {
                            restClicked = 0;
                            for (int i = 0; i < FoodList.night.length; i++) {
                              resultList.remove(FoodList.night[i]);
                            }
                          }
                        },
                        listenFromAll: listenFromAll,
                        listenFromMe: tagArr[6],
                        tagArr: tagArr,
                        all: allClicked == 1 ? false : true,
                        darkMode: darkMode,
                      ),

                      //? 패스트푸드
                      FoodCircle(
                        name: "패스트푸드",
                        photoPath: "images/fastfood.jpg",
                        onClickChanged: (val) {
                          tagArr[7] = val;
                          isThreeClicked();

                          if (val) {
                            //?전체선택 눌려있을때 누르면
                            if (allClicked == 1) {
                              restClicked = 1;
                              allClicked = 0;
                              resultList = [];
                              resultList.addAll(FoodList.fastfood);
                            }
                            //? 그냥 눌렀을때
                            else {
                              restClicked = 1;
                              resultList.addAll(FoodList.fastfood);
                            }
                          } else {
                            restClicked = 0;
                            for (int i = 0; i < FoodList.fastfood.length; i++) {
                              resultList.remove(FoodList.fastfood[i]);
                            }
                          }
                        },
                        listenFromAll: listenFromAll,
                        listenFromMe: tagArr[7],
                        tagArr: tagArr,
                        all: allClicked == 1 ? false : true,
                        darkMode: darkMode,
                      ),

                      //? 아시안
                      FoodCircle(
                        name: "아시안푸드",
                        photoPath: "images/asian.jpg",
                        onClickChanged: (val) {
                          tagArr[8] = val;
                          isThreeClicked();

                          if (val) {
                            //?전체선택 눌려있을때 누르면
                            if (allClicked == 1) {
                              restClicked = 1;
                              allClicked = 0;
                              resultList = [];
                              resultList.addAll(FoodList.asian);
                            }
                            //? 그냥 눌렀을때
                            else {
                              restClicked = 1;
                              resultList.addAll(FoodList.asian);
                            }
                          } else {
                            restClicked = 0;
                            for (int i = 0; i < FoodList.asian.length; i++) {
                              resultList.remove(FoodList.asian[i]);
                            }
                          }
                        },
                        listenFromAll: listenFromAll,
                        listenFromMe: tagArr[8],
                        tagArr: tagArr,
                        all: allClicked == 1 ? false : true,
                        darkMode: darkMode,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: SizeConfig.standard2 * 0.085,
                ),

                // AdmobBanner(
                //     adUnitId: AdManager.bannerId, adSize: AdmobBannerSize.BANNER),

                //? 밑에 버튼 2개
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //? 추천 받기 버튼
                    Container(
                      height: SizeConfig.standard2 * 0.063,
                      width: SizeConfig.standard * 0.4,
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
                        onPressed: () {
                          // resultList.length != 0
                          //     ? recommandDialog()
                          //     : Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => MapPage(
                          //                 // darkMode: darkMode,
                          //                 )),
                          //       );
                        },
                        child: Text('추천 받기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.standard * 0.06,
                              height: 1.5,
                            )),
                      ),
                    ),

                    //? 가운데 간격
                    SizedBox(
                      width: SizeConfig.standard * 0.03,
                    ),

                    //? 랜덤 선택
                    Container(
                      height: SizeConfig.standard2 * 0.063,
                      width: SizeConfig.standard * 0.4,
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
                        onPressed: () {
                          resultList.isEmpty
                              ? flutterDialog()
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultPage(
                                            resultList: resultList,
                                            darkMode: darkMode,
                                          )),
                                );
                        },
                        child: Text('랜덤 선택',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.standard * 0.06,
                              height: 1.5,
                            )),
                      ),
                    ),
                  ],
                ),

                //?밑에 간격
                // Container(
                //   height: SizeConfig.standard2 * 0.055,
                //   color: Colors.black,
                // ),
              ],
            ),
          ),
        ));
  }
}
