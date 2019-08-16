import 'package:flutter/material.dart';

class ImagePreview extends StatefulWidget {
  final List<String> src;

  ImagePreview({@required this.src});

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 380,
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: NetworkImage(widget.src[0]), fit: BoxFit.fill)),
        ),
        Positioned(
          height: 200,
            bottom: 0,
            child: ListView.builder(itemBuilder: (context, pos) {
              return Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.all(4),
                color: Colors.greenAccent,
              );
            }))
      ],
    );
  }
}
