import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ix_takehome/src/core/router/router.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/usecases/login_usecase.dart';
import 'package:smart_ix_takehome/src/feature/authentication/presentation/cubits/cubit/login_cubit.dart';
import 'package:smart_ix_takehome/src/feature/authentication/presentation/pages/login_page.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:smart_ix_takehome/src/l10n/l10n.dart';
import 'package:smart_ix_takehome/src/locator.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => LoginCubit(
                loginUseCase: locator<LoginUsecase>(),
                navigationService: locator<NavigationService>(),
              ),
            ),
            BlocProvider(create: (_) => HomeCubit()),
          ],
          child: MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                elevation: 0,
                toolbarHeight: 1,
              ),
              colorScheme: ColorScheme.fromSwatch(
                accentColor: const Color(0xFF13B9FF),
              ),
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            routes: routes,
            initialRoute: LoginPage.route,
            navigatorKey: locator<NavigationService>().navigatorKey,
          ),
        );
      },
    );
  }
}
