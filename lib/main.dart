import 'package:flutter/material.dart';
import 'package:se380_termproject/movie_card.dart';
import 'package:se380_termproject/top_movie_list.dart' as list;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
        ),
        body: Center(
          child: list.TopMovieList(),
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[900],
      ),
    );
  }
}



