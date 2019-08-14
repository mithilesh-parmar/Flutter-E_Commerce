import 'package:flutter/material.dart';
import 'package:e_commerce/screens/Detail_Page.dart';

//import 'package:e_commerce/model/Product.dart';
import 'package:e_commerce/util/repo.dart';
import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:e_commerce/widgets/ProductCard.dart';

class ProductListPage extends StatefulWidget {
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
          'Products',
          style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: repo.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .75),
                  itemBuilder: (context, pos) {
                    Product product = snapshot.data[pos];
                    return ProductDisplayCard(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailPage(product: product)));
                        },
                        product: product);
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
