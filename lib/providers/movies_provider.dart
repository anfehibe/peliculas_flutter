import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'cecd9d4d1ccc958c534c39121d73d22d';
  final String _language = 'es-ES';
  MoviesProvider() {
    print('Movies provider inicializado');
    getOnDIsplayMovies();
  }

  getOnDIsplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    if (response.statusCode != 200) return print('error');
    final Map<String, dynamic> decodeData = json.decode(response.body);
    print(decodeData);
  }
}
