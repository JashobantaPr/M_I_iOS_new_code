import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/utils/pref_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    PrefUtils().setThemeData(newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray50003,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primaryContainer;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primaryContainer;
          }
          return colorScheme.onSurface;
        }),
        side: const BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray5008e,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray700,
          fontSize: 16.sp,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray70002,
          fontSize: 14.sp,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 8.sp,
          fontFamily: 'Noto Sans Hebrew',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 30.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 24.sp,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.sp,
          fontFamily: 'Noto Sans Hebrew',
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: appTheme.gray50003,
          fontSize: 10.sp,
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: const Color(0XFF979797),
          fontSize: 8.sp,
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 20.sp,
          fontFamily: 'Noto Sans Hebrew',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 18.sp,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray90001,
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0xFFF0F0F0),
    primaryContainer: Color(0XFF28328C),
    secondaryContainer: Color(0XFFBFBFBF),

    // Error colors
    errorContainer: Color(0XFF1D8DCC),
    onErrorContainer: Color(0XFF0C161C),

    // On colors(text colors)
    onPrimary: Color(0XFF231F20),
    onPrimaryContainer: Color(0X0FFFFFFF),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => const Color(0xFF191919);
  Color get black600 => const Color(0xFF000000);

  //white
  Color get white => const Color(0xFFFFFFFF);

  // Blue
  Color get blue50 => const Color(0xFF000EEE);
  Color get blue100 => const Color(0xFF243794);
  Color get radioblue => const Color(0xFF0075FF);
  // Gray
  Color get grey => const Color(0xFFF0F0F0);
  Color get greybordercolour => const Color(0xFFF4F4F4);
  Color get greydivider => const Color(0xFFE4E4E4);
  Color get greytextcolour => const Color(0xFF6D6D6D);
  Color get greydownarrow => const Color(0xFF7B8191);
  Color get gray80003 => const Color(0xFFE3F5DE);
  Color get grayblue => const Color(0xFFE3F5DE);
  Color get gray40003 => const Color(0XFFC4C4C4);
  Color get greyshadow => const Color(0x29000000);
  Color get greyverticaldevider => const Color(0xFF707070);
  Color get background => const Color(0xFFE1E1E1);
  Color get grey500 => const Color(0XFFD5D5D5);
  Color get grey100 => const Color(0XFF78787B);
  Color get grey10 => const Color(0XFFE1E1E1);
  Color get greytext => const Color(0XFFACABAB);
  

  // Cyan
  Color get cyan800 => const Color(0xFF383853);

  //yellow
  Color get yellow => const Color(0xFFFECB34);
  Color get yellowdark => const Color(0xFFFF9001);

  //lightpink
  Color get pink => const Color(0xFFFF3F81);

  //light Pink
  Color get lightpink => const Color(0xFFFFD3D3);

  //light aqua
  Color get lightaqua => const Color(0xFFDEF0E8);

  // Gray
  Color get gray100 => const Color(0xFFF0F0F0);
  Color get gray10000 => const Color(0X00F7F7F7);
  Color get gray10001 => const Color(0XFFF3F3F3);
  Color get gray10002 => const Color(0XFFF2F2F2);
  Color get gray200 => const Color(0XFFEBEBEB);
  Color get gray20001 => const Color(0XFFEFEFEF);
  Color get gray20002 => const Color(0XFFECECEC);
  Color get gray20003 => const Color(0XFFE8E8E8);
  Color get gray20004 => const Color(0XFFEAEAEA);
  Color get gray300 => const Color(0XFFE6E6E6);
  Color get gray30001 => const Color(0XFFE0E0E0);
  Color get gray30002 => const Color(0XFFDCDCDC);
  Color get gray400 => const Color(0XFFCACACA);
  Color get gray40001 => const Color(0XFFB3B2B2);
  Color get gray40002 => const Color(0XFFB4B4B4);
  Color get gray40004 => const Color(0XFFB3B3B3);
  Color get gray50 => const Color(0XFFFBFBFB);
  Color get gray500 => const Color(0XFFD5D5D5);
  Color get gray50000 => const Color(0X00ADADAD);
  Color get gray50001 => const Color(0XFF8F8F8F);
  Color get gray50002 => const Color(0XFF999999);
  Color get gray50003 => const Color(0XFF979797);
  Color get gray50091 => const Color(0X91919191);
  Color get gray5001 => const Color(0XFFEFFDFD);
  Color get gray5002 => const Color(0XFFF2FEFE);
  Color get gray5003 => const Color(0XFFF8F8F8);
  Color get gray5004 => const Color(0XFFF7F9F9);
  Color get gray600 => const Color(0XFF6C6C6C);
  Color get gray700 => const Color(0XFF696969);
  Color get gray70001 => const Color(0XFF5E5E5F);
  Color get gray70002 => const Color(0XFF5F5E5E);
  Color get gray800 => const Color(0XFF484848);
  Color get gray80001 => const Color(0XFF494949);

  Color get gray900 => const Color(0XFFD5D5D5);
  Color get gray90001 => const Color(0XFF6D6D6D);

  // Grayf
  Color get gray2007f => const Color(0X7FE7E7E7);

  // Graye
  Color get gray4008e => const Color(0X8EC1C1C1);
  Color get gray5008e => const Color(0X8E9D9D9D);
  Color get gray6001e => const Color(0X1E767680);

  // GrayEf
  Color get gray50Ef => const Color(0XEFF9F9F9);

  // Green
  Color get green => const Color(0xFF1F8400);
  Color get green1 => const Color(0xFF2DA20D);

  // Indigo
  Color get indigo300 => const Color(0XFF737BC1);
  Color get indigo30001 => const Color(0XFF737BC0);
  Color get indigo800 => const Color(0XFF1E4580);

  // Indigof
  Color get indigo3003f => const Color(0X3F6F7DC8);

  // Pink
  Color get pink900 => const Color(0XFF832727);
  Color get pink90001 => const Color(0XFF8C2858);

  // Purple
  Color get purple900 => const Color(0XFF540D6E);

  // Red
  Color get redappbar => const Color(0xFFE41C39);
  Color get rediconbackground => const Color(0xFFE21D39);
  Color get redtext => const Color(0xFFFF3232);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
