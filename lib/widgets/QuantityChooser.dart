import 'package:flutter/material.dart';

class QuantityChooser extends StatefulWidget {
  @override
  _QuantityChooserState createState() => _QuantityChooserState();
}

class _QuantityChooserState extends State<QuantityChooser> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                quantity++;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).textTheme.title.color)),
              child: Center(
                child: Text('+'),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Center(
              child: Text(quantity.toString()),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (quantity != 1) {
                  quantity--;
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).textTheme.title.color)),
              child: Center(
                child: Text('-'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
