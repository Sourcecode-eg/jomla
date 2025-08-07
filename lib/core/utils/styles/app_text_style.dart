// import 'package:flutter/material.dart';

// import '../colors/colors.dart';

// class AppTextStyle {
//   static const String _fontFamily = 'Tajawal';

//   /// AppBar
//   static const TextStyle textStyleAppBar = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//   );

//   // Default
//   static const TextStyle textStylDefault = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.defaultColor,
//     fontSize: 22,
//     fontWeight: FontWeight.bold,
//   );

//   /// Gold
//   static const TextStyle textStyleRegularGold = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGold,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleRegularGold13 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGold,
//     fontSize: 13,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleMediumGold = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGold,
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle textStyleMediumGold12 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGold,
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle textStyleSemiBoldGold = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGold,
//     fontSize: 19,
//     fontWeight: FontWeight.w600,
//   );
//   static const TextStyle textStyleSemiBoldGold18 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.primaryL,
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//   );
//   static const TextStyle textStyleSemiBoldGold16 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGold,
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//   );

//   /// Gray
//   static const TextStyle textStyleRegularGray = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGray,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleMediumGray = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGray,
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//   );
//   static const TextStyle textStyleMediumGray15 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGray,
//     fontSize: 15,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle textStyleMediumGray12 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGray,
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//   );

//   /// GrayLight
//   static const TextStyle textStyleRegularGrayLight = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textGrayLight,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleRegularGrayLight12 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textGrayLight,
//     fontSize: 12,
//     fontWeight: FontWeight.w400,
//   );

//   /// Primary
//   static const TextStyle textStyleRegularPrimary = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleMediumPrimary = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle textStyleMediumPrimary12 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle textStyleMediumPrimaryNative12 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.primaryL,
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle floatingLabelStyle = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.primaryL,
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle textStylePrimaryColorSemiBold = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 15,
//     fontWeight: FontWeight.w600,
//   );

//   /// Secondary
//   static const TextStyle textStyleRegularSecondary = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.secondaryL,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleMediumSecondary = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.secondaryL,
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle textStyleMediumSecondary12 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.secondaryL,
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle textStyleSemiBoldSecondary = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.secondaryL,
//     fontSize: 15,
//     fontWeight: FontWeight.w600,
//   );

//   /// AppBlack
//   static const TextStyle textStyleRegularBlack = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 13,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleRegularAppBlack18 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 18,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleMediumAppBlack = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle textStyleTitle = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 19,
//     fontWeight: FontWeight.w600,
//   );

//   /// Black
//   static const TextStyle textStyleMediumBlack = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textBlack,
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//     height: 1.2,
//   );
//   static const TextStyle textStyleBoldBlack = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textBlack,
//     fontSize: 16,
//     fontWeight: FontWeight.w700,
//   );
//   static const TextStyle textStyleBoldBlack18 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textBlack,
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//   );
//   static const TextStyle textStyleBoldBlack20 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textBlack,
//     fontSize: 22,
//     fontWeight: FontWeight.w700,
//   );

//   /// White
//   static const TextStyle textStyleWhiteSemiBold = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textWhite,
//     fontSize: 15,
//     fontWeight: FontWeight.w600,
//   );
//   static const TextStyle textStyleWhiteRegular33 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textWhite,
//     fontSize: 33,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleWhiteRegular15 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textWhite,
//     fontSize: 15,
//     fontWeight: FontWeight.w500,
//   );
//   static const TextStyle textStyleWhiteSemiBold19 = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textWhite,
//     fontSize: 19,
//     fontWeight: FontWeight.w600,
//   );
//   static const TextStyle textStyleWhiteMedium = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textWhite,
//     fontSize: 14,
//     fontWeight: FontWeight.w500,
//   );

//   /// Red
//   static const TextStyle textStyleSemiBoldRed = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textRed,
//     fontSize: 15,
//     fontWeight: FontWeight.w600,
//   );

//   /// EditTextStyle
//   /// Label
//   static const TextStyle textStyleEditTextLabelRegularPrimary = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 12,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleEditTextLabelRegularBlack = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppPrimary,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle textStyleEditTextLabelRegularGray = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppGray,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );

//   /// Value
//   static const TextStyle textStyleEditTextValueRegularBlack = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textBlack,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );

//   /// Button TextStyle
//   static const TextStyle textStyleButton = TextStyle(
//     fontFamily: _fontFamily,
//     color: AppColors.textAppWhiteDark,
//     fontSize: 14,
//     fontWeight: FontWeight.w600,
//   );

//   AppTextStyle._();
// }

import 'package:flutter/material.dart';

import '../colors/colors.dart';

class AppTextStyle {
  static const String _fontFamily = 'GE SS Text';

  static const TextStyle textStyleAppBar = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textAppPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyleMediumGray = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textAppGray,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle textStyleMediumGray15 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textAppGray,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleMediumGray12 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textAppGray,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyleRegularBlack = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textAppPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textStyleRegularAppBlack18 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textAppPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textStyleMediumAppBlack = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textAppPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleTitle = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textAppPrimary,
    fontSize: 19,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textStyleMediumBlack = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textBlack,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );
  static const TextStyle textStyleBoldBlack = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textBlack,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle textStyleBoldBlack18 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textBlack,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyleBoldBlack20 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textBlack,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle textStyleWhiteSemiBold = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textWhite,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleWhiteRegular33 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textWhite,
    fontSize: 33,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textStyleWhiteRegular15 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textWhite,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleWhiteSemiBold19 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textWhite,
    fontSize: 19,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle textStyleWhiteMedium = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textWhite,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyleSemiBoldRed = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.textRed,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  AppTextStyle._();
}
