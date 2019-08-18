import 'package:e_commerce/util/constants.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String iconText, heading;
  final IconData icon;
  final Function onPressed;

  HeaderWidget({this.iconText, this.heading, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          heading,
          style: TextStyle(
              fontSize: Constants.screenAwareSize(23, context),
              fontWeight: FontWeight.w600),
        ),
        Spacer(),
        FlatButton.icon(
            onPressed: onPressed,
            icon: Icon(icon),
            label: Text(
              iconText,
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: Constants.screenAwareSize(14, context)),
            ))
      ],
    );
  }
}
