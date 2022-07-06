import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';

class PageSwitcherItem extends StatelessWidget {
  const PageSwitcherItem({
    super.key,
    required this.index,
    required this.text,
  });

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: BlocProvider.of<HomeCubit>(context),
      builder: (context, state) {
        return InkWell(
          onTap: () {
            BlocProvider.of<HomeCubit>(context).onPageChanged(index);
          },
          child: Container(
            height: 45,
            width: AppSpacing.screenWidth(context) * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: state.currentPageIndex == index
                  ? AppColors.kcPrimaryColor
                  : AppColors.kcWhiteColor,
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: AppTextStyles.bodyStyle.copyWith(
                color: state.currentPageIndex == index
                    ? AppColors.kcWhiteColor
                    : AppColors.kcBlackColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
