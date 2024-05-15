import 'package:classwork_1/bottom_screen/about_screen.dart';
import 'package:classwork_1/bottom_screen/cart_screen.dart';
import 'package:classwork_1/bottom_screen/home_screen.dart';
import 'package:classwork_1/bottom_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Screen"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white70,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey.shade600,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      // body: Center(
      //   child: Text(
      //     "Dashboard",
      //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //   ),
      // ),
    );
  }
}
