import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/synopsis.dart';
import '../theme/app_theme.dart';
import '../models/movie_model.dart';

class MovieCardComplete extends StatelessWidget {
  final Movie movie;

  const MovieCardComplete({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                width: double.infinity,
                height: 330,
                fit: BoxFit.cover,
              ),
              Container(
                height: 330,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color.fromARGB(255, 0, 0, 0)],
                    stops: [0.5, 1],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              style: AppTheme.myCardTitle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Movie: ${movie.voteAverage}/10",
              style: AppTheme.myCardSubTitle,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Synopsis(description: movie.overview),
          ),
        ],
      ),
    );
  }
}
