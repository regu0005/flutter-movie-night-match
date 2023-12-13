class Movie {
  final int id;
  final String name;
  final String overview;
  final double voteAverage;
  final String posterPath;

  Movie({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      posterPath: json['poster_path'],
    );
  }
}
