import 'package:app_movies/modules/favorites/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FavoritesController(
        authService: Get.find(),
        moviesService: Get.find(),
      ),
    );
  }
}
