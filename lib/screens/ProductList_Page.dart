import 'package:flutter/material.dart';
import 'package:e_commerce/screens/Detail_Page.dart';
import 'package:e_commerce/model/Product.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
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
      body: GridView.builder(
          itemCount: mayLikeProductList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: .6),
          itemBuilder: (context, pos) {
            Product product = mayLikeProductList[pos];
            return ProductDisplayCard(product: product);
          }),
    );
  }
}

class ProductDisplayCard extends StatelessWidget {
  const ProductDisplayCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product)));
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(tag: product.id, child: Image.network(product.imageUrl)),
            Row(
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                  ),
                ),
                Spacer(),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.turned_in_not,
                      color: Colors.black54,
                    )),
              ],
            ),
            Text(
              product.summary,
              style: TextStyle(fontFamily: 'Raleway', fontSize: 12),
            ),
            Text(
              product.price,
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
