import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/shared/button.dart';

class RoutineWidget extends StatelessWidget {
  const RoutineWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.actionText,
    required this.onTurnOn,
    required this.onTurnOff,
  });

  final String title;
  final String imagePath;
  final String actionText;
  final VoidCallback onTurnOn;
  final VoidCallback onTurnOff;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.kcWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            alignment: Alignment.center,
            child: Image.asset(imagePath),
          ),
          Text(
            title,
            style: AppTextStyles.bodyStyle,
          ),
          AppSpacing.verticalSpaceSmall,
          AppButton(
            text: 'Turn on $actionText',
            onTap: onTurnOn,
          ),
          AppSpacing.verticalSpaceSmall,
          AppButton(
            text: 'Turn off $actionText',
            onTap: onTurnOff,
          ),
        ],
      ),
    );
  }
}
