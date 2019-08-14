import 'package:e_commerce/util/repo.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/SearchBar.dart';
import 'package:e_commerce/widgets/Appbar.dart';
import 'package:e_commerce/screens/ProductList_Page.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:e_commerce/model/woocommerce_category.dart' as ProductCategory;

class CategoryPage extends StatefulWidget {
  static String id = "CategoryPage";

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Repository repo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo = Repository();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repo.getCategories(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, pos) {
                return CategoryBanner(snapshot.data[pos]);
              });
        });
  }
}

class CategoryBanner extends StatelessWidget {
  final ProductCategory.Category _category;

  CategoryBanner(this._category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductListPage(
                      categoryName: _category.name,
                      categoryId: _category.id,
                    )));
      },
      child: Stack(
        children: <Widget>[
          Container(
            height: 180,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_category.image.src))),
          ),
          Container(
            height: 180,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54]),
            ),
          ),
          Container(
            height: 180,
            margin: EdgeInsets.all(4),
            child: Center(
                child: Text(
              _category.name,
              style: TextStyle(
                  fontSize: 40, fontFamily: 'Raleway', color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}
