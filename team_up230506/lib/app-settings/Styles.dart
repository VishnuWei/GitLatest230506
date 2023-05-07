import 'package:flutter/cupertino.dart';

class Styles
{


  static const Color primaryColor = Color.fromRGBO(144, 44, 80, 1.0);
  static const Color primaryBGColor = Color.fromRGBO(239, 239, 239, 1);
  static const Color secondaryBGColor = Color.fromRGBO(119, 129, 146, 1);
  static const Color titleFontColor = Color.fromRGBO(235, 237, 239, 1);
  static const Color primaryFontColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color secondaryFontColor = Color.fromRGBO(231, 231, 231, 1);
  static const Color greyFontColor = Color.fromRGBO(115, 110, 140, 1);
  static const Color blackIconColor = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color appBarIconColor = Color.fromRGBO(242, 242, 242, 1);
  static const Color buttonColor = Color.fromRGBO(144, 44, 80, 1);
  static const Color linkBlueColor = Color.fromRGBO(38, 153, 251, 1);
  static const Color blueGreyThemeColor = Color.fromRGBO(90, 90, 120, 1);
  static const Color emojiColor = Color.fromRGBO(255, 204, 51, 1);
  static const Color black  = Color.fromRGBO(0, 0, 0, 1);
  static const Color white = Color.fromRGBO(239, 239, 239, 1);
  static const Color grey  = Color.fromRGBO(115, 110, 140, 1);
  static const Color blue  = Color.fromRGBO(115, 234, 140, 1);

  static BoxDecoration textBoxDecoration = BoxDecoration( color: white,
      border: Border.all(  width: 1,     color: black,   ),
      borderRadius: BorderRadius.circular(10.0)
  );

  static BoxDecoration buttonBoxDecoration = BoxDecoration(   color: buttonColor, borderRadius: BorderRadius.circular(12.0));

  static TextStyle buttonTextStyle = const TextStyle(  color: secondaryFontColor, fontWeight: FontWeight.bold, fontSize: 16);

  static TextStyle largeLogoTextStyle = const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: primaryColor);

  static TextStyle textBoxFontStyle =   const TextStyle(color: Styles.primaryFontColor, fontSize: 14.0);
  static TextStyle textBoxHintStyle =   const TextStyle(color: Styles.grey, fontSize: 14.0);
  static TextStyle textStylePromptNearLink =  const TextStyle(decoration: TextDecoration.none, fontSize: 15.0, color: Styles.primaryFontColor);
  static TextStyle menuItemTextStyle = TextStyle(color: Styles.primaryFontColor);
  static TextStyle homeTitleText = TextStyle( color: Styles.titleFontColor, fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle locationHintStyle =   const TextStyle(color: Styles.grey, fontSize: 14.0);
  static TextStyle locationFontStyle =   const TextStyle(color: Styles.primaryFontColor, fontSize: 14.0);
  static TextStyle uploadHintStyle =   const TextStyle(color: Styles.grey, fontSize: 14.0);
  static TextStyle uploadFontStyle =   const TextStyle(color: Styles.primaryFontColor, fontSize: 14.0);

/*
  static BoxDecoration textBoxDecoration = BoxDecoration(  );

  static BoxDecoration buttonBoxDecoration = BoxDecoration( );

  static TextStyle buttonTextStyle = const TextStyle(  );

  static TextStyle largeLogoTextStyle = const TextStyle();

  static TextStyle textBoxHintStyle =   const TextStyle();
  static TextStyle  textStylePromptNearLink =  const TextStyle();
*/
}