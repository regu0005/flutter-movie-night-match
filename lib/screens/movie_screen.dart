import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/movie_winner.dart';
import '../utils/http_movies.dart';
import '../theme/app_theme.dart';
import '../models/movie_model.dart';
import '../utils/movie_card.dart';
import 'package:flutter_project/utils/session_manager.dart';
import 'package:http/http.dart' as http;

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late Future<List<Movie>> movies;

  void getMovies() {
    try {
      movies = HttpHelper.fetch(
          'https://api.themoviedb.org/3/discover/tv?sort_by=popularity.desc&api_key=8b4d7c866d85932f1939c1f1c0f9b149');
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  Future<void> sendVote(int movieId, bool vote) async {
    String? sessionId = await SessionManager.getActiveSessionId();
    final url = Uri.parse(
        'https://movie-night-api.onrender.com/vote-movie?session_id=$sessionId&movie_id=$movieId&vote=$vote');
    print('URL: $url');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('Vote sent successfully for the movie: $movieId');
        print('Response: ${response.body}');

        final responseData = json.decode(response.body);
        if (responseData['data']['match'] == true) {
          // ignore: use_build_context_synchronously
          _showMatchDialog(context, responseData['data']['movie_id']);
        }
      } else {
        print('Error:: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  void _showMatchDialog(BuildContext context, String movieId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Movie Match!'),
          content: const Text('Movie chosed by your friend!'),
          actions: <Widget>[
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieWinnerScreen(movieId: movieId)),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Data', style: AppTheme.myTitleStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder<List<Movie>>(
          future: movies,
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  Movie movie = snapshot.data![index];

                  return Dismissible(
                    key: Key(movie.id.toString()),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        print(
                            "${movie.name} Swipe Right to Left - Action False");
                      } else if (direction == DismissDirection.startToEnd) {
                        print(
                            "${movie.name} Swipe Left to Right - Action True");
                      }

                      bool vote = direction == DismissDirection.startToEnd;
                      print('Sending vote: $vote, for movie: ${movie.id}');
                      sendVote(movie.id, vote);

                      setState(() {
                        snapshot.data!.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${movie.name} removed")),
                      );
                    },
                    background: Container(
                        color: Colors.green, child: const Icon(Icons.thumb_up)),
                    secondaryBackground: Container(
                        color: Colors.red, child: const Icon(Icons.thumb_down)),
                    child: MovieCard(movie: movie),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(child: FlutterLogo(size: 20));
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppTheme.myBackgroundColor1,
              ));
            }
          },
        ),
      ),
    );
  }
}
