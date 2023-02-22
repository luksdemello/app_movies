import 'package:app_movies/modules/movie_detail/movie_detail_controller.dart';
import 'package:get/get.dart';

class MovieDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MovieDetailController(
        moviesService: Get.find(),
      ),
    );
  }
}
