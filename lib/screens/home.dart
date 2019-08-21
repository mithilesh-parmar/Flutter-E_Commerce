import 'package:e_commerce/states/home_state.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/OffersBanner.dart';
import 'package:e_commerce/widgets/SearchBar.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:e_commerce/widgets/ProductCard.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:e_commerce/widgets/Header.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  static String title = 'Home';

  @override
  Widget build(BuildContext context) {
    final HomeState homeState = Provider.of<HomeState>(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            expandedHeight: Constants.screenAwareSize(180, context),
            flexibleSpace: FlexibleSpaceBar(background: OffersBanner())),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: HeaderWidget(
              heading: 'Trending',
              iconText: 'See all',
              icon: null,
              onPressed: () {},
            ),
          ),
          homeState.isLoading
              ? Container(
                  child: Center(
                    child: Shimmer.fromColors(
                        child: Text(
                          'Loading',
                          style: TextStyle(fontSize: 40),
                        ),
                        baseColor: Theme.of(context).textTheme.title.color,
                        highlightColor: Theme.of(context).accentColor),
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: homeState.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .6,
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemBuilder: (context, pos) {
                    Product product = homeState.products[pos];
                    return ProductDisplayCard(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(product)));
                      },
                      product: product,
                    );
                  })
        ])),
      ],
    );
  }
}
