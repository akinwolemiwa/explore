import 'package:flutter/material.dart';
import 'package:stage_3/colors.dart';

abstract class ExploreTheme {
  Color get primary;
  Color get backgroundColor => Colors.white;
  Color get backgroundColorDark => MyColors.darkTheme;

  ThemeData get dark => ThemeData.dark().copyWith(
        primaryColor: primary,
        backgroundColor: backgroundColorDark,
      );

  ThemeData get light => ThemeData.light().copyWith(
        primaryColor: primary,
        backgroundColor: backgroundColor,
      );
}
