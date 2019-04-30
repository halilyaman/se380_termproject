import 'package:flutter/material.dart';
import 'package:se380_termproject/movie_card.dart';
import 'top_movie_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TopMovies(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[900],
      ),
    );
  }
}



