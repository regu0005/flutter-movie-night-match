import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/screens/movie_screen.dart';
import 'package:flutter_project/theme/app_theme.dart';
import 'package:flutter_project/utils/global.dart';
import 'package:flutter_project/utils/session_helpers.dart';

class JoinScreen extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();

  JoinScreen({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Join to Session',
                style: AppTheme.mySessionTitle,
              ),
              const SizedBox(height: 40),
              const Text(
                'Please enter the Session Code to join the Movie Match Game',
                style: AppTheme.mySubtitleStyle,
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _codeController,
                decoration: const InputDecoration(
                  labelText: 'Session Code',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () async {
                  String enteredCode = _codeController.text;
                  if (enteredCode.isNotEmpty) {
                    Map<String, String>? sessionData =
                        await joinSessionAndNavigate(enteredCode);

                    if (sessionData != null &&
                        sessionData['sessionCode']!.isNotEmpty) {
                      navigatorKey.currentState?.push(
                        MaterialPageRoute(
                          builder: (context) => const MovieScreen(),
                        ),
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      _showExpiredCodeDialog(context);
                    }
                  } else {
                    _showInputCodeDialog(context);
                  }
                },
                child: const Text('Join the Match Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showExpiredCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Expired or unavailable code'),
          content: const Text('The code sent is expired or unavailable'),
          actions: <Widget>[
            TextButton(
              child: const Text('Return'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showInputCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Code is empty'),
          content: const Text('Please enter the code to join the session'),
          actions: <Widget>[
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
