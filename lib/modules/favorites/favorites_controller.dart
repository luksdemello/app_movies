import 'dart:developer';

import 'package:app_movies/application/auth/auth_service.dart';
import 'package:app_movies/application/ui/loader/loader_mixin.dart';
import 'package:app_movies/application/ui/messages/messages_mixin.dart';
import 'package:app_movies/models/movie_model.dart';
import 'package:app_movies/services/movies/movies_service.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController
    with MessagesMixin, LoaderMixin {
  final MoviesService _moviesService;
  final AuthService _authService;

  final message = Rxn<MessageModel>();
  final loading = false.obs;

  final movies = <MovieModel>[].obs;

  FavoritesController({
    required MoviesService moviesService,
    required AuthService authService,
  })  : _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await _getFavorites();
  }

  Future<void> _getFavorites() async {
    try {
      final user = _authService.user;
      if (user != null) {
        final favorites = await _moviesService.getFavoriesMovies(user.uid);
        movies.assignAll(favorites);
      }
    } catch (e, s) {
      log('Erro ao buscar favoritos', error: e, stackTrace: s);
      message(
        MessageModel.error(
          title: 'Erro',
          message: 'Erro ao buscar favoritos',
        ),
      );
    }
  }

  Future<void> removeFavorites(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(
          user.uid, movie.copyWith(favorite: false));
      movies.remove(movie);
    }
  }
}
