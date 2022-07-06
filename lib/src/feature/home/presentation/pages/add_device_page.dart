import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ix_takehome/src/core/constants/app_asset_path.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/device_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:smart_ix_takehome/src/shared/menu_item.dart';
import 'package:smart_ix_takehome/src/shared/page.dart';

class AddDevicePage extends StatelessWidget {
  const AddDevicePage({super.key});

  static const route = '/add-device';

  @override
  Widget build(BuildContext context) {
    const devices = <Map<String, String>>[
      {'deviceName': 'Smart Bulb', 'image': AppAssetPath.bulb},
      {'deviceName': 'Smart Fan', 'image': AppAssetPath.fan},
      {'deviceName': 'Smart Router', 'image': AppAssetPath.router},
      {'deviceName': 'Smart Speaker', 'image': AppAssetPath.speaker},
    ];

    return AppPage(
      pageTitle: 'Add Device',
      body: Expanded(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (_, state) => BlocListener(
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
                ).then((value) => Navigator.of(context).pop());
              }
            },
            child: ListView.separated(
              itemBuilder: (_, index) => MenuSelectionItem(
                image: devices[index]['image']!,
                name: devices[index]['deviceName']!,
                onTap: () {
                  BlocProvider.of<HomeCubit>(context).addDevice(
                    DeviceEntity(
                      name: devices[index]['deviceName']!,
                      icon: devices[index]['image']!,
                      id: DateTime.now().toIso8601String(),
                      status: false,
                    ),
                  );
                },
              ),
              separatorBuilder: (_, __) => AppSpacing.verticalSpaceExtraLarge,
              itemCount: devices.length,
            ),
          ),
        ),
      ),
    );
  }
}
