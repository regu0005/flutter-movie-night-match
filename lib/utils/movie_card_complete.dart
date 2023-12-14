import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/movie_model.dart';

class MovieCardComplete extends StatelessWidget {
  final Movie movie;

  const MovieCardComplete({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 220,
              height: 330,
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
              child: Text("Movie: ${movie.voteAverage}/10",
                  style: AppTheme.myCardSubTitle),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.overview,
                style: AppTheme.myCardDescription,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
