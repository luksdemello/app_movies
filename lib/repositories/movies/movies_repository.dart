import 'package:app_movies/models/movie_detail_model.dart';
import 'package:app_movies/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailModel?> getDetail(int id);
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
  Future<List<MovieModel>> getFavoriesMovies(String userId);
}
