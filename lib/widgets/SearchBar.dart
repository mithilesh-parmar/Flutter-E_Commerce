import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  EdgeInsets padding;


  SearchBar({this.padding = const EdgeInsets.only(
      left: 22, right: 22, top: 30, bottom: 30)});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: this.padding,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  blurRadius: 30,
                  offset: Offset(0, 10))
            ]),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search....',
                  hintStyle: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
        ));
  }
}
