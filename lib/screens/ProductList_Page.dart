import 'package:flutter/material.dart';
import 'package:e_commerce/screens/Detail_Page.dart';

//import 'package:e_commerce/model/Product.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:e_commerce/widgets/ProductCard.dart';

//TODO add repo method to get products according to category

class ProductListPage extends StatefulWidget {
  final String categoryName;
  final int categoryId;

  ProductListPage({@required this.categoryName, @required this.categoryId});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Repository repo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo = Repository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Color(0xFFf3f6fb),
      appBar: AppBar(
//        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
//              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          widget.categoryName,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: repo.getProductForCategory(widget.categoryId.toString()),
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
                if (snapshot.hasError)
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GridView.builder(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .75,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 1),
                      itemBuilder: (context, pos) {
                        Product product = snapshot.data[pos];
                        return ProductDisplayCard(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(product)));
                            },
                            product: product);
                      }),
                );
            }
          }),
    );
  }
}
