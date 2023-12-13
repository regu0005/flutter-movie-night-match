import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/utils/global.dart';

class MovieWinnerScreen extends StatelessWidget {
  final String movieId;

  const MovieWinnerScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Won')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Movie winner: $movieId',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text('You guessed the movie correctly'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              // onPressed: () {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => HomeScreen()),
              //   );
              // },
              child: const Text('Return to Home'),
            ),
          ],
        ),
      ),
    );
  }
}


 // children: <Widget>[
        //   Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}',
        //       fit: BoxFit.cover),
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(movie.name,
        //         style: AppTheme.mySubtitleStyle, textAlign: TextAlign.center),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       "Movie: ${movie.voteAverage}/10",
        //       style: AppTheme.myDescriptionStyle,
        //     ),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       movie.overview,
        //       style: AppTheme.myDescriptionStyle,
        //       textAlign: TextAlign.center,
        //       overflow: TextOverflow.ellipsis,
        //       maxLines: 3,
        //     ),
        //   ),
        // ],