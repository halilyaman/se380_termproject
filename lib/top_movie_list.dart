import 'dart:io';

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
  Map<String, dynamic> _fetchedData = Map();
  Movie _movieData;
  List<Movie> _movieDataList = List();
  bool _isLoading = false;
  bool _isMovieCardWillShow = false;

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _isMovieCardWillShow = true;
      _movieDataList.clear();
    });

    for(int i = 1 ; i < 2; i++) {
      var response = await http.get(ApiAssets.apiUrl+ApiAssets.topRatedMoviesUrl+'api_key='+ApiAssets.apiKey+'&page=$i');

      if(response.statusCode == 200) {

        _fetchedData = json.decode(response.body);
        for(int i = 0 ; i < 20; i++) {
          _movieData = Movie.fromJson(_fetchedData, i);
          _movieDataList.add(_movieData);
        }
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Movies "Top 200"'),
          )
        ),
        body: _isLoading ?
          Center(
            child: CircularProgressIndicator(),
          )
          : _isMovieCardWillShow ?
          Center(
            child: Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Back'),
                    onPressed: (){
                      setState(() {
                        _isMovieCardWillShow = false;
                      });
                    },
                  ),
                  Expanded(
                    child: ListView(
                      children: _movieDataList.map((movie) => MovieCard(
                        title: movie._title,
                        posterPath: movie._posterPath,
                        voteAverage: movie._voteAverage,
                        overview: movie._overview,
                      )).toList(),
                    ),
                  ),
                ],
              ),
            ),
          )
          : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('fetch data'),
                  onPressed: _fetchData,
                )
              ],
            ),
          )
    );
  }
}

class Movie {
  final String _title, _posterPath, _voteAverage, _overview;
  final int _ID;
  Movie({String title, String posterPath, String voteAverage, String overview, int id})
    : this._title = title,
      this._posterPath = posterPath,
      this._voteAverage = voteAverage,
      this._overview = overview,
      this._ID= id;

  factory Movie.fromJson(Map<String, dynamic> fetchedData, int index) {
    return Movie(
      title: fetchedData['results'][index]['title'],
      posterPath: fetchedData['results'][index]['poster_path'],
      voteAverage: fetchedData['results'][index]['vote_average'].toString(),
      overview: fetchedData['results'][index]['overview'],
      id: fetchedData['results'][index]['id'],
    );
  }

  @override
  String toString() {
    return 'Title: ' + this._title
      + '\nPoster Path: ' + this._posterPath
      + '\nAverage Vote: ' + this._voteAverage
      + '\nOverview: ' + this._overview
      + '\nID: ' + this._ID.toString();
  }
}