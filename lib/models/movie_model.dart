import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final List<int> genres;
  final bool favorite;

  MovieModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.genres,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'poster_path': posterPath,
      'genre_ids': genres,
      'favorite': favorite,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      releaseDate: map['release_date'] ?? '',
      posterPath: 'https://image.tmdb.org/t/p/w200/${map['poster_path']}',
      favorite: map['favorite'] ?? false,
      genres: List<int>.from(map['genre_ids'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
