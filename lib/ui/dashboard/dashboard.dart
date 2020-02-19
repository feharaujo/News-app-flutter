import 'package:flutter/material.dart';
import 'package:news_app/data/NewsRepository.dart';
import 'package:news_app/model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardContent extends StatefulWidget {
  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final repository = NewsRepository();
  var newsList = List<Article>();

  @override
  void initState() {
    super.initState();

    _fetchNews();
  }

  void _fetchNews() async {
    repository.fetchNews().then((resp) {
      setState(() {
        newsList.addAll(resp.articles);
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News app"),
        ),
        body: newsList.length == 0 ? _getProgressBar() : _getListViewWidget());
  }

  Widget _getListViewWidget() {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            _onItemTap(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                newsList[index].urlToImage != null
                    ? Image(
                        image: NetworkImage(newsList[index].urlToImage),
                      )
                    : Container(),
                Text("${newsList[index].title}", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        );
      },
    );
  }

  _onItemTap(int index) async {
    final url = newsList[index].url;
    if (await canLaunch(url)) {
      launch(url);
    }
  }

  Widget _getProgressBar() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
