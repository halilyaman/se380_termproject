import 'package:flutter/material.dart';
import 'package:se380_termproject/movie_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Patrona Movie İsyanı'),
          ),
        ),
        body: HomePage(),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[900],
        accentColor: Colors.indigo[900],
        fontFamily: 'Montserrat',

      ),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<Widget> _movieCardList = List();

    for(int i = 0; i < 3; i++)  {
      _movieCardList.add(MovieCard.buildMovieCard());
    }

    return SingleChildScrollView(
      child: Column(
        children: _movieCardList
      ),
    );

  }
}