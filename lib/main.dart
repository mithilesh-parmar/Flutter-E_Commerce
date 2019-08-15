import 'package:e_commerce/screens/home.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/Category_Page.dart';
import 'screens/Cart_Page.dart';
import 'screens/Profile_page.dart';
import 'screens/Detail_Page.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:badges/badges.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      initialRoute: MyApp.id,
      routes: {
        MyApp.id: (context) => MyApp(),
      },
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  static String id = "MyApp";

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static Widget _homeScreen = HomePage();
  static Widget _categoryScreen = CategoryPage();
  static Widget _profileScreen = ProfilePage();
  static Widget _cartScreen = CartPage();
  bool isDark = false;
  Widget _selectedScreen = _homeScreen;
  List<Widget> screens = [
    _homeScreen,
    _categoryScreen,
    _cartScreen,
    _profileScreen,
  ];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedScreen = screens[index];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Center(
              child: IconBadge(
                icon: Feather.getIconData("shopping-cart"),
              ),
            ),
            SizedBox(width: 20),
            Center(
                child: IconButton(
                    icon: Icon(Icons.bubble_chart),
                    onPressed: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    })),
            SizedBox(
              width: 20,
            )
          ],
        ),
        key: _scaffoldKey,
        body: _selectedScreen,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(
                Icons.home,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text('Category'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              title: Text('Cart'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              title: Text('User'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
