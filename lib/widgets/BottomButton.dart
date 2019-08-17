import 'package:flutter/material.dart';

class BottomButtonView extends StatelessWidget {
  final Function onWishlistClicked;
  final Function onCartClicked;

  BottomButtonView(
      {@required this.onWishlistClicked, @required this.onCartClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: onWishlistClicked,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Theme.of(context).accentColor)),
                  child: Center(
                      child: Text(
                        'WishList'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Raleway',
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              width: 10,
              height: 60,
              child: Container(
                color: Theme.of(context).backgroundColor,
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: onCartClicked,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                  ),
                  child: Center(
                      child: Text(
                        'Add to cart'.toUpperCase(),
                        style:
                        TextStyle(fontFamily: 'Raleway', color: Colors.white),
                      )),
                ),
              ),
            )
          ],
        ));
  }
}