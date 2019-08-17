import 'package:flutter/material.dart';
import 'package:e_commerce/screens/Detail_Page.dart';

//import 'package:e_commerce/model/Product.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:e_commerce/widgets/ProductCard.dart';

//TODO add repo method to get products according to category

class ProductListPage extends StatefulWidget {
  final String categoryName;
  final int categoryId;

  ProductListPage({@required this.categoryName, @required this.categoryId});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Repository repo;
  Future<List<Product>> _productsForCategory;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo = Repository();
    _productsForCategory = _getProductsForCategory();
  }

  Future<List<Product>> _getProductsForCategory() async {
    return await repo.getProductForCategory(widget.categoryId.toString());
  }

  PersistentBottomSheetController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          widget.categoryName,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          SizedBox(
            width: 18,
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder(
                  future: _productsForCategory,
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
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GridView.builder(
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: .6,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 1),
                              itemBuilder: (context, pos) {
                                Product product = snapshot.data[pos];
                                return ProductDisplayCard(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(product)));
                                    },
                                    product: product);
                              }),
                        );
                    }
                  }),
            ),
            Positioned(
                bottom: 0,
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.reorder),
                          label: Text('SORT')),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.tune),
                          label: Text('FILTER')),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  //TODO set bottom sheet
  void _showBottomSheet(String title, List widgets) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              child: ListView(children: [Text(title), widgets]),
            ));
  }
}
