import 'package:flutter/material.dart';
import 'package:e_commerce/states/theme_changer.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static String id = "ProfilePage", title = 'Profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Container(
      child: Center(
        child: FlatButton.icon(
            onPressed: () {
              _themeChanger.isDark
                  ? _themeChanger.setLightTheme()
                  : _themeChanger.setDarkTheme();
            },
            icon: Icon(
              Icons.lightbulb_outline,
              color: _themeChanger.isDark ? Colors.redAccent : Colors.black87,
            ),
            label: Text(
              'Change Theme'.toUpperCase(),
              style: TextStyle(
                color: _themeChanger.isDark ? Colors.redAccent : Colors.black87,
              ),
            )),
      ),
    );
  }
}
