import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:postage_staff/core/app/app_cubit/app_cubit.dart';
import 'package:postage_staff/core/app/connectivity_controller.dart';
import 'package:postage_staff/core/app/env.variable.dart';
import 'package:postage_staff/core/core_packages.dart';
import 'package:postage_staff/core/presentation/util/style/theme/app_theme.dart';
import 'package:postage_staff/core/routes/route_info.dart';
import 'package:postage_staff/core/routes/routes.dart';
import 'package:postage_staff/core/routes/utils/observer_utils.dart';
import 'package:postage_staff/core/translation/translations.dart';
import 'package:postage_staff/features/splash_feature/splash_screen.dart';
import 'package:postage_staff/injection/injection.dart';

class PostageApp extends StatelessWidget {
  const PostageApp({super.key});

  // const MyApp.PostageApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // AppRouter appRouter=AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppCubit>()
            ..changeAppThemeMode(
              sharedMode: SharedPref.getBoolean(PrefKeys.themeMode) ?? false,
            )
            ..getSavedLanguage(),
        ),
      ],
      child: ValueListenableBuilder(
        valueListenable: ConnectivityController.instance.isConnected,
        builder: (_, isConnect, __) {
          // if (isConnect||) {
          return BlocBuilder<AppCubit, AppState>(
            buildWhen: (previous, current) {
              return previous != current;
            },
            builder: (BuildContext context, state) {
              final cubit = context.read<AppCubit>();
              print(cubit.isDark);
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                child: MaterialApp.router(
                  supportedLocales: Translations.supportedLocales,
                  localizationsDelegates: const [
                    ...Translations.localizationsDelegates,
                  ],
                  locale: Locale(cubit.currentLangCode),
                  themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
                  theme: cubit.isDark ? themeDark() : themeLight(),
                  routerConfig: _goRouterConfig,
                  title: 'Postage',
                  debugShowCheckedModeBanner: EnvVariable.instance.isDebugMode,
                ),
              );
            },
          );

          // }

          // else {
          //   return MaterialApp(
          //     title: 'Flutter Demo',
          //     debugShowCheckedModeBanner: EnvVariable.instance.isDebugMode,
          //     theme: ThemeData(
          //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //       useMaterial3: true,
          //     ),
          //     home: const NoNetworkScreen(),
          //   );
          // }
        },
      ),
    );
  }
}

final GoRouter _goRouterConfig = GoRouter(
  initialLocation: SplashView.path,

  // initialLocation: ConfirmOtpView.path,
  observers: [ObserverUtils.routeObserver],
  routes: _getRoutes(Routes.I.routes),
);

List<GoRoute> _getRoutes(List<RouteInfo>? routes) => (routes ?? [])
    .map(
      (subRoute) => GoRoute(
        path: subRoute.path,
        name: subRoute.name ?? subRoute.path,
        builder: (context, state) => subRoute.builder(context, state),
        routes: _getRoutes(subRoute.routes),
      ),
    )
    .toList();
