import 'package:app_movies/modules/favorites/favorites_page.dart';
import 'package:app_movies/modules/home/home_controller.dart';
import 'package:app_movies/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../application/ui/app_movies_icons_icons.dart';
import 'package:app_movies/application/ui/theme_extensios.dart';

import '../movies/widgets/movies_binding.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.colorRed,
          unselectedItemColor: context.colorGrey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Filmes',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppMoviesIcons.heartEmpty),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login_outlined),
              label: 'Sair',
            ),
          ],
        );
      }),
      body: Navigator(
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        initialRoute: '/movies',
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPage(),
              binding: MoviesBinding(),
            );
          }

          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
            );
          }

          return null;
        },
      ),
    );
  }
}
