import 'package:flutter/material.dart';
import 'package:se380_termproject/assets.dart';

class MovieCard extends StatefulWidget {

  final String _title, _posterPath, _voteAverage, _overview;

  MovieCard({String title, String posterPath, String voteAverage, String overview})
    : this._title = title,
      this._posterPath = posterPath,
      this._voteAverage = voteAverage,
      this._overview = overview;

  _MovieCardState createState() {
    return _MovieCardState();
  }
}

class _MovieCardState extends State<MovieCard>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.indigo[900],
        borderOnForeground: true,
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(height: 500),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black54,
                    child: Center(
                      child: Text(
                        widget._title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.white12,
                            child: Image.network('https://picsum.photos/250?image=9'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: GestureDetector(
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.black26,
                              child: Center(
                                child: Text(
                                  widget._overview,
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: null, // TODO: navigate details page
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            color: Colors.indigo[400],
                            child: Center(
                              child: Text("Stars"), // TODO: add ten evaluation stars
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            color: Colors.brown[100],
                            child: Center(
                              child: Text(
                                widget._voteAverage, // TODO: add average score of movie
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}