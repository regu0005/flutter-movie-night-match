// class Movie {
//   final int id;
//   final String name;
//   final String overview;
//   final double voteAverage;
//   final String posterPath;
//   final String firstAirDate;
//   final List<int> genreIds;
//   final List<String> originCountry;
//   final String originalLanguage;
//   final String originalName;
//   final double popularity;
//   final int voteCount;

//   Movie({
//     required this.id,
//     required this.name,
//     required this.overview,
//     required this.voteAverage,
//     required this.posterPath,
//     required this.firstAirDate,
//     required this.genreIds,
//     required this.originCountry,
//     required this.originalLanguage,
//     required this.originalName,
//     required this.popularity,
//     required this.voteCount,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       id: json['id'],
//       name: json['name'],
//       overview: json['overview'],
//       voteAverage: (json['vote_average'] as num).toDouble(),
//       posterPath: json['poster_path'],
//       firstAirDate: json['first_air_date'],
//       genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
//       originCountry: List<String>.from(json['origin_country'].map((x) => x)),
//       originalLanguage: json['original_language'],
//       originalName: json['original_name'],
//       popularity: (json['popularity'] as num).toDouble(),
//       voteCount: json['vote_count'],
//     );
//   }
// }
class Movie {
  final int id;
  final String title;
  final String overview;
  final double voteAverage;
  final String posterPath;
  final String releaseDate;
  final List<int> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final double popularity;
  final int voteCount;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.posterPath,
    required this.releaseDate,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.popularity,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      popularity: (json['popularity'] as num).toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
