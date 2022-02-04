import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  //global colors
  static const maroon = Color.fromARGB(255,239, 69, 71);
  static const green = Color.fromARGB(255,77, 186, 169);
  // static const red = Colors.red;
  static final redShade = Colors.red.shade300;
  static const navBarMenuButtonBg = Color(0xfffafafa);
  // static const navBarTextColor = Colors.black87;
  static const customB = Colors.black87;//using globally
  static const customW = Colors.white;//using globally
  static const customT = Colors.transparent;//using globally
  static const customerButtonColor = Colors.white;
  static final customGreyColor = Colors.grey;
  // static final customGreyColorShade = Colors.grey.shade200;
  static final customAccentColor = Colors.blue;
  // static final loginScreenBackground = Colors.blue[50];
  static final customLightAccentColorShade = Colors.blue.shade300;
  // static final hoverColor = customGreyColor.shade100;

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

  // TextStyle for different elements
  static const fieldTitleTextStyle = TextStyle(fontWeight: FontWeight.w100);
  // static const headingStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 25);
  // static const subHeadingStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  static const customerButtonHead = TextStyle(fontWeight: FontWeight.bold, fontSize: 11,color: AppStyle.customerButtonColor);
  static final mainHeadingPageTop = TextStyle(fontWeight: FontWeight.bold, fontSize: 26,color: AppStyle.customAccentColor);
  static final cTextStyle = TextStyle(fontSize: 11);
  // static final calendarHeadTextStyle=TextStyle(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,fontSize: 11);
  //customer summary page stylings
  // static final summarySubHeading=TextStyle(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,fontSize: 18);
  // static final summaryLable=TextStyle(overflow: TextOverflow.ellipsis,fontSize: 16);
  // static final summaryTitle=TextStyle(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,fontSize: 14);
  // static const double summaryPaddingSubHeading=5;
  // static const double summaryPadding=4;
  //customer meal exception animations
  // static const animationDuration = Duration(milliseconds: 400);

  //for meal planner total meals text style
  static final customCircleAvatar=TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold);

  //for recipie
  // static final TextStyle dataTableHeading=TextStyle(overflow: TextOverflow.ellipsis,fontSize: 16,fontWeight: FontWeight.bold);
  // static final TextStyle recipieLabel=GoogleFonts.roboto(
  //   textStyle: TextStyle(fontWeight: FontWeight.bold, letterSpacing: .5,fontSize: 24,color: Colors.black87),
  // );
  // static final TextStyle recipieMenu=GoogleFonts.roboto(
  //   textStyle: TextStyle(fontWeight: FontWeight.bold, letterSpacing: .5,fontSize: 18,color: Colors.black87),
  // );
  // static final TextStyle chipCommonStyle=TextStyle(fontSize: 11,color: Colors.white,fontWeight: FontWeight.bold,overflow: TextOverflow.fade);
  // static final TextStyle tableIdStyle=TextStyle(fontSize: 11.5,fontWeight: FontWeight.bold,overflow: TextOverflow.fade);
  // static final TextStyle tableTitle=TextStyle(fontSize: 15,fontWeight: FontWeight.w400,overflow: TextOverflow.fade);
  // static final TextStyle tableAddress=TextStyle(fontSize: 15,fontWeight: FontWeight.w200,overflow: TextOverflow.fade);
  // static final TextStyle tableTitleSubstitue=TextStyle(fontSize: 15,fontWeight: FontWeight.w200,overflow: TextOverflow.fade);
  // static final TextStyle tableLabels=TextStyle(fontSize: 14,fontWeight: FontWeight.w300,overflow: TextOverflow.fade);
  // static final TextStyle tableSubTitle=TextStyle(fontSize: 13,fontWeight: FontWeight.bold,overflow: TextOverflow.fade);
  // static final TextStyle tablePersonal=TextStyle(fontWeight: FontWeight.w200, letterSpacing: .5,fontSize: 13,color: Colors.black87);
}
