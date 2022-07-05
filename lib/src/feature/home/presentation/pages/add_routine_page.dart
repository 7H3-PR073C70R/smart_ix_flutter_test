import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/shared/page.dart';

class AddRoutinePage extends StatelessWidget {
  const AddRoutinePage({super.key});

  static const route = '/add-route';

  @override
  Widget build(BuildContext context) {
    return AppPage(
      pageTitle: 'Add Routine',
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
