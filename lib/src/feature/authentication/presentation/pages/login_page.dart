import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_ix_takehome/src/core/constants/app_asset_path.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_spacing.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';
import 'package:smart_ix_takehome/src/core/utils/responsivness.dart';
import 'package:smart_ix_takehome/src/core/utils/validator.dart';
import 'package:smart_ix_takehome/src/feature/authentication/presentation/cubits/cubit/login_cubit.dart';
import 'package:smart_ix_takehome/src/feature/authentication/presentation/widgets/auth_input_field.dart';
import 'package:smart_ix_takehome/src/shared/svg_picture.dart';

class LoginPage extends HookWidget {
  LoginPage({super.key});
  static const route = '/login';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kcBlackColor,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.kcBlackColor,
              AppColors.kcPrimaryTextColor,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SvgPictureAsset(
                assetName: AppAssetPath.appLogo,
                color: AppColors.kcPrimaryColor,
              ),
              AppSpacing.verticalSpaceLarge,
              Text(
                'SMART HOME',
                style: AppTextStyles.header4Styles.copyWith(
                  color: AppColors.kcWhiteColor,
                ),
              ),
              AppSpacing.verticalSpaceLarge,
              Container(
                height: 390.height,
                width: 255.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.kcGrayColor.withOpacity(0.6),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 43,
                  horizontal: 22,
                ),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AuthInputField(
                            keyboardType: TextInputType.emailAddress,
                            label: 'Email',
                            controller: emailController,
                            validator: context.validateEmailAddress,
                          ),
                          AppSpacing.verticalSpaceSmall,
                          AuthInputField(
                            keyboardType: TextInputType.visiblePassword,
                            label: 'Password',
                            obscureText: true,
                            controller: passwordController,
                            validator: context.validateFieldNotEmpty,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    BlocBuilder(
                      bloc: BlocProvider.of<LoginCubit>(context),
                      builder: (context, state) {
                        if (state is! LoginLoading) {
                          return InkWell(
                            onTap: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }

                              BlocProvider.of<LoginCubit>(
                                context,
                                listen: false,
                              ).onLoginButtonPressed(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                            child: Container(
                              height: 53.height,
                              width: 113.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: AppColors.kcPrimaryColor,
                              ),
                              child: Text(
                                'sign in',
                                style: AppTextStyles.bodyStyle.copyWith(
                                  color: AppColors.kcWhiteColor,
                                ),
                              ),
                            ),
                          );
                        }
                        return Container(
                          height: 53.height,
                          width: 113.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: AppColors.kcPrimaryColor,
                          ),
                          child: const CircularProgressIndicator(
                            color: AppColors.kcWhiteColor,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
