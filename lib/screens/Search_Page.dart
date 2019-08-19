import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/SearchBar.dart';
import 'package:e_commerce/widgets/Appbar.dart';
import 'package:e_commerce/screens/ProductList_Page.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:e_commerce/model/woocommerce_category.dart' as ProductCategory;

class SearchPage extends StatefulWidget {
  static String id = "CategoryPage";
  static String title = "CategoryPage";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Repository repo;
  Future<List<ProductCategory.Category>> _categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo = Repository();
    _categories = _getCategories();
  }

  Future<List<ProductCategory.Category>> _getCategories() async {
    return await repo.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          snap: true,
          bottom:
              PreferredSize(child: SearchBar(), preferredSize: Size(70, 20)),
          expandedHeight: Constants.screenAwareSize(45, context),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          FutureBuilder(
              future: _categories,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    // TODO: Handle this case.
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                    // TODO: Handle this case.
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasError)
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, pos) {
                          return CategoryBanner(snapshot.data[pos]);
                        });
                }
              })
        ]))
      ],
    );
  }
}

class CategoryBanner extends StatelessWidget {
  final ProductCategory.Category _category;

  CategoryBanner(this._category);

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height) / 2 - 150;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductListPage(
                    categoryName: _category.name,
                    categoryId: _category.id,
                    imageSrc: _category.image.src)));
      },
      child: Stack(
        children: <Widget>[
          Container(
            height: Constants.screenAwareSize(height, context),
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_category.image.src))),
          ),
          Container(
            height: Constants.screenAwareSize(height, context),
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
            height: Constants.screenAwareSize(height, context),
            margin: EdgeInsets.all(4),
            child: Center(
                child: Text(
              _category.name,
              style: TextStyle(
                  fontSize: Constants.screenAwareSize(40, context),
                  fontFamily: 'Raleway',
                  color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}
