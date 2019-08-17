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

class DetailPage extends StatefulWidget {
  final Product _product;

  DetailPage(this._product);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isExpanded = false;
  bool isVariableProduct = false;
  Repository repo;
  double rating = 4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isVariableProduct = widget._product.type == 'variable' ? true : false;
    repo = Repository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget._product.name,
          style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  ImagePreview(
                    src: widget._product.images
                        .map((value) => value.src)
                        .toList(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: Text(
                              "${widget._product.name}",
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SmoothStarRating(
                              allowHalfRating: true,
                              onRatingChanged: (v) {
                                rating = v;
                              },
                              starCount: 5,
                              rating: rating,
                              size: 20.0,
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
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    child: widget._product.attributes.length > 0
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, bottom: 8),
                            child: AttributesView(
                              title: widget._product.attributes[0].name,
                              attributes: widget._product.attributes[0].options,
                            ),
                          )
                        : null,
                  ),

                  SizedBox(
                    height: widget._product.attributes.length > 0 ? 20 : 0,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Product Details",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                        isExpanded ? "Hide" : "Show",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Theme.of(context).textTheme.title.color,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 4, bottom: 8),
                    child: Text(
                      "View Similar".toUpperCase(),
                      style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.only(left: 8),
                    child: FutureBuilder(
                        future: repo.getRelatedProductsFor(widget._product),
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
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(
                                                        snapshot.data[pos])));
                                      },
                                      product: snapshot.data[pos],
                                    );
                                  });
                          }
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 4, bottom: 10),
                    child: Text(
                      "More".toUpperCase(),
                      style: TextStyle(fontFamily: 'Raleway'),
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
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8),
                                      child: Text(
                                        'MORE IN ${widget._product.categories[pos].name}',
                                        style: TextStyle(fontFamily: 'Raleway'),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8),
                                      child: Icon(Icons.chevron_right),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Theme.of(context).textTheme.title.color,
                              )
                            ],
                          );
                        },
                        itemCount: widget._product.categories.length),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: BottomButtonView(onWishlistClicked: (){}, onCartClicked: (){})
              ),
            ],
          ),
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


