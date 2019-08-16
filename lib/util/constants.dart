import 'package:flutter/material.dart';
class Constants {
  static const CONSUMER_KEY = 'ck_4efd056436dc573fe47c851f065827c67fd6546b';
  static final CONSUMER_SECRET = 'cs_a3dd6df42eb69bd172df11fc580a0ad956ca2ca8';
  static final CONSUMER_KEY_CLOUD =
      'ck_fc75eb207e9e48ecc852fbfdd9461f112ef9d860';
  static final CONSUMER_SECRET_CLOUD =
      'cs_998324c7091df9dd256117dcf6105865f155de78';

  var auth =
      "Basic Y2tfZmM3NWViMjA3ZTllNDhlY2M4NTJmYmZkZDk0NjFmMTEyZWY5ZDg2MDpjc185OTgzMjRjNzA5MWRmOWRkMjU2MTE3ZGNmNjEwNTg2NWYxNTVkZTc4";

  static var auth_cloud =
      "Basic Y2tfZmM3NWViMjA3ZTllNDhlY2M4NTJmYmZkZDk0NjFmMTEyZWY5ZDg2MDpjc185OTgzMjRjNzA5MWRmOWRkMjU2MTE3ZGNmNjEwNTg2NWYxNTVkZTc4";

  static final url =
      'http://192.168.64.2/wordpress/index.php/wp-json/wc/v3/products';
  static final URL_CLOUD =
      'https://mastigophoran-miner.000webhostapp.com/wp-json/wc/v3/products';


  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.orange;
  static Color darkAccent = Colors.orangeAccent;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor:  lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    hintColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

}
