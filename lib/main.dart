import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeContent(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeContent extends StatelessWidget {
  final String title;

  const HomeContent({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Sign in"),
                onPressed: () {
                  print("On press sign in button");
                },
              ),
              RaisedButton(
                color: Colors.grey,
                textColor: Colors.white,
                child: Text("Sign up"),
                onPressed: () {
                  print("On press sign up button");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
