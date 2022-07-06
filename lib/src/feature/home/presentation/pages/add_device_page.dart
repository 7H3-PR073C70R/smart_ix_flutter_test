import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_asset_path.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
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
        child: ListView.separated(
          itemBuilder: (_, index) => MenuSelectionItem(
            image: devices[index]['image']!,
            name: devices[index]['deviceName']!,
          ),
          separatorBuilder: (_, __) => AppSpacing.verticalSpaceExtraLarge,
          itemCount: devices.length,
        ),
      ),
    );
  }
}
