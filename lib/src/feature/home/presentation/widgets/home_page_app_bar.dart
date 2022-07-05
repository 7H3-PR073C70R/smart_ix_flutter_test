import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_asset_path.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/feature/authentication/presentation/pages/login_page.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/pages/add_routine_page.dart';
import 'package:smart_ix_takehome/src/locator.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';
import 'package:smart_ix_takehome/src/shared/dummy/svg_picture.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = locator<NavigationService>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 21,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) {
                  return InkWell(
                    onTap: () => navigator.navigateToNamed(
                            AddRoutinePage.route,
                          ),
                    // showMenu(
                    //   context: context,
                    //   shape: _menuShape(),
                    //   position: const RelativeRect.fromLTRB(0, 55, 1, 0),
                    //   items: [
                    //     PopupMenuItem<Widget>(
                    //       onTap: () => navigator.navigateToNamed(
                    //         AddDevicePage.route,
                    //       ),
                    //       child: Text(
                    //         'Add Devices',
                    //         style: AppTextStyles.bodyStyle,
                    //       ),
                    //     ),
                    //     PopupMenuItem<Widget>(
                    //       onTap: () => navigator.navigateToNamed(
                    //         AddServicePage.route,
                    //       ),
                    //       child: Text(
                    //         'Add Services',
                    //         style: AppTextStyles.bodyStyle,
                    //       ),
                    //     ),
                    //     PopupMenuItem<Widget>(
                    //       onTap: () => navigator.navigateToNamed(
                    //         AddRoutinePage.route,
                    //       ),
                    //       child: Text(
                    //         'Add Routines',
                    //         style: AppTextStyles.bodyStyle,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    child: const SvgPictureAsset(
                      assetName: AppAssetPath.menuIcon,
                      color: AppColors.kcWhiteColor,
                    ),
                  );
                },
              ),
              InkWell(
                onTap: () => showMenu(
                  context: context,
                  shape: _menuShape(),
                  position: const RelativeRect.fromLTRB(1, 65, 0, 0),
                  items: [
                    PopupMenuItem<Widget>(
                      onTap: () => navigator.navigateOffAllNamed(
                        LoginPage.route,
                        (route) => route.isFirst,
                      ),
                      child: const Text('Logout'),
                    ),
                  ],
                ),
                child: const SvgPictureAsset(
                  assetName: AppAssetPath.userIcon,
                  color: AppColors.kcWhiteColor,
                ),
              ),
            ],
          ),
          AppSpacing.verticalSpaceFairlyLarge,
          Text(
            'Hi Protector!',
            style: AppTextStyles.header4Styles.copyWith(
              color: AppColors.kcWhiteColor,
            ),
          ),
          AppSpacing.verticalSpaceSmall,
          Text(
            'Welcome to Smart Home',
            style: AppTextStyles.bodyStyle.copyWith(
              color: AppColors.kcWhiteColor,
            ),
          ),
        ],
      ),
    );
  }

  RoundedRectangleBorder _menuShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        10,
      ),
    );
  }
}
