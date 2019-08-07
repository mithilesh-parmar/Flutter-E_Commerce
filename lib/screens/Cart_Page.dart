import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static String id = "CartPage";

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: <Widget>[
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, pos) {
                return Center(
                  child: pos == 0
                      ? Text(
                          'Cart',
                          style: TextStyle(fontFamily: 'Raleway', fontSize: 33),
                        )
                      : CartItem(),
                );
              },
              separatorBuilder: (context, pos) => Divider(),
              itemCount: 4),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[Text('Total'), Spacer(), Text('2800')],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[Text('Discount'), Spacer(), Text('-460')],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('Amount Payable'),
                    Spacer(),
                    Text('2340')
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonTheme(
                  buttonColor: Colors.orangeAccent,
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(8),
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'Checkout'.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.white70,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
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
                  'Carlton London',
                  style: TextStyle(fontFamily: 'Raleway', fontSize: 18),
                ),
                Text(
                  'Pink Perforated Real Leather Ballernea',
                  style: TextStyle(fontFamily: 'Raleway', fontSize: 13),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Size: S',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Qty: 2',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '2800',
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
