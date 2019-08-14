import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart';

class TopAppBar extends StatelessWidget {
  Function onCartIconPress, onProfileIconPress;
  String profileImage, subtitle;

  TopAppBar(
      {this.onCartIconPress,
      this.onProfileIconPress,
      this.profileImage,
      this.subtitle = "What do you want to shop for?"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: 22, top: 20, bottom: 4),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//              GestureDetector(
//                onTap: onProfileIconPress,
//                child: CircleAvatar(
//                  maxRadius: 22,
//                  backgroundImage: AssetImage(profileImage),
//                  backgroundColor: Colors.transparent,
//                ),
//              ),
//              Badge(
//                badgeContent: Text(
//                  '2',
//                  style: TextStyle(color: Colors.white,fontSize: 10),
//                ),
//                child: Icon(Icons.shopping_cart),
//              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 170,
              child: Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
