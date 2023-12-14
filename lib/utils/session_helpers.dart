import 'package:flutter_project/utils/device_storage.dart';
import 'package:flutter_project/utils/session_api.dart';
import 'package:flutter_project/utils/session_manager.dart';

Future<Map<String, String>?> startSessionAndNavigate() async {
  try {
    String? deviceId = await DeviceStorage.getDeviceId();
    // ignore: avoid_init_to_null
    var activeSession = null;

    // if (activeSession == null) {
    var sessionResponse = await SessionApi.startSession(deviceId!);

    if (sessionResponse != null) {
      await SessionManager.saveSession(
          sessionResponse.code, sessionResponse.sessionId);
      activeSession = {
        'sessionCode': sessionResponse.code,
        'sessionId': sessionResponse.sessionId
      };
    }
    // }

    return activeSession;
  } catch (e) {
    // ignore: avoid_print
    print('Error: $e');
    return null;
  }
}

Future<Map<String, String>?> joinSessionAndNavigate(String code) async {
  try {
    String? deviceId = await DeviceStorage.getDeviceId();
    // ignore: avoid_init_to_null
    var activeSession = null;

    // if (activeSession == null) {
    var sessionResponse = await SessionApi.joinSession(deviceId!, code);

    if (sessionResponse != null) {
      await SessionManager.saveSession(code, sessionResponse.sessionId);
      activeSession = {
        'sessionCode': code,
        'sessionId': sessionResponse.sessionId
      };
    }

    return activeSession;
    // }
  } catch (e) {
    // ignore: avoid_print
    print('Error: $e');
    return null;
  }
  return null;
}
