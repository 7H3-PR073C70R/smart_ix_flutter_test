import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:smart_ix_takehome/src/core/constants/app_asset_path.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/locator.dart';
import 'package:smart_ix_takehome/src/shared/button.dart';
import 'package:smart_ix_takehome/src/shared/page.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});
  static const route = '/routine';
  @override
  Widget build(BuildContext context) {
    return AppPage(
      pageTitle: 'Add Routine',
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'If',
              style: AppTextStyles.header3Styles.copyWith(
                color: AppColors.kcWhiteColor,
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.kcWhiteColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () => showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then(
                  (value) => locator<Logger>().i(
                    value?.format(context),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '8:00 AM',
                      style: AppTextStyles.bodyStyle,
                    ),
                    Text(
                      'Every day',
                      style: AppTextStyles.bodyStyle
                          .copyWith(color: AppColors.kcPrimaryColor),
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.verticalSpaceLarge,
            Text(
              'Then',
              style: AppTextStyles.header3Styles.copyWith(
                color: AppColors.kcWhiteColor,
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.kcWhiteColor,
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 150,
                    child: Image.asset(
                      AppAssetPath.bulb,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Light',
                        style: AppTextStyles.bodyStyle,
                      ),
                      Text(
                        'On',
                        style: AppTextStyles.bodyStyle
                            .copyWith(color: AppColors.kcPrimaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppSpacing.verticalSpaceFairlyLarge,
            AppButton(
              text: 'Save',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
