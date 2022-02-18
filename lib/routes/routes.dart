import 'package:futsal_app/bindings/auth_bind.dart';
import 'package:futsal_app/bindings/dashboard_bind.dart';
import 'package:futsal_app/bindings/detail_bind.dart';
import 'package:futsal_app/bindings/splash_bind.dart';
import 'package:futsal_app/routes/routes_name.dart';
import 'package:futsal_app/views/dashboard.dart';
import 'package:futsal_app/views/detail.dart';
import 'package:futsal_app/views/signin.dart';
import 'package:futsal_app/views/splash.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final route = [
    GetPage(
      name: AppRoutesName.splash,
      page: () => const SplashScreen(),
      binding: SplashBind(),
    ),
    GetPage(
      name: AppRoutesName.signin,
      page: () => const SigninScreen(),
      binding: AuthBind(),
    ),
    GetPage(
      name: AppRoutesName.signout,
      page: () => const SigninScreen(),
      binding: AuthBind(),
    ),
    GetPage(
      name: AppRoutesName.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBind(),
    ),
    GetPage(
      name: AppRoutesName.detail,
      page: () => const DetailScreen(),
      binding: DetailBind(),
    )
  ];
}
