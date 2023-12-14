import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/data/movie_data_storage.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/theme/app_theme.dart';
import 'package:flutter_project/utils/global.dart';
import 'package:flutter_project/models/movie_model.dart';
import 'package:flutter_project/utils/movie_card_complete.dart';

class MovieWinnerScreen extends StatelessWidget {
  final String movieId;

  const MovieWinnerScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Color.fromARGB(255, 2, 2, 2),
      ),
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 2, 2, 2),
              Color.fromARGB(255, 19, 19, 19),
              Color.fromARGB(255, 89, 89, 89),
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
              return Center(child: Text('Error loading movie data'));
            } else {
              return _buildMovieDetails(snapshot.data!);
            }
          },
        ),
      ),
    );
  }

  Widget _buildMovieDetails(Movie movie) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Movie winner',
            style: AppTheme.mySessionTitle,
          ),
          Text(
            movie.name,
            style: AppTheme.myTitleStyle,
          ),
          const SizedBox(height: 20),
          MovieCardComplete(movie: movie),
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
