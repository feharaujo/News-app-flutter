import 'package:flutter/material.dart';

class ImageTextCell extends StatelessWidget {
  final Image image;
  final String title;
  final String source;

  ImageTextCell(
      {@required this.image, @required this.title, @required this.source});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        children: <Widget>[
          image,
          Text(
            title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              source,
              style: TextStyle(
                  fontSize: 14.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal),
            ),
          )
        ],
      ),
    );
  }
}
