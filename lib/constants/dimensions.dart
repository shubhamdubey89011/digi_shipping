import 'package:flutter/cupertino.dart';

class SizeConfig {
  static screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static keyBoardHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  static double height(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }

  static double width(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }
}

class AppFontSize {
  static double headlineSmall = 20.0;
  static double headlineMedium = 25.0;
  static double headlineLarge = 30.0;
  static double titleSmall = 13.0;
  static double titleMedium = 16.0;
  static double titleLarge = 20.0;
  static double bodyLarge = 18.0;
  static double bodyMedium = 16.0;
  static double bodySmall = 14.0;
  static double displayLarge = 35.0;

  //Font size
  static double fontSizeXXS = 9.0;
  static double fontSizeXS = 11.0;
  static double fontSizeS = 13.0 ;
  static double fontSizeM = 15.0;
  static double fontSizeL = 18.0;
  static double fontSizeXL = 22.0;
  static double fontSizeXXL = 25.0;

}

class AppSpecification {
  //Icon size
  static double iconSizeS = 16.0;
  static double iconSizeWebS = 15.0;
  static double iconSizeM = 20.0;
  static double iconSizeL = 25.0;

  static double textFieldLabelIconSize = 17.0;
  static double errorTextSize = 13.0;
  static double cursorHeight = 15.0;

}

class rmiFontWeight{//change it to camel case
  static FontWeight headline =FontWeight.w600;
  // static FontWeight headline =FontWeight.w600;
  // static FontWeight headline =FontWeight.w600;
}
//use container as rmiContainer