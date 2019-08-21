import 'package:e_commerce/states/category_state.dart';

import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/widgets/ShimmerList.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/SearchBar.dart';
import 'package:e_commerce/screens/ProductList_Page.dart';
import 'package:e_commerce/model/woocommerce_category.dart' as ProductCategory;
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static String id = "CategoryPage";
  static String title = "CategoryPage";

  @override
  Widget build(BuildContext context) {
    final CategoryState categoryState = Provider.of<CategoryState>(context);
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
          categoryState.isLoading
              ? ShimmerList()
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categoryState.categories.length,
                  itemBuilder: (context, pos) {
                    return CategoryBanner(categoryState.categories[pos]);
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
                    )));
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
