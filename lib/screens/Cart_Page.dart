import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/widgets/QuantityChooser.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/states/cart_state.dart';

// FutureBuilder(
//              future: _cartProducts,
//              builder: (context, snapshot) {
//                switch (snapshot.connectionState) {
//                  case ConnectionState.none:
//                    // TODO: Handle this case.
//                    break;
//                  case ConnectionState.waiting:
//                    return Center(
//                      child: CircularProgressIndicator(),
//                    );
//                  case ConnectionState.active:
//                    // TODO: Handle this case.
//                    break;
//                  case ConnectionState.done:
//                    if (snapshot.hasError)
//                      return Center(
//                        child: Text(snapshot.error),
//                      );
//
//                    return ListView.separated(
//                        shrinkWrap: true,
//                        physics: NeverScrollableScrollPhysics(),
//                        itemBuilder: (context, pos) => Container(
//                              constraints:
//                                  BoxConstraints(minHeight: 80, maxHeight: 130),
//                              padding: EdgeInsets.all(8),
//                              child: Row(
//                                children: <Widget>[
//                                  Expanded(
//                                      flex: 2,
//                                      child: Image.network(
//                                          snapshot.data[pos].images[0].src)),
//                                  SizedBox(
//                                    width: 20,
//                                  ),
//                                  Expanded(
//                                    flex: 3,
//                                    child:
//                                        buildProductDetailView(snapshot, pos),
//                                  ),
//                                  Expanded(child: QuantityChooser())
//                                ],
//                              ),
//                            ),
//                        separatorBuilder: (context, pos) => Padding(
//                              padding: EdgeInsets.only(left: 8, right: 8),
//                              child: Divider(
//                                color: Theme.of(context).textTheme.title.color,
//                              ),
//                            ),
//                        itemCount: snapshot.data.length);
//                }
//              }),

//TODO improve ui and add button functionality
class CartPage extends StatelessWidget {
  static String id = "CartPage", title = 'Cart';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: Constants.screenAwareSize(20, context),
          ),
          Consumer<CartState>(
            builder: (context, cart, child) {
              return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, pos) {
                    List<Product> products = cart.getCartProducts();
                    return Container(
                      constraints:
                          BoxConstraints(minHeight: 80, maxHeight: 130),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child:
                                  Image.network(products[pos].images[0].src)),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 3,
                            child: buildProductDetailView(products[pos]),
                          ),
                          Expanded(child: QuantityChooser())
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, pos) => Divider(),
                  itemCount: cart.getCartProducts().length);
            },
          ),
          buildCouponView(context),
          Consumer<CartState>(
            builder: (context, cart, child) {
              return buildTotalView(context, cart);
            },
          )
        ]))
      ],
    );
  }
}

Widget buildCouponView(BuildContext context) {
  return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: ListTile(
          onTap: () {},
          leading: Icon(Icons.local_offer),
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text('APPLY COUPON')));
}

Widget buildTotalView(BuildContext context, CartState cart) {
  return Container(
    margin: EdgeInsets.only(top: 8, bottom: 18, left: 4, right: 4),
    padding: EdgeInsets.all(8),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Total ',
              style: TextStyle(fontFamily: 'Raleway'),
            ),
            Spacer(),
            Text('${cart.getTotalAmount()}')
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              'Delivery charge ',
              style: TextStyle(fontFamily: 'Raleway'),
            ),
            Spacer(),
            Text('${cart.deliveryCharge}')
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            Text(
              'Payable ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Raleway'),
            ),
            Spacer(),
            Text(
              'Rs. ${cart.getPayableAmount()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'Checkout',
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
          ),
        )
      ],
    ),
  );
}

Column buildProductDetailView(Product product) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Text(
        product.name,
        overflow: TextOverflow.fade,
        softWrap: true,
        style: TextStyle(
          fontFamily: 'Raleway',
        ),
      ),
      Row(
        children: <Widget>[
          Text(
            '${product.attributes[0].name}: ',
            overflow: TextOverflow.fade,
            softWrap: true,
            style:
                TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w200),
          ),
          Text(
            product.attributes[0].options[0],
            overflow: TextOverflow.fade,
            softWrap: true,
            style:
                TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w200),
          )
        ],
      ),
      Text(
        'Rs. ${product.price}',
        overflow: TextOverflow.fade,
        softWrap: true,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      )
    ],
  );
}
