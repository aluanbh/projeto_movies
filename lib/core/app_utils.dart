import 'package:dio/dio.dart';

import 'models/genres.dart';

class AppUtil{
  static Future<Options> getOptions() async{
   return Options(headers: {
     'content-type': 'application/json;charset=utf-8',
     'authorization':
     'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOTFlMjc1ZWI1NGE5M2I1MWVmYTgxZDRlYWRhODg4ZCIsInN1YiI6IjYxZGY0NWQwNDQxYjAzMDA5MGU2YzAxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LUc0ISdvkG7cchr0hwK9P9XLdSbyCaQiaVxty28mxss',
   });
  }

  static String getYearReleased(String releseadDate) {
      List data = releseadDate.split('-');
      return data[0];
  }

  static String getListGenres(List<Genres> list) {
    String genres = '';

    for(var item in list){
      genres = genres + item!.name!;
    }


    return genres;
  }
}