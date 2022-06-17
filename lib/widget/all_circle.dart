import 'package:flutter/material.dart';
import 'package:capstone/model/size_config.dart';

//! 전체선택 버튼
class AllCirlcle extends StatefulWidget {
  final String name;
  final String photoPath;
  final ValueChanged<bool> allClickChanged;
  final bool alltest;
  final bool darkMode;

  const AllCirlcle(
      {Key key,
      this.name,
      this.photoPath,
      this.allClickChanged,
      this.alltest,
      this.darkMode})
      : super(key: key);

  @override
  AllCirlcleState createState() => AllCirlcleState();
}

class AllCirlcleState extends State<AllCirlcle> {
  bool allpressed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.alltest == false) {
      allpressed = false;
    }
    return Column(
      children: [
        InkWell(
          //! 버튼 위젯 자체의 기능
          onTap: () {
            setState(() {
              allpressed = !allpressed;
              widget.allClickChanged(allpressed);
              // FoodCircleState.onpressed = false;
            });
          },
          child: Container(
              height: SizeConfig.standard2 * 0.112,
              width: SizeConfig.standard2 * 0.112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xffF47252),
                  width: 2,
                ),
                image: DecorationImage(
                  image: AssetImage(
                    "${widget.photoPath}",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: allpressed
                  //?눌렀을때
                  ? Container(
                      height: SizeConfig.standard2 * 0.112,
                      width: SizeConfig.standard2 * 0.112,
                      decoration: BoxDecoration(
                        color: widget.darkMode
                            ? Colors.white.withOpacity(0.5)
                            : Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: widget.darkMode
                            ? Color(0xff282828)
                            : Color(0xffF47252),
                        size: SizeConfig.standard * 0.13,
                      ),
                    )
                  : Container()),
        ),
        SizedBox(
          height: SizeConfig.standard2 * 0.012,
        ),
        Container(
          child: Text(
            "${widget.name}",
            style: TextStyle(
                fontSize: SizeConfig.standard * 0.04,
                color: widget.darkMode ? Colors.white : Colors.black),
          ),
        )
      ],
    );
  }
}
