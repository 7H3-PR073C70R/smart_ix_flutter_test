import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/empty_state_view.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmpptyStateView(
      text: '''
No services added yet. 
To add a routine, click on the hamburger icon on the top left corner.
          ''',
    );
  }
}
