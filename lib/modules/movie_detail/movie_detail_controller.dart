import 'dart:developer';

import 'package:app_movies/application/ui/loader/loader_mixin.dart';
import 'package:app_movies/application/ui/messages/messages_mixin.dart';
import 'package:app_movies/models/movie_detail_model.dart';
import 'package:app_movies/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final movie = Rxn<MovieDetailModel>();

  MovieDetailController({
    required MoviesService moviesService,
  }) : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      _loading(true);
      final result = await _moviesService.getDetail(movieId);
      movie(result);
      _loading(false);
    } catch (e, s) {
      _loading(false);
      log('Erro ao buscar detalhes do filme', error: e, stackTrace: s);
      _message(
        MessageModel.error(
            title: 'Erro', message: 'Erro ao buscar detalhes do filme'),
      );
    }
  }
}
