import 'package:flutter_project/utils/device_storage.dart';
import 'package:flutter_project/utils/session_api.dart';
import 'package:flutter_project/utils/session_manager.dart';

Future<Map<String, String>?> startSessionAndNavigate() async {
  try {
    String? deviceId = await DeviceStorage.getDeviceId();
    var activeSession = null; //await SessionManager.getActiveSession();
    print('Active Session: $activeSession');

    if (activeSession == null) {
      print('No active session found. Starting a new session...');
      print('Device ID: $deviceId');
      var sessionResponse = await SessionApi.startSession(deviceId!);

      print('Session Response: $sessionResponse');

      if (sessionResponse != null) {
        await SessionManager.saveSession(
            sessionResponse.code, sessionResponse.sessionId);
        activeSession = {
          'sessionCode': sessionResponse.code,
          'sessionId': sessionResponse.sessionId
        };
      }
    }

    return activeSession;
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

Future<Map<String, String>?> joinSessionAndNavigate(String code) async {
  try {
    // String? sessionCode = "";
    String? deviceId = await DeviceStorage.getDeviceId();
    var activeSession = null; //await SessionManager.getActiveSession();
    print('Active Session: $activeSession');

    if (activeSession == null) {
      var sessionResponse = await SessionApi.joinSession(deviceId!, code);

      print('Join to Session Response: $sessionResponse');

      if (sessionResponse != null) {
        await SessionManager.saveSession(code, sessionResponse.sessionId);
        activeSession = {
          'sessionCode': code,
          'sessionId': sessionResponse.sessionId
        };
      }

      return activeSession;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
  return null;
}
