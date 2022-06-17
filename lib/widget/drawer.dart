import 'package:flutter/material.dart';
import 'package:capstone/model/size_config.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.standard * 0.585, //drawer 폭 크기
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: SizeConfig.standard2 * 0.063,
              width: SizeConfig.standard * 0.8,
              child: TextButton(
                // splashColor: Color(0xffEE5732),
                // highlightColor: Colors.transparent,
                // color: Color(0xffF47252),
                onPressed: () {},
                child: Text('선택 완료',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.standard * 0.06,
                      height: 1.5,
                    )),
                // shape: RoundedRectangleBorder(
                //     side: BorderSide(
                //         color: Color(0xffF47252),
                //         width: 1,
                //         style: BorderStyle.solid),
                //     borderRadius:
                //         BorderRadius.circular(SizeConfig.standard * 0.053)),
              ),
            ),
          ],
          // padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
