import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/widgets/AttributesCard.dart';
import 'package:e_commerce/widgets/BottomButton.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:e_commerce/widgets/OffersBanner.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:e_commerce/widgets/ProductCard.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:e_commerce/widgets/ImagePreview.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:e_commerce/util/constants.dart';

class DetailPage extends StatefulWidget {
  final Product _product;

  DetailPage(this._product);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isExpanded = false;
  Repository repo;
  bool isFavourite = false;

  Future<List<Product>> _relatedProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo = Repository();
    _relatedProducts = getRelatedProducts();
  }

  Future<List<Product>> getRelatedProducts() async {
    return await repo.getRelatedProductsFor(widget._product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget._product.name,
          style: TextStyle(
              fontFamily: 'Raleway', fontWeight: FontWeight.w500, fontSize: 14),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.share,
                color: Theme.of(context).textTheme.title.color,
//                size: Constants.screenAwareSize(20, context),
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).textTheme.title.color,
//                size: Constants.screenAwareSize(20, context),
              ),
              onPressed: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
              }),
          SizedBox(
            width: Constants.screenAwareSize(8, context),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ImagePreview(
                  src:
                      widget._product.images.map((value) => value.src).toList(),
                ),
                SizedBox(
                  height: Constants.screenAwareSize(30, context),
                ),
                Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Text(
                            "${widget._product.name}",
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SmoothStarRating(
                            allowHalfRating: true,
                            onRatingChanged: (v) {},
                            starCount: 5,
                            rating: 3,
                            size: Constants.screenAwareSize(20, context),
                            color: Theme.of(context).accentColor,
                            borderColor:
                                Theme.of(context).textTheme.title.color,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        "\$${widget._product.price}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Constants.screenAwareSize(20, context),
                ),
                Container(
                  child: widget._product.attributes.length > 0
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 8),
                          child: AttributesView(
                            height: 50,
                            width: 50,
                            title: widget._product.attributes[0].name,
                            attributes: widget._product.attributes[0].options,
                          ),
                        )
                      : null,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "PRODUCT DETAILS",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Constants.screenAwareSize(10, context),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: AnimatedCrossFade(
                        firstChild: Text(
                          widget._product.shortDescription,
                          overflow: TextOverflow.fade,
                        ),
                        secondChild: Text(
                          widget._product.description,
                          maxLines: 2,
                        ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: kThemeAnimationDuration)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: GestureDetector(
                    onTap: _expand,
                    child: Text(
                      isExpanded ? "HIDE" : "SHOW",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: Constants.screenAwareSize(10, context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: Theme.of(context).textTheme.title.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 4, bottom: 8),
                  child: Text(
                    "VIEW SIMILAR",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height) / 3,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: FutureBuilder(
                      future: _relatedProducts,
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
                            if (snapshot.hasError) {
                              return Center(
                                child: Text('${snapshot.error}'),
                              );
                            }
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, pos) {
                                  return ProductDisplayCard(
                                    margin: 2,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                  snapshot.data[pos])));
                                    },
                                    product: snapshot.data[pos],
                                  );
                                });
                        }
                      }),
                ),
                SizedBox(
                  height: Constants.screenAwareSize(20, context),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 4, bottom: 10),
                  child: Text(
                    "MORE TO EXPLORE",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize:16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, pos) {
                        return Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: Text(
                                      'MORE IN ${widget._product.categories[pos].name}',
                                      style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize:
                                              14),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: Icon(
                                      Icons.chevron_right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Theme.of(context).textTheme.title.color,
                              height: Constants.screenAwareSize(8, context),
                            )
                          ],
                        );
                      },
                      itemCount: widget._product.categories.length),
                ),
                SizedBox(
                  height: Constants.screenAwareSize(100, context),
                ),
              ],
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: BottomButtonView(
                    onWishlistClicked: () {}, onCartClicked: () {})),
          ],
        ),
      ),
    );
  }

  void _expand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
