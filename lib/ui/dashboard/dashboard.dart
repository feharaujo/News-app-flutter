import 'package:flutter/material.dart';
import 'package:news_app/data/NewsRepository.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/ui/widget/ImageTextCell.dart';
import 'package:news_app/ui/widget/JustTextCell.dart';
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
            child: _createCell(newsList[index]));
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

  Widget _createCell(Article article) {
    if (article.urlToImage != null && article.urlToImage.isNotEmpty) {
      // Cell with image
      return ImageTextCell(
        image: Image(
          image: NetworkImage(article.urlToImage),
        ),
        title: article.title,
        source: article.source.name,
      );
    } else {
      // Cell with text and description
      return JustTextCell(
        title: article.title,
        description:
            article.description != null ? article.description : article.content,
        source: article.source.name,
      );
    }
  }
}
