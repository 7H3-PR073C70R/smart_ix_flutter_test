import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/core/utils/responsivness.dart';

class EmpptyStateView extends StatelessWidget {
  const EmpptyStateView({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Text(
        text,
        style: AppTextStyles.header4Styles.copyWith(
          fontSize: 18.fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
