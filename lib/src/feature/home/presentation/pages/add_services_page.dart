import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_asset_path.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/shared/dummy/menu_item.dart';
import 'package:smart_ix_takehome/src/shared/dummy/page.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage({super.key});

  static const route = '/add-service';

  @override
  Widget build(BuildContext context) {
    const service = <Map<String, String>>[
      {'serviceName': 'News', 'image': AppAssetPath.speaker},
      {'serviceName': 'Weather', 'image': AppAssetPath.speaker},
    ];

    return AppPage(
      pageTitle: 'Add Service',
      body: Expanded(
        child: ListView.separated(
          itemBuilder: (_, index) => MenuSelectionItem(
            image: service[index]['image']!,
            name: service[index]['serviceName']!,
          ),
          separatorBuilder: (_, __) => AppSpacing.verticalSpaceExtraLarge,
          itemCount: service.length,
        ),
      ),
    );
  }
}
