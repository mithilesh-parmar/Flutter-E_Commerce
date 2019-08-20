import 'package:e_commerce/util/constants.dart';
import 'package:flutter/material.dart';

class BottomButtonView extends StatelessWidget {
  final Function onWishlistClicked;
  final Function onCartClicked;

  BottomButtonView({
    @required this.onWishlistClicked,
    @required this.onCartClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(2),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ButtonTheme(
                height: Constants.screenAwareSize(35, context),
                child: FlatButton(
                    onPressed: onWishlistClicked, child: Text('WISHLIST'))),
          ),
          Expanded(
            flex: 2,
            child: ButtonTheme(
              height: Constants.screenAwareSize(35, context),
              child: FlatButton(
                  color: Theme.of(context).accentColor,
                  onPressed: onCartClicked,
                  child: Text(
                    'ADD TO CART',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontSize: 14),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
