import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/SearchBar.dart';
import 'package:e_commerce/widgets/Appbar.dart';
import 'package:e_commerce/screens/ProductList_Page.dart';

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

  var categoriesUrl = [
    '',
    'https://assets.jassets.com/assets/images/retaillabs/2019/4/25/093166cd-daa6-4453-9f2c-2aa6995cdcf11556177627960-Categories-Final-Women.jpg',
    'https://assets.jassets.com/assets/images/retaillabs/2019/4/25/50b4bece-e3b3-4a91-80ee-adfa02eff4e61556177627967-Categories-Final-Men.jpg',
    'https://assets.jassets.com/assets/images/retaillabs/2019/4/25/dd0eeeca-cc1c-41c7-8dc7-ddd12e3d1d141556177627974-Categories-Final-kids.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categoriesUrl.length,
        itemBuilder: (context, pos) {
          return pos == 0
              ? SearchBar()
              : CategoryBanner(
                  heading: categories[pos], imageUrl: categoriesUrl[pos]);
        });
  }
}

class CategoryBanner extends StatelessWidget {
  final String heading;
  final Color color;
  final String imageUrl;

  CategoryBanner({this.heading, this.color, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductListPage())),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.orangeAccent,
            ),
          ),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}
