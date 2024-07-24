import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeGray40001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray40001,
      );
  static get bodyLargeGray70002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray70002,
      );
  static get bodyLargeNotoSansHebrewBlack900 =>
      theme.textTheme.bodyLarge!.notoSansHebrew.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeNotoSansHebrewGray70002 =>
      theme.textTheme.bodyLarge!.notoSansHebrew.copyWith(
        color: appTheme.gray70002,
        fontSize: 19.sp,
      );
  static get bodyLargeNotoSansHebrewPrimary =>
      theme.textTheme.bodyLarge!.notoSansHebrew.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.sp,
      );
  static get bodyLargeNotoSansHebrewPrimaryContainer =>
      theme.textTheme.bodyLarge!.notoSansHebrew.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 18.sp,
      );
  static get bodyLargePoppinsBlack900 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: 17.sp,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyLargePrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodyLargeSegoeUIBlack900 =>
      theme.textTheme.bodyLarge!.segoeUI.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeSegoeUIGray50003 =>
      theme.textTheme.bodyLarge!.segoeUI.copyWith(
        color: appTheme.gray50003,
      );
  static get bodyLargeff303030 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF303030),
      );
  static get bodyLargeff5f5e5e => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF5F5E5E),
      );
  static get bodyLargeffb3b2b2 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFFB3B2B2),
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumErrorContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodyMediumGray50002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray50002,
      );
  static get bodyMediumGray50003 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray50003,
      );
  static get bodyMediumNotoSansBlack900 =>
      theme.textTheme.bodyMedium!.notoSans.copyWith(
        color: appTheme.black900,
        fontSize: 15.sp,
      );
  static get bodyMediumNotoSansGray90001 =>
      theme.textTheme.bodyMedium!.notoSans.copyWith(
        color: appTheme.gray90001,
        fontSize: 15.sp,
      );
  static get bodyMediumNotoSansHebrewBlack900 =>
      theme.textTheme.bodyMedium!.notoSansHebrew.copyWith(
        color: appTheme.black900,
        fontSize: 15.sp,
      );

  static get Headerblack_01 =>
      theme.textTheme.bodyMedium!.notoSansHebrew.copyWith(
          color: appTheme.black900,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold);
  static get HeaderWhite_01 =>
      theme.textTheme.bodyMedium!.notoSansHebrew.copyWith(
        color: appTheme.white,
        fontSize: 15.sp,
      );
  static get appBarText => theme.textTheme.bodyLarge!.poppins.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
        fontFamily: "Poppins",
        color: appTheme.white,
      );
  static get Headerblack_02 =>
      theme.textTheme.bodyMedium!.notoSansHebrew.copyWith(
        color: appTheme.black900,
        fontSize: 15.sp,
      );
  static get bodyMediumNotoSansHebrewBlack900_1 =>
      theme.textTheme.bodyMedium!.notoSansHebrew.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumNotoSansHebrewff000000 =>
      theme.textTheme.bodyMedium!.notoSansHebrew.copyWith(
        color: Color(0XFF000000),
        fontSize: 20,
      );
  static get bodyMediumNotoSansPrimaryContainer =>
      theme.textTheme.bodyMedium!.notoSans.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 15.sp,
      );
  static get bodyMediumNotoSansff1e1e1e =>
      theme.textTheme.bodyMedium!.notoSans.copyWith(
        color: Color(0XFF1E1E1E),
        fontSize: 15.sp,
      );
  static get bodyMediumNunitoSansBlack900 =>
      theme.textTheme.bodyMedium!.nunitoSans.copyWith(
        color: appTheme.black900,
        fontSize: 13.sp,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get bodyMediumPink90001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.pink90001,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 15.sp,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.sp,
      );
  static get bodySmallInterOnPrimaryContainer =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 10.sp,
      );
  static get bodySmallNunitoSans =>
      theme.textTheme.bodySmall!.nunitoSans.copyWith(
        fontSize: 11.sp,
      );
  static get bodySmallNunitoSans10 =>
      theme.textTheme.bodySmall!.nunitoSans.copyWith(
        fontSize: 10.sp,
      );
  static get bodySmallNunitoSans11 =>
      theme.textTheme.bodySmall!.nunitoSans.copyWith(
        fontSize: 11.sp,
      );
  static get bodySmallNunitoSansff000000 =>
      theme.textTheme.bodySmall!.nunitoSans.copyWith(
        color: Color(0XFF000000),
        fontSize: 10.sp,
      );
  static get bodySmallOpenSans => theme.textTheme.bodySmall!.openSans.copyWith(
        fontSize: 12.sp,
      );
  static get bodySmallOpenSans11 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        fontSize: 11.sp,
      );
  static get bodySmallOpenSans12 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        fontSize: 12.sp,
      );
  static get bodySmallOpenSansErrorContainer =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 10.sp,
      );
  static get bodySmallOpenSansGray70002 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: appTheme.gray70002,
        fontSize: 10.sp,
      );
  static get bodySmallOpenSansGray7000212 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: appTheme.gray70002,
        fontSize: 12.sp,
      );
  static get bodySmallOpenSansGray7000212_1 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: appTheme.gray70002,
        fontSize: 12.sp,
      );
  static get bodySmallOpenSansGray700029 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: appTheme.gray70002,
        fontSize: 9.sp,
      );
  static get bodySmallOpenSansGray70002_1 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: appTheme.gray70002,
      );
  static get bodySmallOpenSansGray80001 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: appTheme.gray80001,
        fontSize: 12.sp,
      );
  static get bodySmallOpenSansLight =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallOpenSansOnPrimaryContainer =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 9.sp,
      );
  static get bodySmallOpenSansOnPrimaryContainer9 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 9.sp,
      );
  static get bodySmallOpenSansPink900 =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: appTheme.pink900,
        fontSize: 12.sp,
      );
  static get bodySmallOpenSansPrimary =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 10.sp,
      );
  static get bodySmallOpenSansPrimaryContainer =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 10.sp,
      );
  static get bodySmallOpenSans_1 => theme.textTheme.bodySmall!.openSans;
  static get bodySmallOpenSansff5f5e5e =>
      theme.textTheme.bodySmall!.openSans.copyWith(
        color: Color(0XFF5F5E5E),
        fontSize: 12.sp,
      );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 12.sp,
      );
  static get bodySmallPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodySmallPrimary_1 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallSegoeUIff263238 =>
      theme.textTheme.bodySmall!.segoeUI.copyWith(
        color: Color(0XFF263238),
        fontSize: 12.sp,
      );
  // Headline text style
  static get headlineLargeLatoOnPrimaryContainer =>
      theme.textTheme.headlineLarge!.lato.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
      );
  static get headlineLargeLatoff8f8f8f =>
      theme.textTheme.headlineLarge!.lato.copyWith(
        color: Color(0XFF8F8F8F),
        fontSize: 31.sp,
      );
  static get headlineSmallPoppinsPrimary =>
      theme.textTheme.headlineSmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallPoppinsPrimaryContainer =>
      theme.textTheme.headlineSmall!.poppins.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelLargeNunitoSans =>
      theme.textTheme.labelLarge!.nunitoSans.copyWith(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeNunitoSansPrimary =>
      theme.textTheme.labelLarge!.nunitoSans.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOpenSans =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOpenSansGray70002 =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        color: appTheme.gray70002,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOpenSansGray70002SemiBold =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        color: appTheme.gray70002,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOpenSansGray70002SemiBold_1 =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        color: appTheme.gray70002,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOpenSansGray900 =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOpenSansGray90001 =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOpenSansOnPrimaryContainer =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOpenSansPrimary =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOpenSansSemiBold =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOpenSansff5f5e5e =>
      theme.textTheme.labelLarge!.openSans.copyWith(
        color: Color(0XFF5F5E5E),
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargePrimaryContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get labelLargeSegoeUIff263238 =>
      theme.textTheme.labelLarge!.segoeUI.copyWith(
        color: Color(0XFF263238),
        fontWeight: FontWeight.w600,
      );
  static get labelLargeWorkSansOnErrorContainer =>
      theme.textTheme.labelLarge!.workSans.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 13.sp,
      );
  static get labelMediumBlack900 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
      );
  static get labelMediumGray700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get labelMediumNotoSansHebrewBlack900 =>
      theme.textTheme.labelMedium!.notoSansHebrew.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumNotoSansHebrewGray70002 =>
      theme.textTheme.labelMedium!.notoSansHebrew.copyWith(
        color: appTheme.gray70002,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumOpenSansBlack900 =>
      theme.textTheme.labelMedium!.openSans.copyWith(
        color: appTheme.black900,
        fontSize: 11.sp,
      );
  static get labelMediumOpenSansGray70002 =>
      theme.textTheme.labelMedium!.openSans.copyWith(
        color: appTheme.gray70002,
      );
  static get labelMediumOpenSansGray7000211 =>
      theme.textTheme.labelMedium!.openSans.copyWith(
        color: appTheme.gray70002,
        fontSize: 11.sp,
      );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelMediumPrimaryBold => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumff000000 => theme.textTheme.labelMedium!.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w700,
      );
  static get labelMediumff000000_1 => theme.textTheme.labelMedium!.copyWith(
        color: Color(0XFF000000),
      );
  static get labelMediumff05ebd5 => theme.textTheme.labelMedium!.copyWith(
        color: Color(0XFF05EBD5),
      );
  static get labelMediumff28328c => theme.textTheme.labelMedium!.copyWith(
        color: Color(0XFF28328C),
      );
  static get labelMediumff696969 => theme.textTheme.labelMedium!.copyWith(
        color: Color(0XFF696969),
      );
  static get labelMediumff979797 => theme.textTheme.labelMedium!.copyWith(
        color: Color(0XFF979797),
      );
  static get labelSmallOpenSansGray70002 =>
      theme.textTheme.labelSmall!.openSans.copyWith(
        color: appTheme.gray70002,
      );
  // Nunito text style
  static get nunitoSansBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: 6.sp,
        fontWeight: FontWeight.w400,
      ).nunitoSans;
  // Open text style
  static get openSansGray70002 => TextStyle(
        color: appTheme.gray70002,
        fontSize: 7.sp,
        fontWeight: FontWeight.w400,
      ).openSans;
  // Title text style
  static get titleLargeNunitoSans =>
      theme.textTheme.titleLarge!.nunitoSans.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleLargeOpenSans =>
      theme.textTheme.titleLarge!.openSans.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleLargeOpenSansGray20002 =>
      theme.textTheme.titleLarge!.openSans.copyWith(
        color: appTheme.gray20002,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeOpenSansGray800 =>
      theme.textTheme.titleLarge!.openSans.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeWorkSansOnErrorContainer =>
      theme.textTheme.titleLarge!.workSans.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
      );
  static get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.sp,
      );
  static get titleMedium17 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 17.sp,
      );
  static get titleMedium17_1 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 17.sp,
      );
  static get titleMediumGray70001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray70001,
        fontSize: 16.sp,
      );
  static get titleMediumGray70002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray70002,
        fontSize: 17.sp,
      );
  static get titleMediumGray7000216 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray70002,
        fontSize: 16.sp,
      );
  static get titleMediumGray7000216_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray70002,
        fontSize: 16.sp,
      );
  static get titleMediumGray70002_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray70002,
      );
  static get titleMediumGray800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray800,
      );
  static get titleMediumLato => theme.textTheme.titleMedium!.lato.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumLatoGray50001 =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: appTheme.gray50001,
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumLatoGray90001 =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: appTheme.gray90001,
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumLatoGray90001Medium =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: appTheme.gray90001,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumLatoOnPrimary =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 16.sp,
      );
  static get titleMediumLatoOnPrimaryContainer =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumLatoPrimary =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumLatoff8f8f8f =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: Color(0XFF8F8F8F),
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumNotoSansHebrew =>
      theme.textTheme.titleMedium!.notoSansHebrew.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumNotoSansHebrewPrimaryContainer =>
      theme.textTheme.titleMedium!.notoSansHebrew.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumNunitoSans =>
      theme.textTheme.titleMedium!.nunitoSans.copyWith(
        fontSize: 16.sp,
      );
  static get titleMediumNunitoSans_1 => theme.textTheme.titleMedium!.nunitoSans;
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.sp,
      );
  static get titleMediumSegoeUI =>
      theme.textTheme.titleMedium!.segoeUI.copyWith(
        fontSize: 16.sp,
      );
  static get titleMediumWorkSansGray5004 =>
      theme.textTheme.titleMedium!.workSans.copyWith(
        color: appTheme.gray5004,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumWorkSansOnErrorContainer =>
      theme.textTheme.titleMedium!.workSans.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      );
  static get titleMedium_1 => theme.textTheme.titleMedium!;
  static get titleSmallNotoSansHebrewff000000 =>
      theme.textTheme.titleSmall!.notoSansHebrew.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallNotoSansff05ebd5 =>
      theme.textTheme.titleSmall!.notoSans.copyWith(
        color: Color(0XFF05EBD5),
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallNotoSansff28328c =>
      theme.textTheme.titleSmall!.notoSans.copyWith(
        color: Color(0XFF28328C),
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOpenSansBlack900 =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOpenSansBlack900SemiBold =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: appTheme.black900,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOpenSansCyan800 =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: appTheme.cyan800,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOpenSansGray70002 =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: appTheme.gray70002,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOpenSansGray70002SemiBold =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: appTheme.gray70002,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOpenSansOnPrimaryContainer =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOpenSansOnPrimaryContainerSemiBold =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallWorkSansOnErrorContainer =>
      theme.textTheme.titleSmall!.workSans.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
}

extension on TextStyle {
  TextStyle get openSans {
    return copyWith(
      fontFamily: 'Open Sans',
    );
  }

  TextStyle get segoeUI {
    return copyWith(
      fontFamily: 'Segoe UI',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get notoSansHebrew {
    return copyWith(
      fontFamily: 'Noto Sans Hebrew',
    );
  }

  TextStyle get workSans {
    return copyWith(
      fontFamily: 'Work Sans',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get notoSans {
    return copyWith(
      fontFamily: 'Noto Sans',
    );
  }

  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get nunitoSans {
    return copyWith(
      fontFamily: 'Nunito Sans',
    );
  }
}
