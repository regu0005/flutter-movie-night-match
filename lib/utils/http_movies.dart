import 'package:flutter_project/data/movie_data_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/movie_model.dart';

class HttpHelper {
  static Future<List<Movie>> fetch(String url) async {
    Uri uri = Uri.parse(url);
    http.Response resp = await http.get(uri);
    if (resp.statusCode == 200) {
      // Store the Json of the movies in Local Storage
      MovieDataStorage.saveMoviesJson(resp.body);

      Map<String, dynamic> data = json.decode(resp.body);
      List<Movie> movies = (data['results'] as List).map((movieJson) {
        return Movie.fromJson(movieJson);
      }).toList();

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
