import 'package:flutter/material.dart';
import 'package:flutter_icons/feather.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          padding: EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Icon(
            Feather.getIconData("heart"),
            color: Theme.of(context).textTheme.title.color,
          ),
          duration: Duration(milliseconds: 100),
        ),
      ),
    );
  }
}
