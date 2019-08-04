import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(right: 16, left: 16, top: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}