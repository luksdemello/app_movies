import 'package:app_movies/application/modules/module.dart';
import 'package:app_movies/modules/splash/splash_binging.dart';
import 'package:app_movies/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBinging(),
    ),
  ];
}
