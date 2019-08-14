import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/Appbar.dart';
import 'package:e_commerce/widgets/SearchBar.dart';
import 'package:e_commerce/widgets/OffersBanner.dart';

//import 'package:e_commerce/model/Product.dart';
import 'package:e_commerce/widgets/ProductCard.dart';
import 'package:e_commerce/widgets/Header.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:e_commerce/model/woocommerce_product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo = Repository();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TopAppBar(
                onCartIconPress: () {},
                onProfileIconPress: () {},
                profileImage: 'profile.png',
              ),
              SizedBox(
                height: 22,
              ),
              new SearchBar(
                padding: EdgeInsets.symmetric(horizontal: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0, top: 2, left: 2, right: 2),
                child: OffersBanner(),
              ),
              SizedBox(
                height: 20,
              ),
              HeaderWidget(
                iconText: "More",
                heading: "Trending",
                icon: Icons.expand_more,
                onPressed: () {},
              ),
              Container(
                constraints: BoxConstraints(minHeight: 180, maxHeight: 250),
                margin: EdgeInsets.only(left: 8),
                child: FutureBuilder(
                    future: repo.getProducts(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Center(child: Text('Press Button To Start'));
                        case ConnectionState.waiting:
                          return Center(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        case ConnectionState.active:
                          // TODO: Handle this case.
                          break;
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              Product item = snapshot.data[index];
                              return ProductDisplayCard(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailPage(
                                                  product: item)));
                                },
                                product: item,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                          );
                      }
                    }),
              ),

//              HeaderWidget(
//                iconText: "More",
//                heading: "Best Sellers",
//                icon: Icons.expand_more,
//                onPressed: () {},
//              ),
//              Container(
//                  height: 240,
//                  child: FutureBuilder(
//                      future: repo.getProducts(),
//                      builder: (context, snapshot) {
//                        if (snapshot.data != null) {
//                          return ListView.builder(
//                            itemBuilder: (context, index) {
//                              Product item = snapshot.data[index];
//                              return ProductCard(
//                                  product: item,
//                                  onPressed: () {
//                                    Navigator.push(
//                                        context,
//                                        MaterialPageRoute(
//                                            builder: (context) =>
//                                                ProductDetailPage(
//                                                    product: item)));
//                                  });
//                            },
//                            scrollDirection: Axis.horizontal,
//                            itemCount: snapshot.data.length,
//                          );
//                        }
//                        return Center(
//                          child: CircularProgressIndicator(),
//                        );
//                      })),

              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Divider(
                  color: Colors.grey,
                  indent: 14,
                  height: 24,
                ),
              ),
//              HeaderWidget(
//                iconText: "Filter",
//                heading: "You might like",
//                icon: Icons.tune,
//              ),
//              GridView.builder(
//                physics: NeverScrollableScrollPhysics(),
//                scrollDirection: Axis.vertical,
//                shrinkWrap: true,
//                itemCount: mayLikeProductList.length,
//                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                    crossAxisCount: 2),
//                itemBuilder: (BuildContext context, int pos) {
//                  Product item = mayLikeProductList[pos];
//                  return ProductCard(
//                      product: item,
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) =>
//                                    ProductDetailPage(product: item)));
//                      });
//                },
//              )
            ]),
      ),
    );
  }
}
