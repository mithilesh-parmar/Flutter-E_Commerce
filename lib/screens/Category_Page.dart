import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/SearchBar.dart';
import 'package:e_commerce/widgets/Appbar.dart';

class CategoryPage extends StatefulWidget {
  static String id = "CategoryPage";

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var categories = [
    "",
    'Men',
    "Women",
    'Boys',
    'Girls',
    'Unisex',
    'Sports',
    'InnerWear',
    'Ethnic'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, pos) {
          return pos == 0
              ? SearchBar()
              : CategoryBanner(
                  heading: categories[pos],
                  color: Colors.orangeAccent,
                );
        });
  }
}

class CategoryBanner extends StatelessWidget {
  final String heading;
  final Color color;

  CategoryBanner({this.heading, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
//          color: color,
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [color, color.withOpacity(.7)],
          )),
      margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
      child: Center(
        child: Text(
          heading,
          style: TextStyle(
              color: Colors.white, fontFamily: 'Raleway', fontSize: 22),
        ),
      ),
      height: 130,
    );
  }
}
