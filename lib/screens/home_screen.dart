import 'package:flutter/material.dart';
import 'package:flutter_project/screens/join_screen.dart';
import '../utils/session_helpers.dart';
import '../utils/global.dart';
import 'session_screen.dart';
import 'package:flutter_project/data/movie_data_storage.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key) {
    _removeMoviesData();
  }

  static Future<void> _removeMoviesData() async {
    await MovieDataStorage.removeMoviesJson();
  }

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
              Color.fromARGB(255, 19, 19, 19),
              Color.fromARGB(255, 89, 89, 89),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 70),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'WELCOME TO',
                        style: AppTheme.myHeroTextStyle1,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'MOVIE NIGHT',
                        style: AppTheme.myHeroTextStyle2,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Match Game',
                        style: AppTheme.myHeroTextStyle3,
                      ),
                    ),
                    const SizedBox(height: 80),
                    const Text(
                      'To start the Movies Match Game, you can either create a new session or join an existing one to play',
                      style: AppTheme.myDescriptionStyle,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () async {
                        Map<String, String>? sessionData =
                            await startSessionAndNavigate();

                        if (sessionData != null &&
                            sessionData['sessionCode']!.isNotEmpty) {
                          navigatorKey.currentState?.push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  SessionScreen(sessionData: sessionData),
                            ),
                          );
                        }
                      },
                      child: const Text('Start a Session'),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => JoinScreen(),
                          ),
                        );
                      },
                      child: const Text('Join a Session'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
