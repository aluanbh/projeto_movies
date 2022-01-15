import 'package:projeto_movies/core/app_utils.dart';
import 'package:projeto_movies/core/config.dart';
import 'package:projeto_movies/core/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListWidget extends StatelessWidget {
  final List<Movie> movieList;
  MovieListWidget({required this.movieList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) => Card(
        color: Colors.grey,
        child: ListTile(
          leading: Image.network(
              '${Config.baseUrlImg}${movieList[index]!.posterPath!}'),
          title: Text(movieList[index].title!,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          subtitle: Text(
            AppUtil.getYearReleased(movieList[index].releaseDate!),
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
