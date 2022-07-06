import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/empty_state_view.dart';
import 'package:smart_ix_takehome/src/l10n/l10n.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => state.services.isEmpty
          ? EmpptyStateView(
              text: l10n.noService,
            )
          : ListView.separated(
              itemCount: state.services.length,
              itemBuilder: (context, index) => Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.kcWhiteColor,
                ),
                child: ListTile(
                  title: Text(
                    state.services[index].name,
                    style: AppTextStyles.bodyStyle,
                  ),
                ),
              ),
              separatorBuilder: (_, __) => AppSpacing.verticalSpaceMedium,
            ),
    );
  }
}
