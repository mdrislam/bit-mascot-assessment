class MovieModel {
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final List<String> genres;
  final String status;
  final int budget;
  final int revenue;
  final int runtime;
  final List<CastModel> cast;

  MovieModel({
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
    required this.status,
    required this.budget,
    required this.revenue,
    required this.runtime,
    required this.cast,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'],
      genres: (json['genres'] as List).map((g) => g['name'] as String).toList(),
      status: json['status'],
      budget: json['budget'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      cast: (json['credits']['cast'] as List)
          .map((c) => CastModel.fromJson(c))
          .toList(),
    );
  }
}

class CastModel {
  final String name;
  final String character;
  final String profilePath;

  CastModel({
    required this.name,
    required this.character,
    required this.profilePath,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'] ?? 'Unknown',
      character: json['character'] ?? '',
      profilePath: json['profile_path'] ?? '',
    );
  }
}
