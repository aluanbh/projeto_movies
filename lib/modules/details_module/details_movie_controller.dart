import 'package:projeto_movies/core/models/movie.dart';
import 'package:flutter/cupertino.dart';

import 'details_movie_repository.dart';

class DetailsMovieController extends ChangeNotifier {
  DetailsMovieRepository _detailsMovieRepository = DetailsMovieRepository();

  List<Movie> listaDeMovies = [];
  Movie? movie;

  void getMovieDetails(String id) async {
    var data = await _detailsMovieRepository!.getMovie(id)!;
    movie = Movie.fromJson(data);
    print('homepage');
    print(movie!.posterPath);
    notifyListeners();
  }

  void getMovieDetailsList(String id) async {
    listaDeMovies = (await _detailsMovieRepository.getMoviesList(id)!)!;
    print('lista de filmes');
    print(listaDeMovies.first.homepage);
    notifyListeners();
  }
}
