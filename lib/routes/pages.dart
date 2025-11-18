import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg1_01/bindings/main_bindings.dart';
import 'package:pas_mobile_11pplg1_01/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg1_01/bindings/splash_binding.dart';
import 'package:pas_mobile_11pplg1_01/pages/login_page.dart';
import 'package:pas_mobile_11pplg1_01/pages/main_page.dart';
import 'package:pas_mobile_11pplg1_01/pages/register_page.dart';
import 'package:pas_mobile_11pplg1_01/pages/splash_page.dart';
import 'package:pas_mobile_11pplg1_01/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.register, page: () => RegisterPage(), binding: RegisterBinding()),
    GetPage(name: AppRoutes.main, page: () => MainPage(), binding: MainBindings()),
    GetPage(name: AppRoutes.splash, page: () => SplashPage(), binding: SplashBinding())
  ];
}