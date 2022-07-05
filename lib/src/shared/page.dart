import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/core/utils/responsivness.dart';
import 'package:smart_ix_takehome/src/locator.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    required this.pageTitle,
    required this.body,
  });
  final String pageTitle;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kcPrimaryColor,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () =>
                        locator<NavigationService>().navigateBack(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.kcWhiteColor,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        pageTitle,
                        style: AppTextStyles.header4Styles.copyWith(
                          color: AppColors.kcWhiteColor,
                          fontSize: 28.fontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body,
            ],
          ),
        ),
      ),
    );
  }
}
