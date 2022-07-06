import 'package:flutter/widgets.dart';

class AppColors {
  const AppColors._();
  static const kcPrimaryColor = Color(0xFF50307F);
  static const kcWhiteColor = Color(0xFFFFFFFF);
  static const kcErrorColor = Color(0xFFFF472E);
  static const kcSuccessColor = Color(0xFF42DC92);
  static const kcWarningColor = Color(0xFFFFC32E);
  static const kcBlackColor = Color(0xFF000000);
  static const kcGrayColor = Color(0xFF908B96);

  //! Gradient
  static const gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.kcPrimaryColor,
      AppColors.kcGrayColor,
    ],
  );

  //! colors for text styles
  static const kcPrimaryTextColor = Color(0xFF1F2121);
}
