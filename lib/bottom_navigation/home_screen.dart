import 'package:flutter/material.dart';

import 'AllProducts_screen.dart';
import 'category.dart';

import 'profile.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  int currentIndex = 0;
  List<Widget> Screens = [Profile(), AllproductsScreenScreen(), Categorys()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "makeup"),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_android), label: "phones"),
        ],
      ),
    );
  }
}
