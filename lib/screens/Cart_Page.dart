import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:flutter/material.dart';
//TODO improve ui and add button fuctionality
class CartPage extends StatefulWidget {
  static String id = "CartPage", title = 'Cart';
  final Product product;

  CartPage({this.product});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Repository _repository;
  Future<List<Product>> _cartProducts;

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

//  var cartItems = [
//    CartItem(
//      imageUrl:
//          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
//      name: 'Carlton London',
//      description: 'Pink Perforated Real Leather Ballterena',
//      size: 's',
//      price: 1900,
//    ),
//    CartItem(
//      imageUrl:
//          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
//      name: 'Carlton London',
//      description: 'Pink Perforated Real Leather Ballterena',
//      size: 'm',
//      price: 2900,
//    ),
//    CartItem(
//      imageUrl:
//          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
//      name: 'Carlton London',
//      description: 'Pink Perforated Real Leather Ballterena',
//      size: 'l',
//      price: 3900,
//    ),
//    CartItem(
//      imageUrl:
//          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
//      name: 'Carlton London',
//      description: 'Pink Perforated Real Leather Ballterena',
//      size: 'xl',
//      price: 4900,
//    ),
//    CartItem(
//      imageUrl:
//          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
//      name: 'Carlton London',
//      description: 'Pink Perforated Real Leather Ballterena',
//      size: 'xxl',
//      price: 5900,
//    ),
//    CartItem(
//      imageUrl:
//          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
//      name: 'Carlton London',
//      description: 'Pink Perforated Real Leather Ballterena',
//      size: 'xxxl',
//      price: 6900,
//    ),
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: FutureBuilder(
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

                return ListView.builder(
                  itemBuilder: (context, pos) {
                    if (pos == 0) {
                      return Center(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          child: Text(
                            'Cart',
                            style:
                                TextStyle(fontFamily: 'Raleway', fontSize: 30),
                          ),
                        ),
                      );
                    } else if (pos == snapshot.data.length) {
                      return TotalCartWidget();
                    }
                    return CartItem(
                      product: snapshot.data[pos],
                    );
                  },
                  itemCount: snapshot.data.length + 1,
                );
            }
          }),
    );
  }
}

class TotalCartWidget extends StatelessWidget {
  Widget _detailRow({String title, double amount, FontWeight fontWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Raleway', fontSize: 18, fontWeight: fontWeight),
        ),
        Spacer(),
        Text(
          '$amount',
          style: TextStyle(fontWeight: fontWeight),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 18, bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _detailRow(title: 'Total', amount: 1800),
          _detailRow(title: 'Discount', amount: 1800),
          SizedBox(
            height: 8,
          ),
          _detailRow(
              title: 'Amount Payable',
              amount: 1800,
              fontWeight: FontWeight.w700),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            height: 45,
            child: FlatButton(
              onPressed: () {},
              color: Colors.orangeAccent,
              child: Text(
                'Checkout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final Function onPressed;
  final Product product;

  CartItem({this.onPressed, this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 120,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product.images[0].src))),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: TextStyle(fontFamily: 'Raleway', fontSize: 16),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text('SIZE: S'),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                          VerticalDivider(),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text('QTY: 1'),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Rs. ${product.price}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(onPressed: () {}, child: Text('REMOVE'))),
            Expanded(
                child: FlatButton(onPressed: () {}, child: Text('WISHLIST'))),
          ],
        ),
        Divider(
          color: Theme.of(context).textTheme.title.color,
        )
      ],
    );
  }
}
