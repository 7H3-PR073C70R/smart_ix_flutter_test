import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_asset_path.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/add_routine_page_arguement.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/pages/add_routine_secondary_page.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/routing.dart';
import 'package:smart_ix_takehome/src/locator.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';
import 'package:smart_ix_takehome/src/shared/page.dart';

class AddRoutinePage extends StatelessWidget {
  const AddRoutinePage({super.key});

  static const route = '/add-route';
  @override
  Widget build(BuildContext context) {
    final navigator = locator<NavigationService>();
    const routine = [
      {
        'name': 'Lighting',
        'imagePath': AppAssetPath.bulb,
        'actionText': 'light',
      },
      {
        'name': 'Fan',
        'imagePath': AppAssetPath.fan,
        'actionText': 'fan',
      },
      {
        'name': 'Router',
        'imagePath': AppAssetPath.bulb,
        'actionText': 'router',
      }
    ];
    return AppPage(
      pageTitle: 'Add Routine',
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: routine
                .map(
                  (routine) => RoutineWidget(
                    title: routine['name']!,
                    actionText: routine['actionText']!,
                    imagePath: routine['imagePath']!,
                    onTurnOff: () => navigator.navigateToNamed(
                      AddSecondaryRoutinePage.route,
                      arguments: AddRoutinePageArguement(
                        action: false,
                        name: 'Turn off ${routine['actionText']!}',
                        imagePath: routine['imagePath']!,
                      ),
                    ),
                    onTurnOn: () => navigator.navigateToNamed(
                      AddSecondaryRoutinePage.route,
                      arguments: AddRoutinePageArguement(
                        action: true,
                        name: 'Turn on ${routine['actionText']!}',
                        imagePath: routine['imagePath']!,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
