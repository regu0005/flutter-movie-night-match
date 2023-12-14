import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';
import 'utils/device_storage.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'utils/global.dart';

void main() async {
  // Saving the device ID to local storage
  WidgetsFlutterBinding.ensureInitialized();
  await checkAndSaveDeviceId();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Navigation App',
      theme: AppTheme.lightTheme,
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

Future<void> checkAndSaveDeviceId() async {
  String? storedDeviceId = await DeviceStorage.getDeviceId();
  if (storedDeviceId == null) {
    try {
      String? deviceId = await PlatformDeviceId.getDeviceId;
      if (deviceId != null) {
        await DeviceStorage.saveDeviceId(deviceId);
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error getting the device id: $e');
    }
  } else {
    // ignore: avoid_print
    print('Device ID already saved: $storedDeviceId');
  }
}
