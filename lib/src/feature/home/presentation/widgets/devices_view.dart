import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/core/utils/responsivness.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/empty_state_view.dart';
import 'package:smart_ix_takehome/src/l10n/l10n.dart';

class DeviceView extends StatefulWidget {
  const DeviceView({super.key});

  @override
  State<DeviceView> createState() => _DeviceViewState();
}

class _DeviceViewState extends State<DeviceView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: BlocProvider.of<HomeCubit>(
        context,
      ),
      builder: (context, state) => BlocListener(
        bloc: BlocProvider.of<HomeCubit>(context),
        listener: (context, state) {
          if (state is HomeLoading) {
            showDialog<Widget>(
              context: context,
              builder: (_) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kcWhiteColor,
                ),
              ),
            );
          }
        },
        child: state.devices.isEmpty
            ? EmpptyStateView(text: l10n.noDevice)
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 29,
                  childAspectRatio: 1 / 1.7,
                ),
                itemCount: state.devices.length,
                itemBuilder: (contexr, index) => Container(
                  decoration: BoxDecoration(
                    color: AppColors.kcWhiteColor,
                    borderRadius: BorderRadius.circular(31.41),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset(
                        state.devices[index].icon,
                        height: 150.height,
                        fit: BoxFit.contain,
                      ),
                      AppSpacing.verticalSpaceSmall,
                      Text(
                        state.devices[index].name,
                        style: AppTextStyles.bodyStyle,
                      ),
                      AppSpacing.verticalSpaceSmall,
                      if (Platform.isIOS)
                        CupertinoSwitch(
                          value: state.devices[index].status,
                          onChanged: (value) {
                            BlocProvider.of<HomeCubit>(context).toggleDevice(
                              state.devices[index],
                            );
                            setState(() {});
                          },
                          activeColor: AppColors.kcPrimaryColor,
                          trackColor: AppColors.kcGrayColor,
                        )
                      else
                        Switch(
                          value: state.devices[index].status,
                          onChanged: (value) {
                            BlocProvider.of<HomeCubit>(context).toggleDevice(
                              state.devices[index],
                            );
                            setState(() {});
                          },
                          activeColor: AppColors.kcPrimaryColor,
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
