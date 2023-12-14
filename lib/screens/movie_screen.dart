import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/movie_winner.dart';
import 'package:flutter_project/utils/session_manager.dart';
import 'package:http/http.dart' as http;
import '../utils/http_movies.dart';
import '../theme/app_theme.dart';
import '../models/movie_model.dart';
import '../utils/movie_card_simple.dart';

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromARGB(255, 2, 2, 2),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Movie Choices',
                  style: AppTheme.mySessionTitle,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<Movie>>(
                  future: movies,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Movie>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          Movie movie = snapshot.data![index];

                          return Dismissible(
                            key: Key(movie.id.toString()),
                            onDismissed: (direction) {
                              bool vote =
                                  direction == DismissDirection.startToEnd;

                              sendVote(movie.id, vote);

                              setState(() {
                                snapshot.data!.removeAt(index);
                              });
                            },
                            background: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(),
                                const Positioned(
                                  left: 50,
                                  child:
                                      Icon(Icons.thumb_up, color: Colors.white),
                                ),
                              ],
                            ),
                            secondaryBackground: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                Container(),
                                const Positioned(
                                  right: 50,
                                  child: Icon(Icons.thumb_down,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                MovieCardSimple(movie: movie),
                                const SizedBox(height: 120),
                              ],
                            ),
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
            ],
          ),
        ),
      ),
    );
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
          content: const Text('Movie chosed by your friend'),
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
}
