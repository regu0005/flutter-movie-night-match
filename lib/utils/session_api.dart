// session_api.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class SessionApi {
  static const String baseUrl = 'https://movie-night-api.onrender.com';

  // start a new session
  static Future<SessionResponse?> startSession(String deviceId) async {
    try {
      final url = Uri.parse('$baseUrl/start-session?device_id=$deviceId');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return SessionResponse.fromJson(responseData['data']);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print('Error in startSession: $e');
      return null;
    }
  }

  static Future<JoinSessionResponse?> joinSession(
      String deviceId, String code) async {
    try {
      final url =
          Uri.parse('$baseUrl/join-session?device_id=$deviceId&code=$code');
      print("Joinning to session: $url");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return JoinSessionResponse.fromJson(responseData['data']);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print('Error in startSession: $e');
      return null;
    }
  }
}

class SessionResponse {
  final String code;
  final String sessionId;

  SessionResponse({required this.code, required this.sessionId});

  factory SessionResponse.fromJson(Map<String, dynamic> json) {
    return SessionResponse(
      code: json['code'],
      sessionId: json['session_id'],
    );
  }
}

class JoinSessionResponse {
  final String sessionId;
  final String message;

  JoinSessionResponse({required this.message, required this.sessionId});

  factory JoinSessionResponse.fromJson(Map<String, dynamic> json) {
    return JoinSessionResponse(
      message: json['message'],
      sessionId: json['session_id'],
    );
  }
}
