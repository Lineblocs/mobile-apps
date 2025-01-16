import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimens.dart';

class AppFonts {
  static const String assistant = 'Assistant';
  static const String lora = 'Lora';

  static TextStyle regularTextStyle(
      {fontSize = AppDimens.default_font,
        color ,
        font = assistant,
        height = 1.0}) =>
      TextStyle(
          fontSize: fontSize,
          color: color,
          height: height,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          wordSpacing: 2.0);

  static TextStyle mediumTextStyle(
      {fontSize = AppDimens.default_font,
        // color = AppColor.black,
        color,
        font = assistant,
        height = 1.0}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily:font,
        height: height,
        fontWeight: FontWeight.w500,
      );

  static boldTextStyle(
      {fontSize = AppDimens.default_font,
      //  color = AppColor.black
        color,
        font = assistant,
        height = 1.0,
        fontWeight = FontWeight.w700}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: font,
        height: height,
        fontWeight: fontWeight,
      );

  static semiBoldTextStyle(
      {fontSize = AppDimens.default_font,
      //  color = AppColor.black,
        color,
        font = assistant,
        height = 1.0,
        fontWeight = FontWeight.w600}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: font,
        height: height,
        fontWeight: fontWeight,
      );
}
