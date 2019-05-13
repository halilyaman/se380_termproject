import 'package:flutter/material.dart';
import 'package:se380_termproject/top_movie_list.dart' as topMovies;
import 'movie_details.dart' as movieDetails;
import 'test.dart' as test;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => test.FirstRoute(),
        '/top_movie_list': (context) => topMovies.TopMovieList(),
        '/movie_details': (context) => movieDetails.MovieDetails()
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[900],
      ),
    );
  }
}



