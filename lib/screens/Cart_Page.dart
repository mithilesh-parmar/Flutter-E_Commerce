import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:flutter/material.dart';

//TODO improve ui and add button functionality
class CartPage extends StatefulWidget {
  static String id = "CartPage", title = 'Cart';

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Repository _repository;
  Future<List<Product>> _cartProducts;

  int _totalProducts = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repository = Repository();
    _cartProducts = _getCartProducts();
  }

  Future<List<Product>> _getCartProducts() async {
    return _repository.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
//        SliverAppBar(
//          expandedHeight: 80,
//          centerTitle: false,
//          title: Padding(
//            padding: const EdgeInsets.only(top: 8.0),
//            child: Text(
//              'Shopping Cart'.toUpperCase(),
//              style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontFamily: 'Raleway',
//                  fontSize: 30),
//            ),
//          ),
//        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: Constants.screenAwareSize(20, context),
          ),
          FutureBuilder(
              future: _cartProducts,
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
                        child: Text(snapshot.error),
                      );

                    return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, pos) => Container(
                              constraints:
                                  BoxConstraints(minHeight: 80, maxHeight: 130),
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Image.network(
                                          snapshot.data[pos].images[0].src)),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child:
                                        buildProductDetailView(snapshot, pos),
                                  ),
                                  Expanded(child: buildQuantityView(context))
                                ],
                              ),
                            ),
                        separatorBuilder: (context, pos) => Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Divider(
                                color: Theme.of(context).textTheme.title.color,
                              ),
                            ),
                        itemCount: snapshot.data.length);
                }
              }),
        ]))
      ],
    );
  }

  Column buildProductDetailView(AsyncSnapshot snapshot, int pos) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          snapshot.data[pos].name,
          overflow: TextOverflow.fade,
          softWrap: true,
          style: TextStyle(
            fontFamily: 'Raleway',
          ),
        ),
        Row(
          children: <Widget>[
            Text(
              '${snapshot.data[pos].attributes[0].name}: ',
              overflow: TextOverflow.fade,
              softWrap: true,
              style:
                  TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w200),
            ),
            Text(
              snapshot.data[pos].attributes[0].options[0],
              overflow: TextOverflow.fade,
              softWrap: true,
              style:
                  TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w200),
            )
          ],
        ),
        Text(
          'Rs. ${snapshot.data[pos].price}',
          overflow: TextOverflow.fade,
          softWrap: true,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }

  Column buildQuantityView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).textTheme.title.color)),
            child: Center(
              child: Text('+'),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Center(
              child: Text(
                '1',
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).textTheme.title.color)),
            child: Center(
              child: Text('-'),
            ),
          ),
        )
      ],
    );
  }
}
