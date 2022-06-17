import 'package:flutter/material.dart';
import 'package:capstone/model/size_config.dart';

class FoodCircle extends StatefulWidget {
  final String name;
  final String photoPath;
  final bool listenFromAll;
  final bool listenFromMe;
  final ValueChanged<bool> onClickChanged;
  final List<bool> tagArr;
  final bool all;
  final bool darkMode;

  FoodCircle(
      {Key key,
      this.name,
      this.photoPath,
      this.listenFromAll,
      this.listenFromMe,
      this.onClickChanged,
      this.tagArr,
      this.all,
      this.darkMode})
      : super(key: key);

  @override
  FoodCircleState createState() => FoodCircleState();
}

class FoodCircleState extends State<FoodCircle> {
  bool onpressed = false;

  @override
  Widget build(BuildContext context) {
    //? 전체선택 누르면 풀리는거
    if (widget.all == false) {
      onpressed = false;
    }

    return Column(
      children: [
        InkWell(
          //! 버튼 위젯 자체의 기능
          onTap: () {
            if (!widget.listenFromMe) {
              //true
              if (widget.listenFromAll) {
                // onpressed = false;
                // print(onpressed);

                //false
              } else {
                //? 눌렀을때
                setState(() {
                  onpressed = !onpressed;
                  widget.onClickChanged(onpressed);
                });
              }
            } else {
              //? 풀었을때
              setState(() {
                onpressed = !onpressed;
                widget.onClickChanged(onpressed);
              });
            }
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
              child: onpressed
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
