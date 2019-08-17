import 'package:e_commerce/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart';
import 'package:e_commerce/screens/Detail_Page.dart';

//import 'package:e_commerce/model/Product.dart';
import 'package:e_commerce/model/woocommerce_product.dart';

//class ProductCard extends StatefulWidget {
//  final Product product;
//  final Function onPressed;
//
//  ProductCard({this.product, this.onPressed});
//
//  @override
//  _ProductCardState createState() => _ProductCardState();
//}
//
//class _ProductCardState extends State<ProductCard> {
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: widget.onPressed,
//      child: Container(
//        decoration: BoxDecoration(
//            color: Colors.white.withOpacity(.9),
//            borderRadius: BorderRadius.circular(1),
//            boxShadow: [
//              BoxShadow(
//                  color: Colors.black.withOpacity(.1),
//                  offset: Offset(0, 2),
//                  blurRadius: 6)
//            ]),
//        margin: EdgeInsets.only(left: 8, top: 4, bottom: 8, right: 6),
//        width: 180,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Expanded(
//                flex: 9,
//                child: Hero(
//                  tag: widget.product.id,
//                  child: Container(
//                    margin: EdgeInsets.all(6),
//                    decoration: BoxDecoration(
//                        image: DecorationImage(
//                            image: NetworkImage(widget.product.images[0].src),
//                            fit: BoxFit.scaleDown)),
//                  ),
//                )),
//            Expanded(
//              flex: 3,
//              child: Padding(
//                padding: const EdgeInsets.only(top: 8.0),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(left: 18.0),
//                      child: Text(
//                        widget.product.name,
//                        style: TextStyle(
//                            fontFamily: 'Raleway', fontWeight: FontWeight.w400),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 18.0),
//                      child: Text(
//                        widget.product.price,
//                        style: TextStyle(fontWeight: FontWeight.w200),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}

class ProductDisplayCard extends StatelessWidget {
  final Function onPressed;
  final Product product;

  ProductDisplayCard({@required this.onPressed, this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
//        padding: EdgeInsets.only(bottom: 8),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.transparent, Constants.lightBG.withOpacity(.1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 10,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(product.images[0].src))),
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '${product.name}',
                style: TextStyle(
                    fontFamily: 'Raleway-bold',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Rs. ${product.price}',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
