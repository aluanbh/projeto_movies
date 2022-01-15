import 'package:projeto_movies/core/config.dart';
import 'package:projeto_movies/core/models/movie.dart';
import 'package:projeto_movies/modules/details_module/details_movie_controller.dart';
import 'package:projeto_movies/modules/details_module/widgets/movie_list_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class DetailsMovie extends StatefulWidget {
  DetailsMovie();

  @override
  DetailsMovieState createState() => DetailsMovieState();
}

class DetailsMovieState extends State<DetailsMovie> {
  DetailsMovieController _detailsMovieController = new DetailsMovieController();

  Movie? movie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DetailsMovieController>(context, listen: false)
        .getMovieDetails('13');
    Provider.of<DetailsMovieController>(context, listen: false)
        .getMovieDetailsList('13');
  }

  bool _isFavorite = false;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Movie? movie = Provider.of<DetailsMovieController>(context).movie;
    return movie != null
        ? Scaffold(
            backgroundColor: Colors.grey,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                  expandedHeight: 400,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      '${Config.baseUrlImg}${movie!.posterPath!}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              movie!.title!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: (_isFavorite
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_border)),
                              color: Colors.red[500],
                              onPressed: _toggleFavorite,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.black,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${movie!.voteCount.toString()!} curtidas ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle_rounded,
                                  color: Colors.black,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${movie!.popularity.toString()!} popularidade ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      MovieListWidget(
                        movieList: Provider.of<DetailsMovieController>(context)
                            .listaDeMovies,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(child: CircularProgressIndicator())),
          );
  }
}
