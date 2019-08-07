import 'package:flutter/material.dart';
import 'screens/Home.dart';
import 'screens/Category_Page.dart';
import 'screens/Cart_Page.dart';
import 'screens/Profile_page.dart';
import 'screens/Detail_Page.dart';

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

  Widget _selectedScreen = _homeScreen;
  List<Widget> screens = [
    _homeScreen,
    _categoryScreen,
    _cartScreen,
    _profileScreen,
  ];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedScreen = screens[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f6fb),
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
    );
  }
}
