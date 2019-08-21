import 'package:e_commerce/states/productlist_state.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/widgets/ShimmerGrid.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:e_commerce/widgets/ProductCard.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  final String categoryName;
  final int categoryId;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProductListPage({@required this.categoryName, @required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => ProductListState(categoryId.toString()),
      child: Scaffold(
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
                                  _showBottomSheet('SORT', null, context);
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
                          'SHOP FOR ${categoryName}'.toUpperCase(),
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
                Consumer<ProductListState>(
                  builder: (context, state, child) => state.isLoading
                      ?ShimmerGrid()
                      : GridView.builder(
                          itemCount: state.products.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: .6,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 1),
                          itemBuilder: (context, pos) {
                            Product product = state.products[pos];
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
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(String title, List widgets, BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
          height: Constants.screenAwareSize(300, context),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  'SORT',
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
                  style: TextStyle(fontSize: 12, fontFamily: 'Raleway'),
                ),
              ),
              ListTile(
                title: Text(
                  'LOW TO HIGH',
                  style: TextStyle(fontSize: 12, fontFamily: 'Raleway'),
                ),
              ),
              ListTile(
                title: Text(
                  'LOW TO HIGH',
                  style: TextStyle(fontSize: 12, fontFamily: 'Raleway'),
                ),
              ),
            ],
          )));
}
