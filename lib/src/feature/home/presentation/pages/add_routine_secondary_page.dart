import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/add_routine_page_arguement.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/add_routine_page_state.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:smart_ix_takehome/src/shared/button.dart';
import 'package:smart_ix_takehome/src/shared/page.dart';

class AddSecondaryRoutinePage extends StatelessWidget {
  AddSecondaryRoutinePage({super.key});
  static const route = '/addroutine';

  final state = ValueNotifier<AddRoutinePageState>(
    const AddRoutinePageState(),
  );

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments! as AddRoutinePageArguement;
    state.value = state.value.copyWith(
      days: arguments.routine?.repeatedDays,
      time: arguments.routine?.time,
    );
    return AppPage(
      pageTitle: 'Add Routine',
      body: BlocListener(
        bloc: BlocProvider.of<HomeCubit>(context),
        listener: (context, state) {
          if (state is HomeLoading) {
            showDialog<Widget>(
              context: context,
              builder: (_) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kcWhiteColor,
                ),
              ),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'If',
                style: AppTextStyles.header3Styles.copyWith(
                  color: AppColors.kcWhiteColor,
                ),
              ),
              ValueListenableBuilder<AddRoutinePageState>(
                builder: (context, value, _) {
                  return Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.kcWhiteColor,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then(
                              (value) => state.value = state.value.copyWith(
                                time: value?.format(context),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                value.time,
                                style: AppTextStyles.bodyStyle,
                              ),
                            ),
                          ),
                          AppSpacing.verticalSpaceSmall,
                          Text(
                            'Repeat',
                            style: AppTextStyles.bodyStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: ['Su', 'M', 'T', 'W', 'Th', 'F', 'S']
                                .map(
                                  (day) => InkWell(
                                    onTap: () =>
                                        state.value = state.value.copyWith(
                                      days: state.value.days.contains(day)
                                          ? state.value.days
                                              .where(
                                                (element) => element != day,
                                              )
                                              .toList()
                                          : [...state.value.days, day],
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: state.value.days.contains(day)
                                            ? AppColors.kcPrimaryColor
                                            : AppColors.kcWhiteColor,
                                        border: Border.all(
                                          color: state.value.days.contains(day)
                                              ? AppColors.kcPrimaryColor
                                              : AppColors.kcBlackColor,
                                        ),
                                      ),
                                      child: Text(
                                        day,
                                        style: AppTextStyles.bodyStyle.copyWith(
                                          color: state.value.days.contains(day)
                                              ? AppColors.kcWhiteColor
                                              : AppColors.kcBlackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                valueListenable: state,
              ),
              AppSpacing.verticalSpaceLarge,
              Text(
                'Then',
                style: AppTextStyles.header3Styles.copyWith(
                  color: AppColors.kcWhiteColor,
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.kcWhiteColor,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 150,
                      child: Image.asset(
                        arguments.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          arguments.name,
                          style: AppTextStyles.bodyStyle,
                        ),
                        Text(
                          arguments.action ? 'On' : 'Off',
                          style: AppTextStyles.bodyStyle
                              .copyWith(color: AppColors.kcPrimaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppSpacing.verticalSpaceFairlyLarge,
              AppButton(
                text: 'Save',
                onTap: () {
                  if (arguments.routine == null) {
                    BlocProvider.of<HomeCubit>(context).addRoutine(
                      RoutineEntity(
                        id: DateTime.now().toIso8601String(),
                        name: arguments.name,
                        action: arguments.action,
                        imagePath: arguments.imagePath,
                        time: state.value.time,
                        repeatedDays: state.value.days,
                      ),
                    );
                  } else {
                    BlocProvider.of<HomeCubit>(context).editRoutine(
                      routine: RoutineEntity(
                        id: DateTime.now().toIso8601String(),
                        name: arguments.name,
                        action: arguments.action,
                        imagePath: arguments.imagePath,
                        time: state.value.time,
                        repeatedDays: state.value.days,
                      ),
                      oldRoutine: arguments.routine!,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
