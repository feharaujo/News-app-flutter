import 'package:flutter/material.dart';

/// Simple widget for articles than not contains a picture
class JustTextCell extends StatelessWidget {
  final String title;
  final String description;
  final String source;
  final String content;

  JustTextCell(
      {@required this.title,
      @required this.source,
      this.description,
      this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(_getSubtitle()),
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
          ),
        ],
      ),
    );
  }

  String _getSubtitle() {
    if (description != null) {
      return description;
    } else if (content != null) {
      return content;
    } else {
      return "Check out!";
    }
  }
}
