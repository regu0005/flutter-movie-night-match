import 'package:flutter/material.dart';
import '../screens/movie_screen.dart';

class SessionScreen extends StatelessWidget {
  final Map<String, String> sessionData;

  const SessionScreen({Key? key, required this.sessionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Session Code: ${sessionData['sessionCode']}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text('Share the code with your friend'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MovieScreen()),
                );
              },
              child: const Text('Begin'),
            ),
          ],
        ),
      ),
    );
  }
}
