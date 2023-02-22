// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_movies/models/cast_model.dart';
import 'package:app_movies/models/genre_model.dart';

class MovieDetailModel {
  final int id;
  final String title;
  final double starts;
  final List<GenreModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;

  MovieDetailModel({
    required this.id,
    required this.title,
    required this.starts,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'starts': starts,
      'genres': genres.map((x) => x.toMap()).toList(),
      'urlImages': urlImages,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'productionCompanies': productionCompanies,
      'originalLanguage': originalLanguage,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailModel(
      id: map['id'] as int,
      title: map['title'] as String,
      starts: map['vote_average'] as double,
      genres: List<GenreModel>.from(
          (map['genres'])?.map<GenreModel>((x) => GenreModel.fromMap(x)) ??
              const []),
      urlImages: List<dynamic>.from((map['images']['posters'] ?? const []))
          .map<String>(
              (i) => 'https://image.tmdb.org/t/p/w200${i['profile_path']}')
          .toList(),
      overview: map['overview'] ?? '',
      releaseDate: DateTime.parse(map['release_date']),
      productionCompanies:
          List<dynamic>.from((map['production_companies'] ?? const []))
              .map<String>((p) => p['name'])
              .toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<CastModel>.from((map['credits']['cast'])
              ?.map<CastModel>((x) => CastModel.fromMap(x)) ??
          const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
