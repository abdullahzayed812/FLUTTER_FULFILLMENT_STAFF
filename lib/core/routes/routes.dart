import 'package:postage_staff/core/routes/route_info.dart';
import 'package:postage_staff/features/home_test_feature/view/home_test_view.dart';
import 'package:postage_staff/features/splash_feature/splash_screen.dart';

// part 'lorawan_routes.dart';

class Routes {
  Routes._();

  static Routes I = Routes._();
  final List<RouteInfo> routes = [
    // RouteInfo(
    //   path: LoginPage.path,
    //   builder: (context, state) => const LoginPage(),
    //   routes: [
    //     RouteInfo(
    //       path: RootLoginPage.path,
    //       builder: (context, state) => const RootLoginPage(),
    //     ),
    //   ],
    // ),

    // ...[
    //
    //   RouteInfo(
    //     path: SplashView.path,
    //     builder: (context, state) => const SplashView(),
    //   ),
    //   RouteInfo(
    //     path: OnBoardingView.path,
    //     builder: (context, state) => const OnBoardingView(),
    //   ),
    // ],
    //
    // ...[
    //   RouteInfo(
    //     path: LoginView.path,
    //     builder: (context, state) => const LoginView(),
    //   ),
    //   RouteInfo(
    //     path: forgetpassword_featureView.path,
    //     builder: (context, state) => const forgetpassword_featureView(),
    //   ),
    //   RouteInfo(
    //     path: ConfirmOtpView.path,
    //     builder: (context, state) => const ConfirmOtpView(),
    //   ),
    //   RouteInfo(
    //     path: ResetPasswordView.path,
    //     builder: (context, state) => const ResetPasswordView(),
    //   ),
    // ],
    //

    // ..._lorawanRoutes,
    // HomeView
    // RouteInfo(
    //   path: HomeView.path,
    //   builder: (context, state) => const HomeView(),
    // ),


    RouteInfo(
      path: SplashView.path,
      builder: (context, state) => const SplashView(),
    ),
    RouteInfo(
      path: HomeTestView.path,
      builder: (context, state) => const HomeTestView(),
    ),
    // RouteInfo(
    //   path: HomeView.path,
    //   builder: (context, state) => const HomeView(),
    // ),

    // RegisterScreen
    // LayoutScreen
    // ProfileScreen
    // ChangePasswordScreen
    // LayoutScreen
    // LoginOrSignUpScreen
    // LayoutScreen
    // LoginScreen
    // LoginOrSignUpScreen
    // RegisterScreen
    // PrivacyPolicyScreen
    // SplashView
  ];
}
