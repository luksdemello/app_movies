import 'package:app_movies/application/modules/module.dart';
import 'package:app_movies/modules/movie_detail/movie_detail_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'movie_detail_binding.dart';

class MovieDetailModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => const MovieDetailPage(),
      binding: MovieDetailBinding(),
    )
  ];
}
