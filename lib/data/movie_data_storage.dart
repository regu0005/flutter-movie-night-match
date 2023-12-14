import 'package:shared_preferences/shared_preferences.dart';

class MovieDataStorage {
  static const String _moviesKey = 'movies';

  // Save the Json of the movies got in the local storage
  static Future<void> saveMoviesJson(String moviesJson) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(moviesJson);
    await prefs.setString(_moviesKey, moviesJson);
  }

  // Get the Json of the movies from the local storage
  static Future<String?> getMoviesJson() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_moviesKey);
  }

  // Delete the Json of the movies from the local storage
  static Future<void> removeMoviesJson() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_moviesKey);
  }
}
