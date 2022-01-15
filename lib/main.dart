import 'package:projeto_movies/modules/details_module/details_movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/details_module/details_movie_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: ChangeNotifierProvider(
        create: (context) => DetailsMovieController(),
        child: DetailsMovie(),
      ),
    );
  }
}
