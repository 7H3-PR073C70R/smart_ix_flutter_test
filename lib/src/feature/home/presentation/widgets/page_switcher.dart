import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/page_switcher_item.dart';
import 'package:smart_ix_takehome/src/l10n/l10n.dart';

class PageSwitcher extends StatelessWidget {
  const PageSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
        children: [
          PageSwitcherItem(
            index: 0,
            text: l10n.devices,
          ),
          PageSwitcherItem(
            index: 1,
            text: l10n.routine,
          ),
          PageSwitcherItem(
            index: 2,
            text: l10n.service,
          ),
        ],
      ),
    );
  }
}
