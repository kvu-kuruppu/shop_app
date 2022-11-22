import 'package:flutter/material.dart';
import 'package:shop_app/screens/bottom_bar/cart.dart';
import 'package:shop_app/screens/bottom_bar/home.dart';
import 'package:shop_app/screens/bottom_bar/message.dart';
import 'package:shop_app/screens/bottom_bar/profile.dart';
import 'package:shop_app/screens/bottom_bar/category_screen.dart';

class BottomBar extends StatefulWidget {
  final int? index;

  const BottomBar({Key? key, this.index}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    const Home(),
    const CategoryScreen(),
    const Message(),
    const Cart(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    if (widget.index != null) {
      setState(() {
        _selectedIndex = widget.index!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color.fromARGB(78, 25, 2, 156)),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 10.0,
          selectedFontSize: 16,
          selectedIconTheme: const IconThemeData(size: 30),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: const Color.fromARGB(255, 25, 2, 156),
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
