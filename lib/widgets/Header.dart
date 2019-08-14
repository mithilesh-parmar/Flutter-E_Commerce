import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  var iconText, heading;
  IconData icon;
  Function onPressed;

  HeaderWidget({this.iconText, this.heading, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          heading,
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        FlatButton.icon(
            onPressed: onPressed,
            icon: Icon(icon),
            label: Text(
              iconText,
              style: TextStyle(fontFamily: 'Raleway'),
            ))
      ],
    );
  }
}
