import 'package:app/App/util/Const/text_app.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:app/App/util/theme/Style/styles.dart';
import 'package:flutter/material.dart';

class Buttons {
  static Widget ButtonBack(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          backgroundColor: Theme.of(context).disabledColor.withOpacity(0.3),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: SizeApp.fontSizeExtraLarge,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  static InkWell buttonAll(BuildContext context,
      {required String title,
      required Color color,
      required Function functinn,
      bool isgoogle = false}) {
    return InkWell(
      onTap: () {
        functinn();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(17)),
          color: color,
        ),
        width: double.infinity,
        height: 55,
        child: Row(
          children: [
            Spacer(),
            if (isgoogle)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/images/Group 108.png",
                  height: 30,
                ),
              ),
            Text(
              title,
              style: isgoogle
                  ? StyleApp.styleTextbuttonblack
                  : StyleApp.styleTextbutton,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
