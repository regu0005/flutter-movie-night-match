import 'package:flutter/foundation.dart';
import 'package:flutter_project/models/movie_model.dart';

class MovieModel with ChangeNotifier {
  Movie? _selectedMovie;

  Movie? get selectedMovie => _selectedMovie;

  void selectMovie(Movie movie) {
    _selectedMovie = movie;
    notifyListeners();
  }
}
