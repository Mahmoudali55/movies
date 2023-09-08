import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  List<dynamic> _actionMovies = [];
  List<dynamic> get actionMovies => _actionMovies;

  List<dynamic> _dramaMovies = [];
  List<dynamic> get dramaMovies => _dramaMovies;

  List<dynamic> _comedyMovies = [];
  List<dynamic> get comedyMovies => _comedyMovies;

  List<dynamic> _adventureMovies = [];
  List<dynamic> get adventureMovies => _adventureMovies;

  List<dynamic> _animationMovies = [];
  List<dynamic> get animationMovies => _animationMovies;

  Future<void> fetchMovies() async {
    final response = await http
        .get(Uri.parse('https://salardev.com/devs/moviesProject/movies.json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _actionMovies = data['action'];
      _dramaMovies = data['drama'];
      _comedyMovies = data['comedy'];
      _adventureMovies = data['Adventure'];
      _animationMovies = data['Animation'];
      notifyListeners();
    } else {
      throw Exception('Failed to fetch Movies');
    }
  }
}
