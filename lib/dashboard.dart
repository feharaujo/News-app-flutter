import 'package:flutter/material.dart';
import 'package:news_app/data/NewsRepository.dart';
import 'package:news_app/model/article.dart';

class HomeContent extends StatefulWidget {

  @override
  _HomeContentState createState() => _HomeContentState();

}

class _HomeContentState extends State<HomeContent> {

  final repository = NewsRepository();
  var newsList = List<Article>();

  @override
  void initState() {
    super.initState();

    _fetchNews();
  }

  void _fetchNews() async {

  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("News app"),
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


/*class HomeContent extends StatelessWidget {
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
}*/
