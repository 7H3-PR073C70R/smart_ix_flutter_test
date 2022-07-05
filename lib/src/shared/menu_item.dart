import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';

class MenuSelectionItem extends StatelessWidget {
  const MenuSelectionItem({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 19),
      height: 64,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.kcWhiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            name,
            style: AppTextStyles.bodyStyle,
          ),
        ],
      ),
    );
  }
}
