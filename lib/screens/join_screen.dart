import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/screens/movie_screen.dart';
import 'package:flutter_project/utils/global.dart';
import 'package:flutter_project/utils/session_helpers.dart';

class JoinScreen extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();

  JoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joining to Session'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please enter the Session Code to join the Movie Game',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(
                labelText: 'Session Code',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
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
                    _showExpiredCodeDialog(context);
                  }
                } else {
                  _showInputCodeDialog(context);
                }
              },
              child: const Text('Join a Session'),
            ),
          ],
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
          content:
              const Text('The code sent before are expired or unavailable'),
          actions: <Widget>[
            TextButton(
              child: const Text('Return'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
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
