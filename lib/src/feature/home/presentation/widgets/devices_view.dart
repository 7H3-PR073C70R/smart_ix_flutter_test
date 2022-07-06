import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ix_takehome/src/core/constants/app_asset_path.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/core/utils/responsivness.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/empty_state_view.dart';
import 'package:smart_ix_takehome/src/l10n/l10n.dart';

class DeviceView extends StatelessWidget {
  const DeviceView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (_, state) => state.devices.isEmpty
          ? EmpptyStateView(text: l10n.noDevice)
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 29,
                childAspectRatio: 1 / 1.7,
              ),
              itemCount: 4,
              itemBuilder: (contexr, index) => Container(
                decoration: BoxDecoration(
                  color: AppColors.kcWhiteColor,
                  borderRadius: BorderRadius.circular(31.41),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.asset(
                      AppAssetPath.fan,
                      height: 150.height,
                      fit: BoxFit.contain,
                    ),
                    AppSpacing.verticalSpaceSmall,
                    Text(
                      'Smart Bulb',
                      style: AppTextStyles.bodyStyle,
                    ),
                    AppSpacing.verticalSpaceSmall,
                    if (Platform.isIOS)
                      CupertinoSwitch(
                        value: false,
                        onChanged: (value) {},
                        activeColor: AppColors.kcPrimaryColor,
                        trackColor: AppColors.kcGrayColor,
                      )
                    else
                      Switch(
                        value: false,
                        onChanged: (value) {},
                        activeColor: AppColors.kcPrimaryColor,
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}
