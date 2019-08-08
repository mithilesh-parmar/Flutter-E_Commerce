import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:e_commerce/model/Product.dart';
import 'package:e_commerce/widgets/VariableList.dart';

class ProductDetailPage extends StatefulWidget {
  static String id = "ProductDetailPage";

  final Product product;

  ProductDetailPage({@required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isExpanded = false;

  var sizeNumList = [8, 9, 10, 11, 12];
  var colorList = [Colors.grey, Colors.redAccent, Colors.black, Colors.orange];
  bool isFavourite = false;
  bool isAddedToCart = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf3f6fb),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            widget.product.name,
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
              color: Colors.redAccent,
              onPressed: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
            )
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Hero(
                  tag: widget.product.id,
                  child: Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(widget.product.imageUrl),
                            fit: BoxFit.scaleDown)),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 18),
                    child: Row(
                      children: <Widget>[
                        Text(
                          widget.product.name,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Raleway-bold',
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              widget.product.avgRating,
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "(${widget.product.peopleRated} people)",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          widget.product.price,
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 2, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 8,
                          ),
                          AnimatedCrossFade(
                              firstChild: Text(
                                widget.product.description,
                                maxLines: 2,
                                style: TextStyle(color: Colors.black87),
                              ),
                              secondChild: Text(
                                widget.product.summary,
                                style: TextStyle(color: Colors.black87),
                              ),
                              crossFadeState: isExpanded
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: kThemeAnimationDuration),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: GestureDetector(
                              onTap: _expand,
                              child: Text(
                                isExpanded ? "Hide" : "Show",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(.7),
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),

//                          Padding(
//                            padding: const EdgeInsets.only(top: 8.0, right: 8),
//                            child: Text(
//                              "Size",
//                              style: TextStyle(
//                                color: Colors.black87,
//                                fontSize: 16,
//                                fontFamily: 'Raleway-bold',
//                              ),
//                            ),
//                          ),
//                          Container(
//                            height: 60,
//                            child: ListView.builder(
//                                scrollDirection: Axis.horizontal,
//                                itemCount: sizeNumList.length,
//                                itemBuilder: (context, pos) {
//                                  int item = sizeNumList[pos];
//                                  return GestureDetector(
//                                    onTap: () {
//                                      setState(() {
//                                        currentSizeIndex = pos;
//                                      });
//                                    },
//                                    child: new SizeItem(size: item.toString(), isSelected: currentSizeIndex == pos, context: context),
//                                  );
//                                }),
//                          ),
//
                        VariableList(title: 'Size',variantsList: sizeNumList, type: 'SIZE'),
                        VariableList(title: 'Color',variantsList: colorList, type: 'COLOR')

                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isAddedToCart = !isAddedToCart;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 4, right: 4, bottom: 8),
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                        child: Text(
                      isAddedToCart ? "Remove from cart" : "Add to cart",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
