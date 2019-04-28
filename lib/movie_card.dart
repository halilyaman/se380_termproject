import 'package:flutter/material.dart';
import 'package:se380_termproject/assets.dart';

class MovieCard {
  static Widget buildMovieCard() {
    return Center(
      child: Card(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(height: 500),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Container(
                      color: Colors.black54,
                      child: Center(
                        child: Text(
                          'Movie Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontStyle: FontStyle.italic
                          ),
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
                            color: Colors.black,
                            child: Image.asset(ImageAssets.myImage),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: GestureDetector(
                          child: Center(
                            child: Container(
                              color: Colors.black45,
                              child: Center(
                                child: Text(
                                  'Movie Info',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: ()=>print('tapped!'), // TODO: navigate details page
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
                                '9.2/10', // TODO: add average score of movie
                                style: TextStyle(
                                  color: Colors.black,
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