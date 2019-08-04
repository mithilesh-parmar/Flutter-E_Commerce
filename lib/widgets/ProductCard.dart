import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart';
import 'package:e_commerce/model/Product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final Function onPressed;

  ProductCard({this.product, this.onPressed});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.9),
            borderRadius: BorderRadius.circular(1),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: Offset(0, 2),
                  blurRadius: 6)
            ]),
        margin: EdgeInsets.only(left: 8, top: 4, bottom: 8, right: 6),
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 9,
                child: Hero(
                  tag: widget.product.id,
                  child: Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.product.imageUrl),
                            fit: BoxFit.scaleDown)),
                  ),
                )),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        widget.product.name,
                        style: TextStyle(
                            fontFamily: 'Raleway', fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        widget.product.price,
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
