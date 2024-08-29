import 'package:flutter/material.dart';

import 'AllProducts_screen.dart';
import 'category.dart';

import 'category_list.dart';
import 'profile.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  int currentIndex = 0;
  List<Widget> Screens = [
    AllproductsScreenScreen(),
    Categorys(),
    CategoryList(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          // BottomNavigationBarItem(backgroundColor: Colors.black54,icon: Icon(Icons.person,), label: "profile"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black54,
              icon: Icon(Icons.shopping_bag),
              label: "makeup"),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_android), label: "phones"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "list"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "profile"),
        ],
      ),
    );
  }
}
