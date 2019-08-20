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

class HomePage extends StatefulWidget {
  static String title = 'Home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchControl = new TextEditingController();
  Repository repo;

  Future<List<Product>> _trendingProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo = Repository();
    _trendingProducts = _getTrendingProducts();
  }

  Future<List<Product>> _getTrendingProducts() async {
    return await repo.getProducts();
  }

  final imageList = [
    'https://assets.myntassets.com/w_980,c_limit,fl_progressive,dpr_2.0/assets/images/banners/2019/8/2/1f55b32d-a54f-4130-8de6-142167685e941564742794212-desktop.jpg',
    'https://assets.myntassets.com/w_980,c_limit,fl_progressive,dpr_2.0/assets/images/banners/2019/8/3/8e251762-1833-4490-9612-67c11877b2d61564848407937-Gerua_Desk_Banner.jpg',
    'https://assets.myntassets.com/w_980,c_limit,fl_progressive,dpr_2.0/assets/images/banners/2019/8/3/8fe43105-e031-4271-b66a-017abefd25ba1564848407967-Highlander_Desk_Banner.jpg',
    'https://assets.myntassets.com/w_980,c_limit,fl_progressive,dpr_2.0/assets/images/banners/2019/8/3/c0232ddd-5017-4dbe-8cf8-108e4a111b0a1564848407994-Jockey_Desk_Banner.jpg',
    'https://assets.myntassets.com/w_980,c_limit,fl_progressive,dpr_2.0/assets/images/banners/2019/8/3/71cbabc8-2fdf-42b9-8179-4cd136aa5f5b1564848408043-Only_Desk_Banner.jpg',
    'https://assets.myntassets.com/w_980,c_limit,fl_progressive,dpr_2.0/assets/images/banners/2019/8/3/c27bc5ae-17dc-4326-b44c-f761da6e48fe1564848408020-Portico_Desk_Banner.jpg',
  ];

  @override
  Widget build(BuildContext context) {
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
          FutureBuilder(
              future: _trendingProducts,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Cannot Connect to server try in some time');
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
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
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .6,
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1),
                        itemBuilder: (context, pos) {
                          Product product = snapshot.data[pos];
                          return ProductDisplayCard(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(product)));
                            },
                            product: product,
                          );
                        });
                }
              })
        ])),
      ],
    );
  }
}
