import 'package:flutter/material.dart';

const secondaryColor = Color(0xFF292929);
// const secondaryColor = Color(0xFF212121);
const bgColor = Color(0xFF212121);
const whiteText = Colors.white;
const neoBoxStart = Colors.black;
const neoBoxEnd = Colors.grey;

class CustomColors {
  static const kLightPinkColor = Color(0xffF3BBEC);
  static const kYellowColor = Color(0xffF3AA26);
  static const kCyanColor = Color(0xff0eaeb4);
  static const kPurpleColor = Color(0xff533DC6);
  static const kPrimaryColor = Color(0xff39439f);
  static const kBackgroundColor = Color(0xffF3F3F3);
  static const kLightColor = Color(0xffc4bbcc);
}

class CustomTextStyle {
  static const dayTabBarStyleInactive = TextStyle(
    color: CustomColors.kLightColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const dayTabBarStyleActive = TextStyle(
    color: CustomColors.kPrimaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const metricTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25);
}
