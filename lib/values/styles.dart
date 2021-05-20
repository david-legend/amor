part of 'values.dart';

class Styles {
  static TextStyle customTextStyle(
      {Color color = AppColors.darkGrey800,
      FontWeight fontWeight = FontWeight.w700,
      double fontSize = Sizes.TEXT_SIZE_14,
      FontStyle fontStyle: FontStyle.normal,
      TextDecoration decoration: TextDecoration.none}) {
    return GoogleFonts.merriweather(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
    );
  }
}
