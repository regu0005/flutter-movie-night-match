import 'package:flutter/material.dart';
import 'package:flutter_project/screens/join_screen.dart';
import '../theme/app_theme.dart';
import '../utils/session_helpers.dart';
import '../utils/global.dart';
import 'session_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Night', style: AppTheme.myTitleStyle),
      ),
      body: Column(
        children: <Widget>[
          firstPart(context),
          secondPart(context),
          thirdPart(context),
        ],
      ),
    );
  }

  Widget firstPart(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: AppTheme.myBackgroundColor1,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'To start the Movies Match Game, you can either create a new session or join an existing one to play',
                  style: AppTheme.myHeroTextStyle1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget secondPart(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: AppTheme.myBackgroundColor1,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'To start a new game session, click on the button below',
                  style: AppTheme.myHeroTextStyle1,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget thirdPart(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: AppTheme.myBackgroundColor1,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Join to an existing game session by entering the session code',
                  style: AppTheme.myHeroTextStyle1,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
    );
  }
}
