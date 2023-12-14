import 'package:flutter/material.dart';
import 'package:flutter_project/theme/app_theme.dart';
import '../screens/movie_screen.dart';

class SessionScreen extends StatelessWidget {
  final Map<String, String> sessionData;

  const SessionScreen({Key? key, required this.sessionData}) : super(key: key);

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Session Code',
                  style: AppTheme.mySessionTitle,
                ),
                const SizedBox(height: 20),
                Text(
                  '${sessionData['sessionCode']}',
                  style: AppTheme.mySessionTitle,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Share the code with your friend to begin \nthe Movie Match session.',
                  style: AppTheme.mySubtitleStyle,
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MovieScreen()),
                    );
                  },
                  child: const Text('Begin the Match Game'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
