import 'package:flutter/material.dart';
import 'package:se380_termproject/assets.dart';

class MovieCard extends StatefulWidget {

  MovieCard({
    this.movieTitle,
    this.movieImageAddress,
    this.movieDetails,
    this.movieRating,
  });

  factory MovieCard.fromJSON(Map<dynamic, dynamic> parsedJson) {
    return MovieCard(
      movieTitle: parsedJson['title'],
      movieImageAddress: parsedJson['poster_path'],
      movieDetails: parsedJson['overview'],
      movieRating: parsedJson['vote_average'],
    );
  }

  final String movieTitle, movieImageAddress, movieDetails;
  final double movieRating;

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
                        '${widget.movieTitle}',
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
                            child: Image.network(widget.movieImageAddress),
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
                                  '${widget.movieDetails}',
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
                                '${widget.movieRating}', // TODO: add average score of movie
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