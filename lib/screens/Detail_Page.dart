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
        title: Text(widget._product.name),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ImagePreview(
                  src:
                      widget._product.images.map((value) => value.src).toList(),
                  previewWidth: 80,
                  previewHeight: 80,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                      child: Text(
                        "${widget._product.name}",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Spacer(),
                    RawMaterialButton(
                      splashColor: Colors.red,
                      onPressed: () {},
                      elevation: 0,
                      fillColor: Theme.of(context).backgroundColor,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Feather.getIconData("heart"),
                          size: 30,
                          color: Theme.of(context).textTheme.title.color,
                        ),
                      ),
                    )
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: 6,
                  ),
                  child: Row(
                    children: <Widget>[
                      SmoothStarRating(
                          allowHalfRating: true,
                          onRatingChanged: (v) {
                            rating = v;
                          },
                          starCount: 5,
                          rating: rating,
                          size: 25.0,
                          color: Colors.amberAccent,
                          borderColor: Theme.of(context).textTheme.title.color,
                          spacing: 0.0),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          '36 reviews',
                          overflow: TextOverflow.fade,
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "\$${widget._product.price}",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 10),
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
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
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
                  padding: const EdgeInsets.only(left: 8.0, top: 4, bottom: 16),
                  child: Text(
                    "Related",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                //TODO add container for attributes
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
                  height: 80,
                ),
              ],
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: FloatingActionButton(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                        ),
                      )),
                )),
          ],
        ),
      ),
    );
  }

  Widget customView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('${widget._product.name}'),
          centerTitle: true,
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Stack(
            children: <Widget>[
              Container(
                height: 380,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: NetworkImage('${widget._product.images[0].src}'),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                right: -10.0,
                bottom: 3.0,
                child: RawMaterialButton(
                  onPressed: () {},
                  fillColor: Colors.white,
                  shape: CircleBorder(),
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Feather.getIconData("heart"),
                      color: Theme.of(context).accentColor,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "${widget._product.name}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "\$${widget._product.price}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10),
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
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(.7),
                    fontSize: 16),
              ),
            ),
          ),
        ])),
        SliverToBoxAdapter(
          child: Container(
            height: 200,
          ),
        )
      ],
    );
  }

  void _expand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
