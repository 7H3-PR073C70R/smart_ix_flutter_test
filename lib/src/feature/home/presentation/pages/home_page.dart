import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/devices_view.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/home_page_app_bar.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/page_switcher.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/routine_view.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/widgets/services_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kcPrimaryColor,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const HomeAppBar(),
              AppSpacing.verticalSpaceLarge,
              const PageSwitcher(),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  bloc: BlocProvider.of<HomeCubit>(context),
                  builder: (contex, state) => Center(
                    child: Container(
                      margin: const EdgeInsets.all(18),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: const Color(0xFFE0E0E0),
                      ),
                      child: const [
                        DeviceView(),
                        RoutineView(),
                        ServicesView(),
                      ].elementAt(state.currentPageIndex),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
