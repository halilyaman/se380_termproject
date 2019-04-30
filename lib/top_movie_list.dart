import 'package:flutter/material.dart';
import 'movie_card.dart';
import 'dart:convert';
import 'assets.dart';
import 'package:http/http.dart' as http;

class TopMovies extends StatefulWidget {

  @override
  _TopMoviesState createState() {
    return _TopMoviesState();
  }
}

class _TopMoviesState extends State<TopMovies> {

  String url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${ApiAssets.apiKey}';
  var isLoading = true;
  Map<dynamic, dynamic> map = Map();
  List<Widget> _movieCardList = List();

  _fetchData() async {

    final response = await http.get(url);
    if(response.statusCode == 200) {
      setState(() {
        isLoading = false;
        map = json.decode(response.body) as Map;
      });
      print(map);
    } else {
      throw Exception('Failed to fetch data');
    }
  }


  @override
  void initState() {
    _fetchData();
  }

  @override
  void didUpdateWidget(TopMovies oldWidget) {
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {

    for(int i = 0; i < 10; i++) {
      _movieCardList.add(MovieCard(
        movieDetails: map['results'][i]['overview'],
        movieTitle: map['results'][i]['title'],
        movieImageAddress: map['results'][i]['poster_path'],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Top Movies'),
        ),
      ),
      body: isLoading
        ?
          Center(
            child: CircularProgressIndicator(),
          )
        :
          SingleChildScrollView(
            child: Column(
              children: _movieCardList
            ),
          ),
    );
  }
}