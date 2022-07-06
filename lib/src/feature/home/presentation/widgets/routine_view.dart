import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/add_routine_page_arguement.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/pages/add_routine_secondary_page.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/empty_state_view.dart';
import 'package:smart_ix_takehome/src/l10n/l10n.dart';
import 'package:smart_ix_takehome/src/locator.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => state.routines.isEmpty
          ? EmpptyStateView(
              text: l10n.noRoutine,
            )
          : ListView.separated(
              itemBuilder: (context, index) => InkWell(
                onTap: () => locator<NavigationService>().navigateToNamed(
                  AddSecondaryRoutinePage.route,
                  arguments: AddRoutinePageArguement(
                    action: state.routines[index].action,
                    name: state.routines[index].name,
                    imagePath: state.routines[index].imagePath,
                    routine: state.routines[index],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.kcWhiteColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            state.routines[index].name,
                            style: AppTextStyles.bodyStyle,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                state.routines[index].time,
                                style: AppTextStyles.bodyStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppSpacing.verticalSpaceSmall,
                      if (state.routines[index].repeatedDays.length == 7)
                        Text(
                          'Everyday',
                          style: AppTextStyles.bodyStyle
                              .copyWith(color: AppColors.kcPrimaryColor),
                        )
                      else
                        Row(
                          children: state.routines[index].repeatedDays
                              .map(
                                (day) => Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColors.kcPrimaryColor,
                                    border: Border.all(
                                      color: AppColors.kcWhiteColor,
                                    ),
                                  ),
                                  child: Text(
                                    day,
                                    style: AppTextStyles.bodyStyle.copyWith(
                                      color: AppColors.kcWhiteColor,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) =>
                  AppSpacing.verticalSpaceSmall,
              itemCount: state.routines.length,
            ),
    );
  }
}
