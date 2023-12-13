import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _sessionCodeKey = 'session_code';
  static const String _sessionIdKey = 'session_id';
  static const String _sessionTimestampKey = 'session_timestamp';
  static const int _sessionDuration = 5;

  // Save the session and the timestamp to local storage for future uses
  static Future<void> saveSession(String sessionCode, String sessionId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final timestamp = DateTime.now().toIso8601String();
    await prefs.setString(_sessionCodeKey, sessionCode);
    await prefs.setString(_sessionIdKey, sessionId);
    await prefs.setString(_sessionTimestampKey, timestamp);
  }

  // Get the session code, session id, and timestamp
  static Future<Map<String, String>?> getActiveSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final sessionCode = prefs.getString(_sessionCodeKey);
    final sessionId = prefs.getString(_sessionIdKey);
    final timestampString = prefs.getString(_sessionTimestampKey);

    if (sessionCode != null && sessionId != null && timestampString != null) {
      final timestamp = DateTime.parse(timestampString);
      if (DateTime.now().difference(timestamp).inMinutes < _sessionDuration) {
        return {'sessionCode': sessionCode, 'sessionId': sessionId};
      } else {
        await inactivateSessionCode();
      }
    }
    return null;
  }

  // Check if an existing session is active and not expired
  static Future<String?> getActiveSessionCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final sessionCode = prefs.getString(_sessionCodeKey);
    final timestampString = prefs.getString(_sessionTimestampKey);

    if (sessionCode != null && timestampString != null) {
      final timestamp = DateTime.parse(timestampString);
      if (DateTime.now().difference(timestamp).inMinutes < _sessionDuration) {
        return sessionCode;
      } else {
        await inactivateSessionCode();
      }
    }
    return null;
  }

  // Get the session ID
  static Future<String?> getActiveSessionId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sessionIdKey);
  }

  // Remove the session code and timestamp that is expired
  static Future<void> inactivateSessionCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionCodeKey);
    await prefs.remove(_sessionIdKey);
    await prefs.remove(_sessionTimestampKey);

    // TODO save the code and timestamp to make the History Screen
  }
}
