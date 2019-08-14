import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/OffersBanner.dart';
import 'package:e_commerce/widgets/SearchBar.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:e_commerce/widgets/ProductCard.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:e_commerce/widgets/Header.dart';
import 'package:e_commerce/screens/Detail_Page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchControl = new TextEditingController();
  Repository repo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo = Repository();
    repo.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "What are you \nlooking for?",
              style: TextStyle(
                fontSize: 38,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          SearchBar(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
            ),
          ),
          SizedBox(height: 30),
          OffersBanner(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10),
            child: HeaderWidget(
              heading: 'Trending',
              iconText: 'More',
              icon: null,
              onPressed: () {},
            ),
          )
        ])),
        SliverFillViewport(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: FutureBuilder(
                future: repo.getProducts(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('Cannot Connect to server try in some time');
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    case ConnectionState.active:
                      // TODO: Handle this case.
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }
                      return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: .8, crossAxisCount: 2),
                          itemBuilder: (context, pos) {
                            Product product = snapshot.data[pos];
                            return ProductDisplayCard(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(product)));
                              },
                              product: product,
                            );
                          });
                  }
                }),
          )
        ]))
      ],
    );
  }
}
