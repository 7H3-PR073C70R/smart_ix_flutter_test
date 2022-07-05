import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/empty_state_view.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmpptyStateView(
      text: '''
No routine added yet. 
To add a routine, click on the hamburger icon on the top left corner.
          ''',
    );
  }
}
