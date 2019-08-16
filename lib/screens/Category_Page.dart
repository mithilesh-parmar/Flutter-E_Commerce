import 'package:e_commerce/util/repo.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/SearchBar.dart';
import 'package:e_commerce/widgets/Appbar.dart';
import 'package:e_commerce/screens/ProductList_Page.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:e_commerce/model/woocommerce_category.dart' as ProductCategory;

class CategoryPage extends StatefulWidget {
  static String id = "CategoryPage";
  static String title = "CategoryPage";

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
          switch(snapshot.connectionState){

            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(),);
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
             if(snapshot.hasError)return Center(child: Text('Error: ${snapshot.error}'),);
             return ListView.builder(
                 itemCount: snapshot.data.length + 1,
                 itemBuilder: (context, pos) {
                   if (pos == 0)
                     return SearchBar(
                       padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                     );
                   return CategoryBanner(snapshot.data[pos - 1]);
                 });
          }

        });
  }
}

class CategoryBanner extends StatelessWidget {
  final ProductCategory.Category _category;

  CategoryBanner(this._category);

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height)/2 - 50;
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
            height: height,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_category.image.src))),
          ),
          Container(
            height: height,
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
            height: height,
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
