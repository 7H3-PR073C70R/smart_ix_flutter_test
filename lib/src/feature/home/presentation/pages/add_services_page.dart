import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ix_takehome/src/core/constants/app_asset_path.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/utils/services_type.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/service_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:smart_ix_takehome/src/shared/menu_item.dart';
import 'package:smart_ix_takehome/src/shared/page.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage({super.key});

  static const route = '/add-service';

  @override
  Widget build(BuildContext context) {
    const service = <Map<String, String>>[
      {'serviceName': 'News', 'image': AppAssetPath.speaker},
      {'serviceName': 'Weather', 'image': AppAssetPath.speaker},
    ];

    return AppPage(
      pageTitle: 'Add Service',
      body: Expanded(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (_, state) => BlocListener(
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
            child: ListView.separated(
              itemBuilder: (_, index) => MenuSelectionItem(
                image: service[index]['image']!,
                name: service[index]['serviceName']!,
                onTap: () {
                  BlocProvider.of<HomeCubit>(context).addService(
                    ServiceEntity(
                      name: service[index]['serviceName']!,
                      details: 'Added ${service[index]['serviceName']}',
                      icon: '',
                      id: '',
                      type: service[index]['serviceName']! == 'News'
                          ? ServiceType.news
                          : ServiceType.weather,
                    ),
                  );
                },
              ),
              separatorBuilder: (_, __) => AppSpacing.verticalSpaceExtraLarge,
              itemCount: service.length,
            ),
          ),
        ),
      ),
    );
  }
}
