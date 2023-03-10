import 'package:app_movies/models/movie_detail_model.dart';
import 'package:app_movies/modules/movie_detail/widgets/movie_detail_content/movie_detail_content_credits.dart';
import 'package:app_movies/modules/movie_detail/widgets/movie_detail_content/movie_detail_content_title.dart';
import 'package:flutter/material.dart';

import 'movie_detail_content_casts.dart';
import 'movie_detail_content_production_companies.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailContent({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContentTitle(movie: movie),
        MovieDetailContentCredits(movie: movie),
        MovieDetailContentProductionCompanies(movie: movie),
        MovieDetailContentCasts(movie: movie),
      ],
    );
  }
}
