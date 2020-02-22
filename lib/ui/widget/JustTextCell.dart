import 'package:flutter/material.dart';

/// Simple widget for articles than not contains a picture
class JustTextCell extends StatelessWidget {
  final String title;
  final String description;
  final String source;

  JustTextCell({
    @required this.title,
    @required this.description,
    @required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Text(description),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            source,
            style: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
