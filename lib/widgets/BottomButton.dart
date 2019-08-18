import 'package:e_commerce/util/constants.dart';
import 'package:flutter/material.dart';

class BottomButtonView extends StatelessWidget {
  final Function onWishlistClicked;
  final Function onCartClicked;

  BottomButtonView(
      {@required this.onWishlistClicked, @required this.onCartClicked});

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
            child: GestureDetector(
              onTap: onWishlistClicked,
              child: Container(
                height: Constants.screenAwareSize(40, context),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(color: Theme.of(context).accentColor)),
                child: Center(
                    child: Text(
                  'WISHLIST',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 14,
                  ),
                )),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onCartClicked,
              child: Container(
                margin: EdgeInsets.all(2),
                height: Constants.screenAwareSize(40, context),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
                child: Center(
                    child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                      fontFamily: 'Raleway', color: Colors.white, fontSize: 14),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
