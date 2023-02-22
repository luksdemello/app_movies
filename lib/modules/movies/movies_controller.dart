import 'dart:developer';

import 'package:app_movies/application/auth/auth_service.dart';
import 'package:app_movies/application/ui/messages/messages_mixin.dart';
import 'package:app_movies/models/genre_model.dart';
import 'package:app_movies/models/movie_model.dart';
import 'package:app_movies/services/genres/genres_service.dart';
import 'package:app_movies/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMovies = <MovieModel>[];
  var _topRatedMovies = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();

  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
    required AuthService authService,
  })  : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await getGenres();
    await getMovies();
  }

  Future<void> getMovies() async {
    try {
      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRated();
      final favorites = await getFavorites();

      popularMoviesData = popularMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      topRatedMoviesData = topRatedMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      popularMovies.assignAll(popularMoviesData);
      topRatedMovies.assignAll(topRatedMoviesData);

      _popularMovies = popularMoviesData;
      _topRatedMovies = topRatedMoviesData;
    } catch (e, s) {
      log('Erro ao carregar dados da página', error: e, stackTrace: s);
      _message(
        MessageModel.error(
          title: 'Erro',
          message: 'Erro ao carregar dados da página',
        ),
      );
    }
  }

  Future<void> getGenres() async {
    try {
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);
    } catch (e, s) {
      log('Erro ao carregar genêros da página', error: e, stackTrace: s);
      _message(
        MessageModel.error(
          title: 'Erro',
          message: 'Erro ao carregar genêros da página',
        ),
      );
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMovies.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      var newTopRatedMovies = _topRatedMovies.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMovies);
      topRatedMovies.assignAll(_topRatedMovies);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    if (genreModel?.id == genreSelected.value?.id) {
      genreModel = null;
    }

    genreSelected.value = genreModel;

    if (genreModel != null) {
      var newPopularMovies = _popularMovies.where((movie) {
        return movie.genres.contains(genreModel?.id);
      });

      var newTopRatedMovies = _topRatedMovies.where((movie) {
        return movie.genres.contains(genreModel?.id);
      });

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMovies);
      topRatedMovies.assignAll(_topRatedMovies);
    }
  }

  Future<void> favoriteMovie(MovieModel movie) async {
    final user = _authService.user;

    if (user != null) {
      final newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    final user = _authService.user;

    if (user != null) {
      final favorites = await _moviesService.getFavoriesMovies(user.uid);

      return <int, MovieModel>{
        for (final fav in favorites) fav.id: fav,
      };
    }
    return {};
  }
}
