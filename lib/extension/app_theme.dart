import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_style.dart';

class AppTheme {
  static get mainTheme => ThemeData(
        extensions: <ThemeExtension<dynamic>>[
          AppColors(
            primaryColor: HexColor.fromHex("#000000"),
            danger: HexColor.fromHex("#000000"),
          ),
          const AppTextTheme(
            kanitNormalText: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Kanit',
            ),
            kanitBoldText: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Kanit',
            ),
          ),
        ],
      );
}
