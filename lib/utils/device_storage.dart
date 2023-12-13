import 'package:shared_preferences/shared_preferences.dart';

class DeviceStorage {
  static const String _deviceIdKey = 'testing_device_id';

  // Save the device ID to local storage
  static Future<void> saveDeviceId(String deviceId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_deviceIdKey, deviceId);
    print("Device ID saved: $deviceId");
  }

  // get the device ID from local storage
  static Future<String?> getDeviceId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Getting Device ID: ${prefs.getString(_deviceIdKey)}");
    return prefs.getString(_deviceIdKey);
  }
}
