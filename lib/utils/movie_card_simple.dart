import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/movie_model.dart';

class MovieCardSimple extends StatelessWidget {
  final Movie movie;

  const MovieCardSimple({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350,
              height: 490,
              child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movie.name,
                  style: AppTheme.myCardTitle, textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Rating: ${movie.voteAverage}/10",
                  style: AppTheme.myCardSubTitle),
            ),
          ],
        ),
      ),
    );
  }
}
