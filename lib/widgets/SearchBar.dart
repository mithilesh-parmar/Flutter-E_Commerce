import 'package:e_commerce/util/constants.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final EdgeInsets margin;

  SearchBar({this.margin = const EdgeInsets.all(8)});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                  color:
                      Theme.of(context).textTheme.title.color.withOpacity(.4),
                  blurRadius: 10,
                  offset: Offset(5, 5))
            ]),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 8, top: 8),
                border: InputBorder.none,
                hintText: 'Search....',
                hintStyle: TextStyle(
                    fontSize: Constants.screenAwareSize(14, context),
                    fontFamily: 'Raleway'),
                suffixIcon: Icon(
                  Icons.search,
                  size: Constants.screenAwareSize(22, context),
                )),
          ),
        ));
  }
}
