import 'package:e_commerce/model/woocommerce_category.dart';
import 'package:e_commerce/screens/Search_Page.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:flutter/widgets.dart' as flutter;

//import 'package:e_commerce/model/Product.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:e_commerce/widgets/ProductCard.dart';

//TODO add repo method to get products according to category

class ProductListPage extends StatefulWidget {
  final String categoryName;
  final int categoryId;
  final String imageSrc;

  ProductListPage(
      {@required this.categoryName, @required this.categoryId, this.imageSrc});

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
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              snap: true,
              floating: true,
              pinned: true,
              bottom: PreferredSize(
                  child: Container(
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton.icon(
                              color: Colors.transparent,
                              onPressed: () {
                                _showBottomSheet('SORT', null);
                              },
                              icon: Icon(
                                Icons.reorder,
                              ),
                              label: Text(
                                'SORT',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Raleway'),
                              )),
                        ),
                        Container(
                          width: 1,
                          height: Constants.screenAwareSize(20, context),
                          color: Theme.of(context).textTheme.title.color,
                        ),
                        Expanded(
                          child: FlatButton.icon(
                              color: Colors.transparent,
                              onPressed: () {},
                              icon: Icon(
                                Icons.tune,
                              ),
                              label: Text(
                                'FILTER',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Raleway'),
                              )),
                        )
                      ],
                    ),
                  ),
                  preferredSize: Size(MediaQuery.of(context).size.width, 70)),
              expandedHeight: Constants.screenAwareSize(180, context),
              flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(18),
                    child: Center(
                      child: Text(
                        'SHOP FOR ${widget.categoryName}'.toUpperCase(),
                        overflow: TextOverflow.fade,
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(fontFamily: 'Raleway', fontSize: 34),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.transparent,
                            Theme.of(context).primaryColor.withOpacity(.7)
                          ]),
                    ),
                  ),
                ],
              )),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {}),
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              _productList(),
            ]))
          ],
        ),
      ),
    );
  }

  Widget _productList() {
    return Container(
      padding: EdgeInsets.only(bottom: 80),
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
                  padding:
                      const EdgeInsets.only(left: 4.0, right: 4, bottom: 40),
                  child: GridView.builder(
                      itemCount: snapshot.data.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .6,
                          mainAxisSpacing: 1,
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
    );
  }

  Widget _bottomButton() {
    return Positioned(
        bottom: 0,
        height: Constants.screenAwareSize(40, context),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _showBottomSheet('SORT', null);
                  },
                  icon: Icon(
                    Icons.reorder,
//                            size: Constants.screenAwareSize(16, context),
                  ),
                  label: Text(
                    'SORT',
                    style: TextStyle(fontSize: 14, fontFamily: 'Raleway'),
                  )),
            ),
            Container(
              width: 1,
              height: Constants.screenAwareSize(20, context),
              color: Theme.of(context).textTheme.title.color,
            ),
            Expanded(
              child: FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  icon: Icon(
                    Icons.tune,
//                            size: Constants.screenAwareSize(16, context),
                  ),
                  label: Text(
                    'FILTER',
                    style: TextStyle(fontSize: 14, fontFamily: 'Raleway'),
                  )),
            )
          ],
        ));
  }

//TODO set bottom sheet

  void _showBottomSheet(String title, List widgets) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
            height: Constants.screenAwareSize(300, context),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'SORT',
//                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  height: Constants.screenAwareSize(1, context),
                ),
                ListTile(
                  title: Text(
                    'LOW TO HIGH',
//                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontFamily: 'Raleway'),
                  ),
                ),
                ListTile(
                  title: Text(
                    'LOW TO HIGH',
//                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontFamily: 'Raleway'),
                  ),
                ),
                ListTile(
                  title: Text(
                    'LOW TO HIGH',
//                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontFamily: 'Raleway'),
                  ),
                ),
              ],
            )));
  }
}
