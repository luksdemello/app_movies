import 'dart:developer';

import 'package:app_movies/application/rest_client/rest_client.dart';
import 'package:app_movies/models/movie_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
      },
      decoder: (data) {
        final resultData = data['results'];
        if (resultData != null) {
          return resultData
              .map<MovieModel>((m) => MovieModel.fromMap(m))
              .toList();
        }
        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      log('Erro ao buscar top filmes', error: result.statusText);
      throw Exception('Erro ao buscar top filmes');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
      },
      decoder: (data) {
        final resultData = data['results'];
        if (resultData != null) {
          return resultData
              .map<MovieModel>((m) => MovieModel.fromMap(m))
              .toList();
        }
        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      log('Erro ao buscar top filmes', error: result.statusText);
      throw Exception('Erro ao buscar top filmes');
    }

    return result.body ?? <MovieModel>[];
  }
}