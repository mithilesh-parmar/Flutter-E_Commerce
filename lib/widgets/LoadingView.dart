import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingView extends StatelessWidget {
  final double size;

  final Color baseColor, highlightColor;

  LoadingView({this.size = 30, this.baseColor, this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 2),
        children: <Widget>[
          Shimmer.fromColors(
              baseColor: Theme.of(context).primaryColor,
              highlightColor: Theme.of(context).accentColor,
              child: Container(
                height: 200,
                color: Colors.blueAccent,
              )),
          Shimmer.fromColors(
              baseColor: Theme.of(context).primaryColor,
              highlightColor: Theme.of(context).accentColor,
              child: Container(
                height: 200,
                color: Colors.blueAccent,
              )),
          Shimmer.fromColors(
              baseColor: Theme.of(context).primaryColor,
              highlightColor: Theme.of(context).accentColor,
              child: Container(
                height: 200,
                color: Colors.blueAccent,
              )),
        ],
      ),
    );
  }
}
