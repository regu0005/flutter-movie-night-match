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
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          HomeScreen(),
          // HistoryScreen(),
          // AboutScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics),
            label: 'Games History',
          ),
          NavigationDestination(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
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
      print('Error getting the device id: $e');
    }
  } else {
    print('Device ID already saved: $storedDeviceId');
  }
}
