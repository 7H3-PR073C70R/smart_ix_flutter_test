import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/empty_state_view.dart';
import 'package:smart_ix_takehome/src/l10n/l10n.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return EmpptyStateView(
      text: l10n.noService,
    );
  }
}
