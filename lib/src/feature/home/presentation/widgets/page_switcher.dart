import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/page_switcher_item.dart';

class PageSwitcher extends StatelessWidget {
  const PageSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.kcWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          PageSwitcherItem(
            index: 0,
            text: 'Devices',
          ),
          PageSwitcherItem(
            index: 1,
            text: 'Routine',
          ),
          PageSwitcherItem(
            index: 2,
            text: 'Service',
          ),
        ],
      ),
    );
  }
}
