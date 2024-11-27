import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/my_team_page/bindings/my_team_page_binding.dart';
import '../modules/my_team_page/views/my_team_page_view.dart';
import '../modules/produk_page/bindings/produk_page_binding.dart';
import '../modules/produk_page/views/produk_page_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_TEAM_PAGE,
      page: () => const MyTeamPageView(),
      binding: MyTeamPageBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK_PAGE,
      page: () => const ProdukPageView(),
      binding: ProdukPageBinding(),
    ),
  ];
}
