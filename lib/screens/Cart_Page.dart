import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/VariableList.dart';

class CartPage extends StatefulWidget {
  static String id = "CartPage";

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var cartItems = [
    CartItem(
      imageUrl:
          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
      name: 'Carlton London',
      description: 'Pink Perforated Real Leather Ballterena',
      size: 's',
      price: 1900,
    ),
    CartItem(
      imageUrl:
          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
      name: 'Carlton London',
      description: 'Pink Perforated Real Leather Ballterena',
      size: 'm',
      price: 2900,
    ),
    CartItem(
      imageUrl:
          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
      name: 'Carlton London',
      description: 'Pink Perforated Real Leather Ballterena',
      size: 'l',
      price: 3900,
    ),
    CartItem(
      imageUrl:
          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
      name: 'Carlton London',
      description: 'Pink Perforated Real Leather Ballterena',
      size: 'xl',
      price: 4900,
    ),
    CartItem(
      imageUrl:
          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
      name: 'Carlton London',
      description: 'Pink Perforated Real Leather Ballterena',
      size: 'xxl',
      price: 5900,
    ),
    CartItem(
      imageUrl:
          'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
      name: 'Carlton London',
      description: 'Pink Perforated Real Leather Ballterena',
      size: 'xxxl',
      price: 6900,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView.builder(
        itemBuilder: (context, pos) {
          if (pos == 0) {
            return Center(
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: Text(
                  'Cart',
                  style: TextStyle(fontFamily: 'Raleway', fontSize: 30),
                ),
              ),
            );
          } else if (pos == cartItems.length) {
            return TotalCartWidget();
          }
          return cartItems[pos];
        },
        itemCount: cartItems.length + 1,
      ),
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
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
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
  final String imageUrl, name, description, size;
  final int quantity;
  final double price;
  final Function onPressed;

//'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg'
  CartItem(
      {this.imageUrl,
      this.name,
      this.description,
      this.size,
      this.quantity = 1,
      this.price,
      this.onPressed});

  void _newTaskModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 8, top: 18),
                    child: VariableList(
                        title: 'Size',
                        variantsList: ['1', '2', '3', '41'],
                        type: 'SIZE'),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 8, top: 18),
                    child: VariableList(
                        title: 'Color',
                        variantsList: [
                          Colors.grey,
                          Colors.redAccent,
                          Colors.black,
                          Colors.orange
                        ],
                        type: 'COLOR'),
                  ),
                  Container(
                    padding: EdgeInsets.all(18),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Quantity',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      FlatButton(
                        shape: CircleBorder(),
                        onPressed: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Text(
                              '-',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '1',
                        style: TextStyle(fontSize: 30),
                      ),
                      FlatButton(
                        shape: CircleBorder(),
                        onPressed: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: <Widget>[
                        ButtonTheme(
                          height:55,
                          child: FlatButton(
                              color: Colors.lightBlueAccent,
                              onPressed: () {},
                              child: Text(
                                'Add to fav',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          flex: 3,
                          child: ButtonTheme(
                            height:55,
                            child: FlatButton(
                                color: Colors.redAccent,
                                onPressed: () {},
                                child: Text(
                                  'Remove',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _newTaskModalBottomSheet(context);
      },
      child: Container(
        margin: EdgeInsets.all(2),
        color: Colors.white70,
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              imageUrl,
              width: 80,
              height: 110,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontFamily: 'Raleway', fontSize: 18),
                ),
                Text(
                  description,
                  style: TextStyle(fontFamily: 'Raleway', fontSize: 13),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Size: $size',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Qty: $quantity',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '$price',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
