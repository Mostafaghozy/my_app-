import 'package:flutter/material.dart';

class HomeScreen1 extends StatefulWidget {
  HomeScreen1({super.key, required this.email});
  String email;
  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Container(color: Colors.blue,height: 250,
               child: Text(
                 "ONE",
                 style: TextStyle(
                     backgroundColor: Colors.green,
                     fontSize: 20,
                     color: Colors.white),
               ),
             ),
              Container(color: Colors.blue,height: 550,
                child: Text(
                  "TWO",
                  style: TextStyle(
                      backgroundColor: Colors.brown,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Text(
                "THREE",
                style: TextStyle(
                    backgroundColor: Colors.yellow,
                    fontSize: 20,
                    color: Colors.blue),
              ),
              Text(
                "FOUR",
                style: TextStyle(
                    backgroundColor: Colors.orange,
                    fontSize: 20,
                    color: Colors.white),
              ),
              Text("email: ${widget.email}")
            ],
          ),
        ),
      ),
    );
  }
}
