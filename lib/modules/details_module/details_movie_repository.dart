import 'dart:convert';

import 'package:projeto_movies/core/app_utils.dart';
import 'package:projeto_movies/core/config.dart';
import 'package:projeto_movies/core/models/movie.dart';
import 'package:dio/dio.dart';

class DetailsMovieRepository {
  DetailsMovieRepository();

  Future getMovie(String movieId) async {
    var dio = Dio();
    String url = '${Config.apiUrl}/movie/$movieId';

    final response = await dio.get(url,
        queryParameters: {'api_key': '${Config.apiKey}'},
        options: await AppUtil.getOptions());

    print(response.data);

    return response.data;
  }

  Future<List<Movie>?> getMoviesList(String movieId) async {
    var dio = Dio();
    String url = '${Config.apiUrl}/movie/$movieId/similar';

    final response = await dio.get(url,
        queryParameters: {'api_key': '${Config.apiKey}'},
        options: await AppUtil.getOptions());

    print(response.data['results']);

    var decode = response.data['results'] as List;

    return decode.map((jsonMovie) => Movie.fromJson(jsonMovie)).toList();
  }
}
