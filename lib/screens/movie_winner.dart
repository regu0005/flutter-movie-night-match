import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/data/movie_data_storage.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/theme/app_theme.dart';
import 'package:flutter_project/utils/global.dart';
import 'package:flutter_project/models/movie_model.dart';
import 'package:flutter_project/widgets/synopsis.dart';

class MovieWinnerScreen extends StatelessWidget {
  final String movieId;

  const MovieWinnerScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 2, 2, 2),
              Color.fromARGB(255, 12, 12, 12),
              Color.fromARGB(255, 52, 52, 52),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder<Movie?>(
          future: _fetchWinnerMovie(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.data == null) {
              return const Center(child: Text('Error loading movie data'));
            } else {
              return _buildMovieDetails(snapshot.data!);
            }
          },
        ),
      ),
    );
  }

  Widget _buildMovieDetails(Movie movie) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    width: double.infinity,
                    height: 450,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 450,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color.fromARGB(255, 12, 12, 12),
                        ],
                        stops: [0.5, 1],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie.name,
                  style: AppTheme.myCardTitleWinner,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Popularity",
                            style: AppTheme.myCardSubTitleWinner1,
                          ),
                          Text(
                            "${movie.popularity}",
                            style: AppTheme.myCardSubTitleWinner2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Vote Average",
                            style: AppTheme.myCardSubTitleWinner1,
                          ),
                          Text(
                            "${movie.voteAverage}/10",
                            style: AppTheme.myCardSubTitleWinner2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Date",
                            style: AppTheme.myCardSubTitleWinner1,
                          ),
                          Text(
                            movie.firstAirDate,
                            style: AppTheme.myCardSubTitleWinner2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Synopsis(description: movie.overview),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              navigatorKey.currentState?.push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            child: const Text('Return to Home'),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Future<Movie?> _fetchWinnerMovie() async {
    String? moviesJson = await MovieDataStorage.getMoviesJson();
    if (moviesJson != null) {
      List<dynamic> moviesData = json.decode(moviesJson)['results'];
      return moviesData.map<Movie>((json) => Movie.fromJson(json)).firstWhere(
            (movie) => movie.id.toString() == movieId,
          );
    }
    return null;
  }
}
