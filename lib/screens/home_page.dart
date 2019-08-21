import 'package:e_commerce/states/home_state.dart';
import 'package:e_commerce/widgets/OffersBanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeState homeState = Provider.of<HomeState>(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          ListView.builder(
            itemBuilder: (context, pos) {
              return Container(
                color: Colors.redAccent,
              );
            },
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          )
        ]))
      ],
    );
  }
}
