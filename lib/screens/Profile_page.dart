import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static String id = "ProfilePage", title = 'Profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton.icon(
            onPressed: () {},
            icon: Icon(Icons.lightbulb_outline),
            label: Text('Under Construction'.toUpperCase())),
      ),
    );
  }
}
