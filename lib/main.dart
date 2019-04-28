import 'package:flutter/material.dart';
import 'package:se380_termproject/assets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Bar'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  Widget buildMovieCard() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 500),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                      )
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: ConstrainedBox(
                                constraints: BoxConstraints.expand(),
                                child: Container(
                                  color: Colors.deepOrange,
                                  child: Center(
                                    child: Text("Movie Name"),
                                  )
                                ),
                              ),
                            ),
                            Expanded(
                              child: ConstrainedBox(
                                constraints: BoxConstraints.expand(),
                                child: Container(
                                  color: Colors.yellowAccent,
                                  child: Center(
                                    child: Text("Movie Info"),
                                  )
                                ),
                              ),
                            )
                          ],
                        ),
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
                          color: Colors.cyanAccent,
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
                          color: Colors.purpleAccent,
                          child: Center(
                            child: Text("9.2/10"), // TODO: add average score of movie
                          )
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> movieCardList = List();

  @override
  Widget build(BuildContext context) {

    for(int i = 0; i < 3; i++)  {
      movieCardList.add(buildMovieCard());
    }


    return SingleChildScrollView(
      child: Column(
        children: movieCardList
      ),
    );

  }
}