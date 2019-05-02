import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:se380_termproject/assets.dart';
import 'dart:convert';

import 'package:se380_termproject/movie_card.dart';

class TopMovieList extends StatefulWidget{

  @override
  _TopMovieListState createState() => _TopMovieListState();
}

class _TopMovieListState extends State<TopMovieList> {
  Movie _movieData;

  bool _isLoading = false;
  bool _isMovieCardWillShow = false;

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _isMovieCardWillShow = true;
    });

    var response = await http.get(ApiAssets.apiUrl+ApiAssets.topRatedMoviesUrl+'api_key='+ApiAssets.apiKey);

    if(response.statusCode == 200) {
      _movieData = Movie.fromJson(json.decode(response.body), 0);
      print(_movieData);
      setState(() {
        _isLoading = false;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
      ? CircularProgressIndicator()
      : _isMovieCardWillShow ?
      MovieCard(
        title: _movieData._title,
        posterPath: _movieData._posterPath,
        voteAverage: _movieData._voteAverage,
        overview: _movieData._overview,
      )
      :
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('fetch data'),
            onPressed: _fetchData,
          ),
          RaisedButton(
            child: Text('print text'),
            onPressed: ()=>print(_fetchData()),
          )
        ],
      );

  }
}

class Movie {
  final String _title, _posterPath, _voteAverage, _overview;
  Movie({String title, String posterPath, String voteAverage, String overview})
    : this._title = title,
      this._posterPath = posterPath,
      this._voteAverage = voteAverage,
      this._overview = overview;

  factory Movie.fromJson(Map<String, dynamic> fetchedData, int index) {
    return Movie(
      title: fetchedData['results'][index]['title'],
      posterPath: fetchedData['results'][index]['poster_path'],
      voteAverage: fetchedData['results'][index]['vote_average'].toString(),
      overview: fetchedData['results'][index]['overview'],
    );
  }

  @override
  String toString() {
    return 'Title: ' + this._title
      + '\nPoster Path: ' + this._posterPath
      + '\nAverage Vote: ' + this._voteAverage
      + '\nOverview: ' + this._overview;
  }
}