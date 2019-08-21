import 'package:e_commerce/screens/home.dart';
import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/states/cart_state.dart';
import 'package:e_commerce/states/category_state.dart';
import 'package:e_commerce/states/home_state.dart';
import 'package:e_commerce/states/theme_changer.dart';

//import 'package:e_commerce/states/app_state.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/Search_Page.dart';
import 'screens/Cart_Page.dart';
import 'screens/Profile_page.dart';
import 'screens/Detail_Page.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => ThemeChanger(Constants.lightTheme, false),
        ),
        ChangeNotifierProvider(
          builder: (_) => CartState(),
        ),
        ChangeNotifierProvider(
          builder: (_) => HomeState(),
        ),
        ChangeNotifierProvider(
          builder: (_) => CategoryState(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  static String id = "MyApp";

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static HomePage _homeScreen = HomePage();
  static SearchPage _categoryScreen = SearchPage();
  static ProfilePage _profileScreen = ProfilePage();
  static CartPage _cartScreen = CartPage();

  Widget _selectedScreen = _homeScreen;
  List<dynamic> screens = [
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
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Constants.darkBG,
        systemNavigationBarIconBrightness: Brightness.light));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: themeChanger.getTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'E-Commerce',
            style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
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
                Icons.search,
              ),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
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
