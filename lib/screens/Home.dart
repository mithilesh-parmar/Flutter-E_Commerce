import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/Appbar.dart';
import 'package:e_commerce/widgets/SearchBar.dart';
import 'package:e_commerce/widgets/OffersBanner.dart';
import 'package:e_commerce/model/Product.dart';
import 'package:e_commerce/widgets/ProductCard.dart';
import 'package:e_commerce/widgets/Header.dart';
import 'package:e_commerce/screens/Detail_Page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TopAppBar(
                onCartIconPress: (){

                },
                onProfileIconPress: (){},
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
                height: 240,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Product item = productList[index];
                    return ProductCard(
                        product: item,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailPage(product: item)));
                        });
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                ),
              ),

              HeaderWidget(
                iconText: "More",
                heading: "Best Sellers",
                icon: Icons.expand_more,
                onPressed: () {},
              ),
              Container(
                height: 240,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Product item = mayLikeProductList[index];
                    return ProductCard(
                        product: item,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailPage(product: item)));
                        });
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: mayLikeProductList.length,
                ),
              ),

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
