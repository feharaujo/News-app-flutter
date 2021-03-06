import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageTextCell extends StatelessWidget {
  final String image;
  final String title;
  final String source;

  ImageTextCell(
      {@required this.image, @required this.title, @required this.source});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
              FadeInImage.memoryNetwork(
                fadeInDuration: Duration(milliseconds: 150),
                placeholder: kTransparentImage,
                image: image,
                width: screenWidth,
                height: screenWidth * 0.6, // 3:4 img
                fit: BoxFit.cover,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                source,
                style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal),
              ),
            ),
          )
        ],
      ),
    );
  }
}
