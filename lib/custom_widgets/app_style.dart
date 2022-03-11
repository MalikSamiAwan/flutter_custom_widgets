import 'package:flutter/material.dart';

class AppStyle {
  //global colors
  static const maroon = Color.fromARGB(255,239, 69, 71);
  static const green = Color.fromARGB(255,77, 186, 169);
  static final redShade = Colors.red.shade300;
  static const navBarMenuButtonBg = Color(0xfffafafa);
  static const customB = Colors.black87;//using globally
  static const customW = Colors.white;//using globally
  static const customT = Colors.transparent;//using globally
  static const customerButtonColor = Colors.white;
  static final customGreyColor = Colors.grey;
  static final customAccentColor = Colors.blue;
  static final customLightAccentColorShade = Colors.blue.shade300;

  //global paddings
  static const EdgeInsets fieldPaddingGlobal = EdgeInsets.symmetric(vertical: 5, horizontal: 5);
  static const EdgeInsets fieldContentPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 10);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 20);
  static const EdgeInsets fieldTitlePadding = const EdgeInsets.symmetric(vertical: 3.0);

  //add customer button's distance
  // static const distanceBetweenControlButtonsInWizrd = 30.0;
  //error field border color
  static const errorFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5),
  );

  //error text style
  //hide hint error text
  static const errorTextStyle = TextStyle(
    fontSize: 1,
    height: 0,
    color: Colors.transparent,
  );

  //adding custome style for counter text
  //hide counter text
  static const counterTextStyle = TextStyle(
    fontSize: 1,
    height: 0,
    color: Colors.transparent,
  );

  static const fieldTitleTextStyle = TextStyle(fontWeight: FontWeight.w100);
  static const customerButtonHead = TextStyle(fontWeight: FontWeight.bold, fontSize: 11,color: AppStyle.customerButtonColor);
  static final mainHeadingPageTop = TextStyle(fontWeight: FontWeight.bold, fontSize: 26,color: AppStyle.customAccentColor);
  static final cTextStyle = TextStyle(fontSize: 11);
  static final customCircleAvatar=TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold);


}
