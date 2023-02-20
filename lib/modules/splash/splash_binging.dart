import 'package:app_movies/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinging implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
